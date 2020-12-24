<?php

//Model generado desde WAI Core: :2020-12-16T22:37:47.215Z:
	
defined('BASEPATH') OR exit('No direct script access allowed');

class Periodos_matriculas_model extends MY_Model {
	
	public $vista = 'vista_periodos_matriculas';
	public $primary_key = 'id_periodo_matricula';
	public $columns = [
		[
			'db' => 'id_periodo_matricula',
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
			'db' => 'nombre_libro',
			'dt' => 3,
			'title' => 'Libro'
		],
		[
			'db' => 'fecha_matricula',
			'dt' => 4,
			'title' => 'Fecha_matricula'
		],
		[
			'db' => 'nombre_usuario',
			'dt' => 5,
			'title' => 'Estudiante'
		],
		[
			'db' => 'estado_matricula',
			'dt' => 6,
			'title' => 'Estado inscripción',
			'param' => 'ESTMAT'
		],
		[
			'db' => 'estado_resultado',
			'dt' => 7,
			'title' => 'Estado',
			'param' => 'ESTRES'
		],
		[
			'db' => 'estado',
			'dt' => 8
		]
	];
 
	public function buscar($str){
		$this->db->like('nombre_usuario', $str);
		//$this->db->limit(10);
   
		$query = $this->db->get($this->vista);
		return $query->result_array();
	}
  
}
