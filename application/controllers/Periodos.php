<?php

//Controller generado desde WAI Core: :2020-12-14T01:33:44.732Z:
	
defined('BASEPATH') OR exit('No direct script access allowed');

class Periodos extends MY_controller {

	public function __construct(){               
		parent::__construct();
	}

	public function switch_libro(){
		
		
        $_POST = json_decode(file_get_contents('php://input'), true); 

		$fields = [];
		$id_libro = (int) $this->input->post_get("id_libro");
		$id_periodo = (int) $this->input->post_get("id_periodo");
		$id_bloque = (int) $this->input->post_get("id_bloque");
		$id_usuario = $this->usuario_class->info["id_usuario"];

		$query = false;

		//find
		$detalle = $this->db->get_where("vista_periodos_detalles", ["id_periodo" => $id_periodo, "id_libro" => $id_libro]);
		$detalle_row = $detalle->row_array();
		if($detalle_row){
			
			$this->db->where("id_periodo_detalle", $detalle_row["id_periodo_detalle"]);

			$update_fields["estado"] = $id_bloque ? 1 : 0;
			if($id_bloque) $update_fields["id_bloque"] = $id_bloque;

			$query = $this->db->update("periodos_detalles", $update_fields);
			
		}else{
			if($id_bloque){
				$query = $this->db->insert("periodos_detalles", [
					"id_periodo" => $id_periodo,
					"id_libro" => $id_libro,
					"id_bloque" => $id_bloque,
				]);
			}
			
		}
		
		return json(["ok" => $query]);
	}

	
	public function cargar_libros(){
		
		
        $_POST = json_decode(file_get_contents('php://input'), true); 

		$fields = [];
		$id_periodo = $this->input->post_get("id_periodo");
		$id_usuario = $this->usuario_class->info["id_usuario"];
		
		$items = $this->db->get_where("vista_periodos_detalles", ["id_periodo" => $id_periodo]);
		$items = $items->result_array();

		json($items);

	}

}