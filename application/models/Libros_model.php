<?php

//Model generado desde WAI Core: :2020-12-02T07:35:56.480Z:
	
defined('BASEPATH') OR exit('No direct script access allowed');

class Libros_model extends MY_Model {
	
	public $vista = 'libros';
	public $primary_key = 'id_libro';
	public $columns = [
		[
			'db' => 'id_libro',
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
            'title' => 'Imágen',
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
