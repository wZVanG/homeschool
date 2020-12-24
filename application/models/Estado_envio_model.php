<?php

class Estado_envio_model extends MY_Model {
    
    public $vista = 'estado_envio';
    public $primary_key = 'id_estado_envio';
    public $columns = array(
        [
            'db' => 'id_estado_envio',
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