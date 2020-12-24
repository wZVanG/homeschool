<?php

class Personas_model extends MY_Model {
    
    public $vista = 'personas';
    public $primary_key = 'id_persona';
    public $columns = array(
        [
            'db' => 'id_persona',
            'dt' => 0
        ],  
        [
            'db' => 'tipo_persona',
            'dt' => 1,
            'title' => 'Tipo',
            'param' => 'TIPPER'
        ],  
        [
            'db' => 'tipo_documento',
            'dt' => 2,
            'title' => 'Tipo Documento',
            'param' => 'DOCIDE'
        ],
        [
        
            'db' => 'numero_documento',
            'dt' => 3,
            'title' => 'Núm. Documento'
        ],
        [
            'db' => 'nombre_completo',
            'dt' => 4,
            'title' => 'Nombres y apellidos'
        ],
        [
            'db' => 'email',
            'dt' => 5,
            'title' => 'E-mail'
        ],
        [
            'db' => 'celular',
            'dt' => 6,
            'title' => 'Celular'
        ],
        [
            'db' => 'estado',
            'dt' => 7,
            'title' => 'Estado'
        ]
    );

    public function buscar($str){
        $this->db->like('numero_documento', $str);
        $this->db->or_like('nombre_completo', $str);
        $this->db->limit(10);
        $query = $this->db->get($this->vista);
        return $query->result_array();
    }

}