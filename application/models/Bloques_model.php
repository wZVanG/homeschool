<?php

//Model generado desde WAI Core: :2020-12-29T23:23:37.056Z:
	
defined('BASEPATH') OR exit('No direct script access allowed');

class Bloques_model extends MY_Model {
	
	public $vista = 'bloques';
	public $primary_key = 'id_bloque';
	public $columns = [
		[
			'db' => 'id_bloque',
			'dt' => 0,
			'title' => ''
		],
		[
			'db' => 'nombre',
			'dt' => 1,
			'title' => 'Nombre'
		],
		[
			'db' => 'descripcion',
			'dt' => 2,
			'title' => 'Descripcion'
		],
		[
			'db' => 'foto',
			'dt' => 3,
			'title' => 'Foto'
		],
		[
			'db' => 'fecha_registro',
			'dt' => 4,
			'title' => 'Fecha'
		],
		[
			'db' => 'fecha_actualizacion',
			'dt' => 5,
			'title' => 'Actualizado'
		],
		[
			'db' => 'usuario_registro',
			'dt' => 6,
			'title' => 'Usuario'
		],
		[
			'db' => 'usuario_actualizacion',
			'dt' => 7,
			'title' => 'Usuario Act.'
		],
		[
			'db' => 'estado',
			'dt' => 8,
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
