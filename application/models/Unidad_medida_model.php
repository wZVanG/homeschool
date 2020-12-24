<?php

class Unidad_medida_model extends MY_Model {
    
    public $vista = 'unidad_medida';
    public $primary_key = 'id_unidad_medida';
    public $columns = array(
        [
            'db' => 'id_unidad_medida',
            'dt' => 0
        ],
        [
            'db' => 'nombre',
            'dt' => 1,
            'title' => 'Nombre',
            'prompt' => 'Nombre'
        ],
        [
            'db' => 'estado',
            'dt' => 2,
            'title' => 'Estado'
        ]
    );
 
    public function buscar($str){
        $this->db->like('nombre', $str);
        //$this->db->limit(10);
   
        $query = $this->db->get($this->vista);
        return $query->result_array();
    }
  
}