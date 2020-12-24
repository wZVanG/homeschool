<?php

//Model generado desde WAI Core: :2020-12-16T23:11:50.475Z:
	
defined('BASEPATH') OR exit('No direct script access allowed');

class Periodos_detalles_model extends MY_Model {
	
	public $vista = 'vista_periodos_detalles';
	public $primary_key = 'id_periodo_detalle';
	public $columns = [
		[
			'db' => 'id_periodo_detalle',
			'dt' => 0,
			'title' => ''
		],
		[
			'db' => 'nombre_periodo',
			'dt' => 1,
			'title' => 'Periodo'
		],
        [
        
            'db' => 'foto',
            'dt' => 2,
            'title' => 'Imagen',
            'file' => [
                'type' => 'image',
                'module' => 'libros',
                'draw' => true,
                'size' => [
                    "width" => 50,
                    "height" => 50,
                ],
                'default' => './assets/images/no_libro.png'
            ]
        ],
		[
			'db' => 'nombre',
			'dt' => 3,
			'title' => 'Libro'
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
