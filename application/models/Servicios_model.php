<?php

class Servicios_model extends MY_Model {
    
    public $vista = 'servicios';
    public $primary_key = 'id_servicio';
    public $columns = array(
        [
            'db' => 'id_servicio',
            'dt' => 0
        ],
        [
        
            'db' => 'foto',
            'dt' => 1,
            'title' => 'Foto',
            'file' => [
                'type' => 'image',
                'module' => 'servicios',
                'draw' => true,
                'size' => [
                    "width" => 80,
                    "height" => 80,
                ],
            ]
        ],
        [
            'db' => 'name',
            'dt' => 2,
            'title' => 'Nombre',
        ],
        [
            'db' => 'estado',
            'dt' => 3,
            'title' => 'Estado',
        ]
    );
 
    public function buscar($str){
        $this->db->like('name', $str);
        //$this->db->limit(10);
   
        $query = $this->db->get($this->vista);
        return $query->result_array();
    }
  
}