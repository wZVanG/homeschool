<?php
    
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuario extends MY_Controller {

	public function __construct(){
        
        parent::__construct();
        $this->load->model('usuarios_model');
                
    }
    
    public function guardar(){

        $_POST = json_decode(file_get_contents('php://input'), true);

        $tipo = $this->input->post_get("tipo", "perfil");

        $fields = [];
        $message = [];

        switch($tipo){
            case 'password': 
                $info = [
                    "old_password" => $this->input->post_get("old_password", ""),
                    "new_password" => $this->input->post_get("new_password", "")
                ];

                $id_usuario = $this->usuario_class->get_info("id_usuario");

                $clave_actual = $this->db->get_where("usuarios", ["id_usuario" => $id_usuario]);
                $clave_actual = $clave_actual->row_array();

                if(!$clave_actual) return error("No se encontró el usuario");

                $compare = password_verify($info["old_password"], $clave_actual["clave"]);

                if(!$compare) return error("Contraseña incorrecta");

                $fields["clave"] = password_hash($info["new_password"], PASSWORD_BCRYPT);
                
                $message["error"] = "Error al actualizar contraseña";
                $message["success"] = "Contraseña actualizada correctamente";

                break;

            case "firma":

                $fields = [
                    "archivo_1" => $this->input->post_get("archivo_1", ""),
                    "archivo_2" => $this->input->post_get("archivo_2", ""),
                    "clave_publica" => $this->input->post_get("clave_publica", ""),
                ];

                $message["error"] = "Error al actualizar firma, intente nuevamente";
                $message["success"] = "Firma actualizada correctamente";

                break;

            default:

                $fields = [
                    "email" => $this->input->post_get("email", ""),
                    "celular" => $this->input->post_get("celular", ""),
                    "ubigeo" => $this->input->post_get("ubigeo", ""),
                    "direccion" => $this->input->post_get("direccion", ""),
        //            "fecha" => date("Y-m-d H:i:s"),
          //          "fecha_actualizacion" => date("Y-m-d H:i:s"),
                ];

                $message["error"] = "Error al actualizar usuario, intente nuevamente";
                $message["success"] = "Datos actualizados correctamente";
        }

        $update = $this->usuario_class->set_info($fields);

        if(!$update) return error($message["error"]);

        return json(["ok" => 1, "mensaje" => $message["success"]]);

    }

        
    public function upload(){

        $config = [];

        $config['upload_path']          = './uploads/avatars/';
        $config['allowed_types']        = 'jpg|gif|png|jpeg';
        $config['max_size']             = 2048; //2048kb
        $config['file_ext_tolower']     = true;
        $config['encrypt_name']         = true;

        $this->load->library('upload', $config);

        if ( ! $this->upload->do_upload('file')){
                $error_str = $this->upload->display_errors();
                if(preg_match("/allowed/", $error_str)) $error_str = "El archivo enviado no está permitido";
                error($error_str);
        } else{
                
                $upload_data = $this->upload->data();

                //Resize
                $config['image_library'] = 'gd2';
                $config['source_image'] = $upload_data['full_path'];
                $config['maintain_ratio'] = FALSE;
                $config['width']     = 128;
                $config['height']   = 128;
                $this->load->library('image_lib', $config); 
                $this->image_lib->resize();
                //resize

                $this->usuario_class->set_info(["foto" => $upload_data["file_name"]]);

                $data = array('upload_data' => $upload_data);
                json($data);
        }
    }

    public function signload(){

        $config = [];

        $config['upload_path']          = './uploads/firmas/';
        $config['allowed_types']        = 'jpg|gif|png|jpeg|cer|key|txt';
        $config['max_size']             = 2048; //2048kb
        $config['file_ext_tolower']     = true;
        $config['encrypt_name']         = true;

        $this->load->library('upload', $config);

        if ( ! $this->upload->do_upload('file')){
                $error_str = $this->upload->display_errors();
                
                if(preg_match("/allowed/", $error_str)) $error_str = "El archivo enviado no está permitido";
                error($error_str);
        } else{
                
                $upload_data = $this->upload->data();

                $firma_numero = $this->input->post_get("firma_numero", "");

                $this->usuario_class->set_info(["archivo_" . $firma_numero => $upload_data["file_name"]]);

                $data = array('upload_data' => $upload_data);
                json($data);
        }
    }

}
