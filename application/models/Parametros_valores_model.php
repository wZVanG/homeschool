<?php

class Parametros_valores_model extends MY_Model {
    
    public $vista = 'parametros_valores';
    public $primary_key = 'id_parametro_valor';
    public $columns = [];

    public function buscar($str){
        $this->db->like('descripcion', $str);
        $this->db->limit(10);
        return $this->db->get($this->vista);
    }
}