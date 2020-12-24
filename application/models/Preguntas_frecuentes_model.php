<?php

class Preguntas_frecuentes_model extends MY_Model {
    
    public $vista = 'preguntas_frecuentes';
    public $primary_key = 'id_pregunta_frecuente';
    public $columns = array(
        [
            'db' => 'id_pregunta_frecuente',
            'dt' => 0
        ],
        [
            'db' => 'nombre',
            'dt' => 1,
            'title' => 'Título'
        ],
        [
            'db' => 'descripcion',
            'dt' => 2,
            'title' => 'Descripción'
        ],
        [
            'db' => 'estado',
            'dt' => 3,
            'title' => 'Estado'
        ]
    );

    public function buscar($str){
        $this->db->like('nombre', $str);
        $this->db->or_like('descripcion', $str);
        $this->db->limit(10);
        $query = $this->db->get($this->vista);
        return $query->result_array();
    }
    
}