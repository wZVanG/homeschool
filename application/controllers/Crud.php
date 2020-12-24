<?php
    
defined('BASEPATH') OR exit('No direct script access allowed');

class Crud extends MY_Controller {

	public function __construct(){
	
		parent::__construct();

		$usuario_info = $this->usuario_class->get_info();
		if($usuario_info["rol"] != ROL_ADMINISTRADOR){
			$this->session->sess_destroy();
			header("Location: ./");
			exit;
		}
		
	
	}

	
	public function buscar($table_name){
		
		$model_class = $table_name . "_model";
		if(!file_exists(APPPATH . "models/$model_class.php")) error("Error en CRUD");

		$this->load->model($model_class);

		$id = (int) $this->input->get_post('id');
		$str = $this->input->post_get("term");


		$result = $id ? $this->$model_class->one($id) : $this->$model_class->buscar($str);

		
		return json($result);

	}

	public function buscar_collection($table_name){
		
		$model_class = $table_name . "_model";
		if(!file_exists(APPPATH . "models/$model_class.php")) error("Error en CRUD");

		$this->load->model($model_class);

		$id = (int) $this->input->get_post('id');
		$str = $this->input->post_get("term");

		$result = $id ? $this->$model_class->one($id) : $this->$model_class->buscar($str);

        $result = $this->$model_class->itemsCollectionToArray($result);
		
		return json($result);

	}

	public function estado($table_name){

		$model_class = $table_name . "_model";
		if(!file_exists(APPPATH . "models/$model_class.php")) error("Error en CRUD");

		$this->load->model($model_class);

		$id = (int) $this->input->get_post('id');
		$estado = (int) $this->input->get_post('estado');

		if($id) error("No ha especificado un ID");

		$this->db->where($this->$model_class->primary_key, $id);
		$result = $this->db->update($table_name, ["estado" => $estado]);

		return json(["ok" => !!$result, "estado" => $estado]);

	}	

	public function create($table_name){

		$model_class = $table_name . "_model";
		if(!file_exists(APPPATH . "models/$model_class.php")) error("Error en CRUD");

		$this->load->model($model_class);

		//$fields = array_map(function($item){ return $item["db"];}, $this->$model_class->columns);
		$fields = $this->db->list_fields($table_name);
		$column_primary = $this->$model_class->primary_key;
		
		$data = [];
		$campos = json_decode(file_get_contents('php://input'), true); 

		foreach($campos AS $key => $value){
			if(in_array($key, $fields)){
				
				$data[$key] = $value;
				if($key === "clave"){
					if(strlen(trim($value)) > 0){
						$data["clave"] = password_hash($value, PASSWORD_BCRYPT);
					}else{
						unset($data["clave"]);
					}
					
				}elseif($key === "codigo"){
					$data["codigo"] = strtoupper(trim($value));
				}else if($key === "url"){
					$data["url"] = strtolower(trim($value));
				}
			} 
		}
		
		$this->db->trans_begin();

		$my_id_usuario = $this->usuario_class->id;

		if(!empty($data[$column_primary])){
			//Update
			$id_result = (int) $data[$column_primary];
			unset($data[$column_primary]);
			
			//Log fields
			if(in_array("fecha_actualizacion", $fields)) $data["fecha_actualizacion"] = DATETIME_NOW;
			if(in_array("usuario_actualizacion", $fields)) $data["usuario_actualizacion"] = $my_id_usuario;
			
			unset($data["usuario_registro"]);
			unset($data["fecha_registro"]);

			$query = $this->db->update($table_name, $data, [$column_primary => $id_result]);
			if($query) $this->$model_class->afterUpdate($id_result, $campos);

			$return_msg = "Error al actualizar registro";
			
		}else{
			//Insert
			
			//Log fields
			if(in_array("fecha_registro", $fields)) $data["fecha_registro"] = DATETIME_NOW;
			if(in_array("fecha_actualizacion", $fields)) $data["fecha_actualizacion"] = DATETIME_NOW;
			if(in_array("usuario_registro", $fields)) $data["usuario_registro"] = $my_id_usuario;
			if(in_array("usuario_actualizacion", $fields)) $data["usuario_actualizacion"] = $my_id_usuario;

			$this->$model_class->beforeCreate($data, $campos);

			$query = $this->db->insert($table_name, $data);
			$id_result = $query ? $this->db->insert_id() : null;			
			$return_msg = "Error al agregar registro";
		}

		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return error($return_msg);
		}else{
			$this->db->trans_commit();

			$response = ["ok" => 1, $column_primary => $id_result];
			//Si devolver item creado
			$devolver_item = !!((int) $campos["draw_new_item"]);
			if($devolver_item){
				
				$query = $this->db->get_where($this->$model_class->vista, [$column_primary => $id_result]);
				if($query) $response["item"] = $query->row_array();
				
			}

			return json($response);
		}
		
	}

	public function updateCell($table_name = ""){

		$model_class = $table_name . "_model";
		if(!file_exists(APPPATH . "models/$model_class.php")) error("Error en CRUD");

		$this->load->model($model_class);

		//$fields = array_map(function($item){ return $item["db"];}, $this->$model_class->columns);
		$fields = $this->db->list_fields($table_name);

		$pk = (int) $this->input->post_get("pk");
		$name = $this->input->post_get("name");
		$value = $this->input->post_get("value");
		
		$column_primary = $this->$model_class->primary_key;

		if(!in_array($name, $fields)) return error("Error en CRUD fields", 400);

		if($name === "codigo"){
			$value = strtoupper(trim($value));
		}else if($name === "url"){
			$value = strtolower(trim($value));
		}

		$data = [$name => $value];
		
		$query = $this->db->update($table_name, $data, [
			$column_primary => $pk
		]);
		
		return $query ? json(1) : error("Error al actualizar registro");

	}
	
}
