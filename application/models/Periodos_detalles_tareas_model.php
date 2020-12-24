<?php

//Model generado desde WAI Core: :2020-12-16T22:48:23.796Z:
	
defined('BASEPATH') OR exit('No direct script access allowed');

class Periodos_detalles_tareas_model extends MY_Model {
	
	public $vista = 'vista_periodos_detalles_tareas';
	public $primary_key = 'id_periodo_detalle_tarea';
	public $columns = [
		[
			'db' => 'id_periodo_detalle_tarea',
			'dt' => 0,
			'title' => ''
		],
		[
			'db' => 'nombre_periodo',
			'dt' => 1,
			'title' => 'Periodo'
		],
		[
			'db' => 'nombre_libro',
			'dt' => 2,
			'title' => 'Libro'
		],
		[
			'db' => 'titulo',
			'dt' => 3,
			'title' => 'Titulo'
		],
		[
			'db' => 'descripcion',
			'dt' => 4,
			'title' => 'Descripcion'
		],
		[
			'db' => 'nota_maxima',
			'dt' => 5,
			'title' => 'Nota_maxima'
		],
		[
			'db' => 'nota_peso',
			'dt' => 6,
			'title' => 'Peso'
		],
		[
			'db' => 'estado',
			'dt' => 7
		]
	];
 
	public function buscar($str){
		$this->db->like('titulo', $str);
		//$this->db->limit(10);
   
		$query = $this->db->get($this->vista);
		return $query->result_array();
	}
  
}
