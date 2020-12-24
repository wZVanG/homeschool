<?php

class Paginas_model extends MY_Model {
    
    public $vista = 'paginas';
    public $primary_key = 'id_pagina';
    public $columns = array(
        [
            'db' => 'id_pagina',
            'dt' => 0
        ],
        [
            'db' => 'tipo',
            'dt' => 1,
            'title' => 'Tipo',
            'param' => 'PAGINA'
        ],
        [
            'db' => 'titulo',
            'dt' => 2,
            'title' => 'Título',
        ],
        [
            'db' => 'contenido',
            'dt' => 3,
            'title' => 'Contenido',
        ],
        [
        
            'db' => 'archivo',
            'dt' => 4,
            'title' => 'Archivo',
            'file' => [
                'type' => 'pdf',
                'module' => 'manual_usuario'
            ]
        ],
        [
        
            'db' => 'enlace',
            'dt' => 5,
            'title' => 'Vídeo',
        ],
        [
            'db' => 'estado',
            'dt' => 6,
            'title' => 'Estado'
        ]
    );
 
    public function buscar($str){
        $this->db->like('titulo', $str);
        $this->db->limit(10);
   
        $query = $this->db->get($this->vista);
        return $query->result_array();
    }
  
}