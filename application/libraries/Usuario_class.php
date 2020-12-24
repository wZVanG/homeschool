<?php
    
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuario_class {

    var $info = null;
    var $id = 0;
    var $id_sede = 1;
    var $id_institucion = 1;

	public function __construct(){
                
        $this->ci = &get_instance();
        
        if(isset($_SESSION["id_usuario"])){
            $user_data = $this->ci->session->get_userdata();
            $query = $this->ci->db->get_where("vista_usuarios", ["id_usuario" => $user_data["id_usuario"]]);
            $this->info = $query->num_rows() ? $query->row_array() : null;
            $this->id = (int) $user_data["id_usuario"];
            $this->id_sede = 1;

   
        }
        
	}

	public function get_info($key = null){

        return $key === null ? $this->info : ($this->info ? $this->info[$key] : null);

    }
    
    public function set_info($info){
        
        
        $data = $this->ci->session->get_userdata();
        $id_usuario = is_array($data) && !empty($data["id_usuario"]) ? (int) $data["id_usuario"] : 0;

        if(!$id_usuario) return false;

        //Buscamos id_persona
        $this->ci->db->select("id_persona");
        $query = $this->ci->db->get_where("usuarios", ["id_usuario" => $id_usuario]);
        $row = $query->row_array();
        if(!$row) return false;

        if(isset($info["clave"])){

            $update = $this->ci->db->update('usuarios', $info, ["id_usuario" => $id_usuario]);
    
        }else{
           
            $update = $this->ci->db->update('personas', $info, ["id_persona" => $row["id_persona"]]);

        }

        return !!$update;

    }

    public function institucionData($id_institucion = 1){

        $institucion = $this->ci->db->get_where("institucion", ["id_institucion" => $id_institucion]);
		$institucion = $institucion->row_array();
        
        $configuracion_externo = [
            "archivos_permitidos" => "pdf",
            "id_tipo_documento" => 1,
            "terminos" => "",
            "tamanho" => 2048,
            "id_usuario" => 2,
            "id_oficina" => [1],

            "tipo_documento_defecto" => 1,  
            "url_centro_ayuda" => "", 
            "movie_id" => [], 
            "texto_centro_ayuda" => "",
            "url_centro_ayuda" => "",
            "texto_terminos_condiciones" => "",
            "url_terminos_condiciones" => "",
            "telefono" => "",
            "email" => "",
            "whatsapp" => "",
            "externo_social" => ""
        ];
        
        $externo_social = [];

        try{
            $institucion["configuracion"] = json_decode($institucion["configuracion"], true);
            $configuracion_externo = array_merge($configuracion_externo, $institucion["configuracion"]["externo"]);

            $externo_social = preg_split("/\n/s", $configuracion_externo["externo_social"]);
                        
            $replacers = [
                "base" => base_url(),
            ];

            foreach($externo_social AS $key => $item){
                $externo_social[$key] = preg_replace('/^\s*-\s*/', '', preg_replace_callback('/\$(\w+)/', function($a) use($replacers){
                    return isset($replacers[$a[1]]) ? $replacers[$a[1]] : $a[1];
                }, $item));

                $externo_social[$key] = explode("@@", $externo_social[$key]);
                $externo_social[$key] = [
                    "title" => isset($externo_social[$key][0]) ? trim($externo_social[$key][0]) : "",
                    "url" => isset($externo_social[$key][1]) ? trim($externo_social[$key][1]) : "",
                    "image" => isset($externo_social[$key][2]) ? trim($externo_social[$key][2]) : "",
                ];
            }

            $institucion["configuracion"]["externo"] = $configuracion_externo;
            
            $institucion["configuracion"]["externo"]["externo_social"] = $externo_social;
          
        }catch(Exception $e){}

        return $institucion;


    }
}
