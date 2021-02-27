<?php
	
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends MY_Controller {

	public function __construct(){               
		parent::__construct();
	}

	public function cargar_bloques($id_usuario){
	
		$query = $this->db->get_where("usuarios_bloques", ["id_usuario" => $id_usuario]);
		$rows = $query->result_array();
		$items = [];
		foreach($rows AS $item){
			$items[$item["id_periodo"]] = $item["id_bloque"];
		}

		return json($items);
	}

	public function cambiar_bloque($id_usuario, $id_periodo, $id_bloque){

		$where = ["id_usuario" => $id_usuario, "id_periodo" => $id_periodo];
		
		$query = $this->db->get_where("usuarios_bloques", $where);
		
		if($query->num_rows() > 0){
			$update = $this->db->update("usuarios_bloques", ["id_bloque" => $id_bloque], $where);
		}else{
			$insert_fields = array_merge($where, ["id_bloque" => $id_bloque]);
			$update = $this->db->insert("usuarios_bloques", $insert_fields);
		}
		
		return json(["ok" => $update ? 1 : 0]);
 	}

}
