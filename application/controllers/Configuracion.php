<?php
    
defined('BASEPATH') OR exit('No direct script access allowed');

class Configuracion extends CI_controller {

	public function __construct(){
        
        parent::__construct();
        
	}

	public function info(){
        
        $data = [];

        $id_institucion = isset($this->usuario_class->id_institucion) ? $this->usuario_class->id_institucion : 1;

        $info_actual = $this->db->get_where("institucion", ["id_institucion" => $id_institucion]);
        $info_actual = $info_actual->row_array();

        if(!$info_actual) $info_actual = [];
        
        if(empty($info_actual["configuracion"])) $info_actual["configuracion"] = '{}';

        try{
            $info_actual["configuracion"] = json_decode($info_actual["configuracion"]);
        }catch(Exception $e){
            $info_actual["configuracion"] = [];
        }

        $data["institucion"] = $info_actual;

        return json($data);

    }
    
    public function guardar(){

        if(!$this->usuario_class->info || $this->usuario_class->info["rol"] != 3) return error("No tienes permisos para realizar esta acción");

        $_POST = json_decode(file_get_contents('php://input'), true);

        $tipo = $this->input->post_get("tipo");
        $subtipo = $this->input->post_get("subtipo");

        $id_institucion = isset($this->usuario_class->id_institucion) ? $this->usuario_class->id_institucion : 1;
        $info_actual = $this->db->get_where("institucion", ["id_institucion" => 1]);
        $info_actual = $info_actual->row_array();

        if(!$info_actual) return error("No se encontró la institución");

        $config_actual = !empty($info_actual["configuracion"]) ? $info_actual["configuracion"] : '{}';

        try{
            $config_actual = json_decode($config_actual, true);
        }catch(Exception $e){
            return error("No fue posible obtener la configuración actual de la institución");
        }

        $message = [];

        $field_list = [
            "externo" => [
                "archivos_permitidos", 
                "tipo_documento_defecto", 
                "tipo_documento_validar_cut", 
                "url_centro_ayuda", 
                "movie_id", 
                "id_usuario",
                "texto_centro_ayuda",
                "url_centro_ayuda",
                "texto_terminos_condiciones",
                "url_terminos_condiciones",
                "telefono",
                "email",
                "whatsapp",
                "externo_social",
                "video_principal_image",
                "email_matriculas"
            ],
            "payment" => [
                "culqi_secret_key",
                "culqi_public_key",
            ]
        ];

        if($tipo === 'institucion'){

            $message["error"] = "Error al actualizar configuración, intente nuevamente";
            $message["success"] = "Datos actualizados correctamente";

            $update = $this->db->update("institucion", [
                "nombre" => $this->input->post_get("nombre"),
                "nombre_corto" => $this->input->post_get("nombre_corto"),
                "titulo_sistema" => $this->input->post_get("titulo_sistema"),
                "description" => $this->input->post_get("description"),
                "keywords" => $this->input->post_get("keywords"),
            ], ["id_institucion" => $id_institucion]);

        }else{
            switch($subtipo){

                case 'externo': 
                case 'payment': 
                case 'foo':
    
                    if(!isset($config_actual[$subtipo])) $config_actual[$subtipo] = [];
    
                    foreach($field_list[$subtipo] AS $field){
                        if($this->input->post_get($field) !== null){
                            $value = $this->input->post_get($field, "");
                            
                            if($field === "movie_id"){
                                $value = array_map(function($item){ return $item["movie_id"]; }, $value);
                            }

                            $config_actual[$subtipo][$field] = $value;
                        }
                    }
    
                    $config_actual_json = json_encode($config_actual);
    
                    if(!is_string($config_actual_json)) return error("Error al guardar formato de nueva configuración, por favor intente nuevamente");

                    $new_data = [
                        "configuracion" => $config_actual_json
                    ];       
    
                    $update = $this->db->update("institucion", $new_data, ["id_institucion" => $id_institucion]);
    
                    $message["error"] = "Error al actualizar configuración";
                    $message["success"] = "Configuración actualizada correctamente";
    
                    break;
    
    
                default:
    
                    $update = false;
                    $message["error"] = "Error al actualizar configuración, intente nuevamente";
                    $message["success"] = "Datos actualizados correctamente";
            }
    
        }

  

        if(!$update) return error($message["error"]);

        return json(["ok" => 1, "mensaje" => $message["success"]]);

    }
}
