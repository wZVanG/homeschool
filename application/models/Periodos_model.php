<?php

//Model generado desde WAI Core: :2020-12-14T01:33:44.732Z:
	
defined('BASEPATH') OR exit('No direct script access allowed');

class Periodos_model extends MY_Model {
	
	public $vista = 'periodos';
	public $primary_key = 'id_periodo';
	public $columns = [
		[
			'db' => 'id_periodo',
			'dt' => 0,
			'title' => ''
		],
		[
			'db' => 'nombre',
			'dt' => 1,
			'title' => 'Nombre'
		],
		[
			'db' => 'foto',
			'dt' => 2,
			'title' => 'Foto'
		],
		[
			'db' => 'maximo_libros',
			'dt' => 3,
			'title' => 'Max. libros'
		],
		[
			'db' => 'estado',
			'dt' => 4,
			'title' => ''
		]
	];
 
	public function buscar($str){
		$this->db->like('nombre', $str);
		//$this->db->limit(10);
   
		$query = $this->db->get($this->vista);
		return $query->result_array();
	}
  
}
