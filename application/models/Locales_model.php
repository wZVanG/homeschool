<?php

class Locales_model extends MY_Model {
    
    public $vista = 'locales';
    public $primary_key = 'id_local';
    public $columns = array(
        [
            'db' => 'id_local',
            'dt' => 0
        ],  
        [
            'db' => 'tipo',
            'dt' => 1,
            'title' => 'Tipo',
            'param' => 'TIPLOC'
        ],
        [
            'db' => 'nombre',
            'dt' => 2,
            'title' => 'Nombre',
        ],
        [
            'db' => 'direccion',
            'dt' => 3,
            'title' => 'Dirección',
        ],
        [
            'db' => 'estado',
            'dt' => 4,
            'title' => 'Estado',
        ]
    );
 
    public function buscar($str){
        $this->db->like('nombre', $str);
        $this->db->or_like('direccion', $str);
        //$this->db->limit(10);

        $query = $this->db->get($this->vista);
        return $query->result_array();
    }
  
}