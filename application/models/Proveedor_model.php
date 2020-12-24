<?php

class Proveedor_model extends MY_Model {
    
    public $vista = 'proveedor';
    public $primary_key = 'id_proveedor';
    public $columns = array(
        [
            'db' => 'id_proveedor',
            'dt' => 0
        ],
        [
        
            'db' => 'foto',
            'dt' => 1,
            'title' => 'Foto',
            'file' => [
                'type' => 'image',
                'module' => 'proveedor',
                'draw' => true,
                'size' => [
                    "width" => 80,
                    "height" => 80,
                ],
            ]
        ],
        [
            'db' => 'nombre',
            'dt' => 2,
            'title' => 'Nombre',
        ],
        [
            'db' => 'url',
            'dt' => 3,
            'title' => 'URL',
        ],
        [
            'db' => 'estado',
            'dt' => 4,
            'title' => 'Estado',
        ]
    );
 
    public function buscar($str){
        $this->db->like('nombre', $str);
        $this->db->or_like('url', $str);
        //$this->db->limit(10);

        $query = $this->db->get($this->vista);
        return $query->result_array();
    }
  
}