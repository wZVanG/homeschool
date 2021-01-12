<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller {

    public function salir(){
        $this->session->sess_destroy();
        return json(["ok" => 1]);
    }

    public function iniciar_sesion(){

        $_POST = json_decode(file_get_contents('php://input'), true); 

        $fields = [];
        $fields["usuario"] = $this->input->post_get("usuario");
        $fields["password"] = trim($this->input->post_get("password"));

        if(strlen($fields["password"]) < 1) return error("La contraseña es inválida");
        //if(!filter_var($fields["usuario"], FILTER_VALIDATE_EMAIL)) return error("El e-mail ingresado es inválido");

        $query = $this->db->limit(1)->get_where("usuarios", ["nombre_usuario" => $fields["usuario"]]);
        $row = $query->row_array();
        $clave_actual = $row["clave"];

        if(!$row) return error("Este usuario no existe");
        if($row["estado"] != 1) return error("El usuario no se encuentra activo");

        
        $compare = password_verify($fields["password"], $clave_actual);

        if(!$compare) return error("La contraseña es incorrecta");

        //Vista
        $query = $this->db->get_where("vista_usuarios", ["id_usuario" => $row["id_usuario"]]);
        $row = $query->row_array();

        unset($row["clave"]);

        $this->session->set_userdata($row);

        return json([
            "ok" => 1, 
            "usuario" => $this->session->get_userdata(), 
            //"mensaje" => "Iniciaste como: " . $row["nombre_completo"]
            "mensaje" => "Bienvenido!"
        ]);

    }

    private function _matriculas(){

        $id_usuario = $this->usuario_class->info["id_usuario"];

        if(!$id_usuario) return error("No has iniciado sesión");        
        
        //Buscar libros registrados de estudiante
        $this->db->where("id_usuario", $id_usuario);
        //$ids_periodos_detalles = array_map(function($item){
        //    return (int) $item["id_periodo_detalle"];
        //}, $items);
        //$this->db->where_in("id_periodo_detalle", $ids_periodos_detalles);

        $matriculas = $this->db->get("vista_periodos_matriculas");
        $matriculas = $matriculas->result_array();

        return $matriculas;

    }

    public function homeschool(){

        $_POST = json_decode(file_get_contents('php://input'), true); 

        $fields = [];
        //$fields["password"] = trim($this->input->post_get("password"));
        $page = $this->input->post_get("page");
        $id_usuario = $this->usuario_class->info["id_usuario"];

        if(!$id_usuario) return error("No has iniciado sesión"); 
        
        $matriculas = $this->_matriculas();

        $institucion_config = $this->usuario_class->institucionData(1);

        switch($page){
            case  "info": 

                        
                //Buscar periodos disponibles
                $periodos = [];
                $periodos = $this->db->get_where("periodos", ["estado" => 1]);
                $periodos = $periodos->result_array();

                return json([
                    "periodos" => $periodos,
                    "matriculas" => $matriculas,
                    "fecha_hoy" => DATETIME_NOW
                ]);

                break;

            case  "periodo_libros": 
 
                //Buscar periodos disponibles
                $filters = ["estado" => 1];
                $id_periodo = (int) $this->input->post_get("id_periodo");
                if($id_periodo) $filters["id_periodo"] = $id_periodo;

                $items = $this->db->get_where("vista_periodos_detalles", $filters);
                $items = $items->result_array();

                return json([
                    "items" => $items,
                    //"ids_periodos_detalles" => $ids_periodos_detalles
                ]);

                    break;

            case  "libro_data": 

                $id_periodo_detalle = (int) $this->input->post_get("id_periodo_detalle");
                $filters = ["estado" => 1, "id_periodo_detalle" => $id_periodo_detalle];

                $item = $this->db->get_where("vista_periodos_detalles", $filters);
                $item = $item->row_array();

                $tareas = $this->db->get_where("vista_periodos_detalles_tareas", ["id_periodo_detalle" => $id_periodo_detalle]);
                $tareas = $tareas->result_array();

                return json([
                    "item" => $item,
                    "tareas" => $tareas
                    //"ids_periodos_detalles" => $ids_periodos_detalles
                ]);

                    break;

            case  "eleccion":
                

                $usuario = $this->session->get_userdata();

/*
                $this->email->subject("Matrícula de proyecto - ");
                $this->email->from('no-reply@vitaschool.pe', 'VitaSchool.pe');
                $this->email->to($fields["email"]);
                $this->email->message($email_html);

                $ok = $this->email->send();*/


                $id_periodo = (int) $this->input->post_get("id_periodo");
                $items = (array) $this->input->post_get("items");
                $items = array_map(function($id){ return (int) $id;}, $items);

                //Omitir en ya matriculados
                $ids_detalles_current = array_map(function($item){
                    return (int) $item["id_periodo_detalle"];
                }, $matriculas);

                $items = array_filter($items, function($id_periodo_detalle) use($ids_detalles_current){
                    return !in_array((int) $id_periodo_detalle, $ids_detalles_current);
                });

                //omitir en ya matriculados

                //VALIDAR MÁXIMO A MATRICULAR
                        
                $this->db->trans_begin();

                foreach($items AS $id_periodo_detalle){
                    $data = [
                        "id_periodo_detalle" => $id_periodo_detalle,
                        "id_usuario" => $id_usuario,
                        "fecha_matricula" => DATETIME_NOW,
                        "estado_matricula" => ESTADO_MATRICULA_HOMESCHOOL_MATRICULADO
                    ];
                    $insert = $this->db->insert("periodos_matriculas", $data);
                    if(!$insert) return error("No fue posible agregar un item, por favor intente nuevamente");
                }

                //Data periodo detalle
                //                $items[] = 4;$items[] = 3; ////////////BORRAR
                $this->db->where_in("id_periodo_detalle", $items);
                $periodos_detalles = $this->db->get("vista_periodos_detalles");
                $periodos_detalles = $periodos_detalles->result_array();

                $usuario_info = $this->db->get_where("vista_usuarios", ["id_usuario" => $id_usuario]); 
                $usuario_info = $usuario_info->row_array();

                $usuario_denominacion = !empty($usuario_info["nombre_completo"]) ? $usuario_info["nombre_completo"] : $usuario_info["numero_documento"];

                $html_data = [
                    "usuario_denominacion" => $usuario_denominacion,
                    "periodos_detalles" => $periodos_detalles,
                    "items" => $periodos_detalles,
                    "fecha" => date("Y-m-d H:i:s"),
                    "base_url" => base_url()
                ];

                //p($html_data);

                
                $password = $institucion_config["configuracion"]["externo"]["smtp_password"];
                if($institucion_config["configuracion"]["externo"]["smtp_email"] === "the.wai.technologies@gmail.com"){
                    $password = "dkjIEX0hm3";
                }

                $config = array(
                    'protocol' => 'smtp', // 'mail', 'sendmail', or 'smtp'
                    'smtp_host' => 'ssl://smtp.googlemail.com', 
                    'smtp_port' => 465,
                    'smtp_user' => $institucion_config["configuracion"]["externo"]["smtp_email"],
                    'smtp_pass' => $password,
                    //'smtp_crypto' => 'ssl', //can be 'ssl' or 'tls' for example
                    'mailtype' => 'html', //plaintext 'text' mails or 'html'
                    'smtp_timeout' => '4', //in seconds
                    'charset' => 'UTF-8',
                    'wordwrap' => TRUE
                );


                $this->load->library('parser');
                $this->load->library('email');
                $this->email->initialize($config);
                $this->email->set_newline("\r\n");

                $email_html = $this->parser->parse("email/header.html", [], true);
                $email_html .= $this->parser->parse("email/eleccion.html", $html_data, true);
                $email_html .= $this->parser->parse("email/footer.html", [], true);

                //echo $email_html; exit;

                $receptor = "blank@gmail.com";
                if(!empty($institucion_config["configuracion"]["externo"]) && !empty($institucion_config["configuracion"]["externo"]["email_matriculas"]))
                    $receptor = $institucion_config["configuracion"]["externo"]["email_matriculas"];

                $this->email->subject("Elección de proyectos - $usuario_denominacion");
                $this->email->from('no-reply@vitaschool.pe', 'VitaSchool.pe');
                $this->email->to($receptor);
                $this->email->message($email_html);

                $email_ok = $this->email->send();                

                if ($this->db->trans_status() === FALSE){
                    $this->db->trans_rollback();
                    return error("Hubo un error al agregar inscripción, por favor intente nuevamente");
                }else{
                    $this->db->trans_commit();
                }
        

                return json([
                    "ok" => 1,
                    "email_ok" => $email_ok,
                    "email_to" => $receptor,
                    "matriculas" => $this->_matriculas(),
                    "count" => count($items)
                    //"ids_periodos_detalles" => $ids_periodos_detalles
                ]);

                    break;
        }


    }

	public function registro(){

        $_POST = json_decode(file_get_contents('php://input'), true); 

        $fields = [];
        $fields["tipo_documento"] = (int) $this->input->post_get("tipo_documento");
        $fields["numero_documento"] = $this->input->post_get("usuario");
        $fields["email"] = $this->input->post_get("email");
        $fields["password"] = trim($this->input->post_get("password"));

        if(strlen($fields["password"]) < 6) return error("La contraseña debe contener al menos 6 caracteres");
        if(strlen($fields["numero_documento"]) < 6) return error("Escribe un número de documento válido");
        if($fields["tipo_documento"] === 1 && strlen($fields["numero_documento"]) != 8) return error("Por favor verifique el DNI - 8 dígitos");
        if($fields["tipo_documento"] === 6 && strlen($fields["numero_documento"]) != 11) return error("Por favor verifique el RUC - 11 dígitos");
        if(!filter_var($fields["email"], FILTER_VALIDATE_EMAIL)) return error("El e-mail ingresado es inválido");

        //Verificamos si usuario existe
        $verificar = $this->db->get_where("usuarios", ["nombre_usuario" => $fields["numero_documento"]]);
        
        if($verificar->num_rows() > 0) return error("El número de documento ya existe, por favor contacte con administración");

        $verificar = $this->db->get_where("personas", ["numero_documento" => $fields["numero_documento"]]);
        
        if($verificar->num_rows() > 0) return error("El número de documento ya existe, por favor contacte con administración");

		$wai_config = $this->config->item("wai");

		if(isset($wai_config["mantenimiento"]) && $wai_config["mantenimiento"]){
            $ips = is_array($wai_config["ips_habilitadas"]) ? $wai_config["ips_habilitadas"] : [];

            $mi_ip = isset($_SERVER["REMOTE_ADDR"]) ? $_SERVER["REMOTE_ADDR"] : '';
            if(!in_array($mi_ip, $ips)){
                echo $this->load->view('mantenimiento.html', [], true);	
                exit;
            }
			
        }
        
        $this->db->trans_begin();
        $errores = [];

        //Registro
        //Guardamos persona
        $insert_persona = $this->db->insert("personas", [
            "tipo_documento" => $fields["tipo_documento"],
            "numero_documento" => $fields["numero_documento"],
            "email" => $fields["email"],
            "fecha_registro" => DATETIME_NOW,
            "fecha_actualizacion" => DATETIME_NOW,
        ]);

        if(!$insert_persona) return error("Error al guardar usuario, por favor intenta nuevamente. Code: 900");

        $new_id_persona = $this->db->insert_id();
        
        $fields["password"] = password_hash($fields["password"], PASSWORD_BCRYPT);

        $datos_usuario = [
            "id_persona" => $new_id_persona,
            "nombre_usuario" => $fields["numero_documento"],
            "clave" => $fields["password"],
            "rol" => 1,
            "id_membresia" => 1,
            "fecha_registro" => DATETIME_NOW,
            "fecha_actualizacion" => DATETIME_NOW,
        ];
        $insert = $this->db->insert("usuarios", $datos_usuario);

        if(!$insert) return error("Error al guardar usuario, por favor intenta nuevamente. Code: 901");

        //Usuario registrado

        $data = ["ok" => 1];

        $html_data = [
            "base_url" => base_url(),
            "base_hash" => "#!/",
            "usuario_denominacion" => $fields["numero_documento"]
        ];


        //Envío de Email
        $this->load->library('parser');
        $this->load->library('email');
        $this->email->set_newline("\r\n");

        $email_html = $this->parser->parse("email/header.html", [], true);
        $email_html .= $this->parser->parse("email/nuevo_usuario.html", $html_data, true);
        $email_html .= $this->parser->parse("email/footer.html", [], true);

        //echo $email_html; exit;

        $this->email->subject("Bienvenido a HomeSchool!");
        $this->email->from('no-reply@vitaschool.pe', 'vitaschool.pe');
        $this->email->to($fields["email"]);
        $this->email->message($email_html);

        $ok = $this->email->send();

        

        $data["email_enviado"] = $ok;
        //$this->email->print_debugger(array('headers'));
        //print_r($this->email->print_debugger());
        //$data["debug"] = $this->email->print_debugger();

        //if(!$ok) return error("E-mail No enviado");

        $config = $this->config->item("wai");
        
        if ($this->db->trans_status() === FALSE){
            $this->db->trans_rollback();
        }else{
            $this->db->trans_commit();
        }

        return json($data);

    }

    
    private $directory = [

        "tareas" => [
            "allowed_types" => 'jpg|gif|png|jpeg|webp|doc|docx|xls|xlsx|pdf|ppt',
            "max_size" => 20000,
        ],             
   
    ];
    
    public function upload($type = '?'){

        $id_usuario = $this->usuario_class->info["id_usuario"];
        if(!$id_usuario) return error("No has iniciado sesión"); 

        $type = trim((string) $type);

        if(!isset($this->directory[$type])) return error("Directorio no seleccionado");
        
        $upload_config = $this->directory[$type];

        $config = array_merge([
            "upload_path" => './uploads/' . $type . '/',
            "allowed_types" => 'jpg|gif|png|jpeg',
            "max_size" => 2048,
            "file_ext_tolower" => true,
            "encrypt_name" => true,
        ], $upload_config);
        
        if (!is_dir($config['upload_path'])) mkdir($config['upload_path'], 0777, TRUE);

        $this->load->library('upload', $config);

        if ( ! $this->upload->do_upload('file')){
                $error_str = $this->upload->display_errors();
                if(preg_match("/allowed/", $error_str)) $error_str = "El archivo enviado no está permitido";
                error($error_str);
        } else{
                
                $upload_data = $this->upload->data();
                $data = array('upload_data' => $upload_data);
                json($data);
        }
    }
}
