<?php

//Controller generado desde WAI Core: :2020-12-16T22:48:23.796Z:
	
defined('BASEPATH') OR exit('No direct script access allowed');

class Periodos_detalles_tareas extends MY_controller {

	public function __construct(){               
		parent::__construct();
	}

	public function respuestas(){
		
		$id_periodo_detalle = (int) $this->input->post_get('id_periodo_detalle');
		$list = $this->db->query("
		SELECT r.*, pt.id_periodo_detalle FROM periodos_detalles_tareas_resolve r
		JOIN periodos_detalles_tareas pt ON pt.id_periodo_detalle_tarea = r.id_periodo_detalle_tarea
		WHERE pt.id_periodo_detalle = $id_periodo_detalle
		");
		/*$id_periodo_detalle_tarea = (int) $this->input->post_get('id_periodo_detalle_tarea');
		$list = $this->db->get_where("periodos_detalles_tareas_resolve", ["id_periodo_detalle_tarea" => $id_periodo_detalle_tarea]);*/
		$list = $list->result_array();

		return json($list);
	}

}