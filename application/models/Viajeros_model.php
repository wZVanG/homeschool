<?php

class Viajeros_model extends MY_Model {
    
    public $vista = 'viajeros';
    public $primary_key = 'id_viajero';
    public $columns = array(
        [
            'db' => 'id_viajero',
            'dt' => 0
        ],
        [
        
            'db' => 'foto',
            'dt' => 1,
            'title' => 'Foto',
            'file' => [
                'type' => 'image',
                'module' => 'viajeros',
                'draw' => true,
                'size' => [
                    "width" => 50,
                    "height" => 50,
                ],
                'default' => './assets/images/no_avatar.png'
            ]
        ],  
        [
            'db' => 'tipo_viajero',
            'dt' => 2,
            'title' => 'Tipo',
            'param' => 'TIPVIA'
        ],  
        [
            'db' => 'tipo_documento',
            'dt' => 3,
            'title' => 'Tipo Documento',
            'param' => 'DOCIDE'
        ],
        [
        
            'db' => 'numero_documento',
            'dt' => 4,
            'title' => 'Núm. Documento'
        ],
        [
            'db' => 'nombre_completo',
            'dt' => 5,
            'title' => 'Nombres y apellidos'
        ],
        [
        
            'db' => 'email',
            'dt' => 6,
            'title' => 'E-mail'
        ],
        [
        
            'db' => 'celular',
            'dt' => 7,
            'title' => 'Celular'
        ],
        [
            'db' => 'fecha_registro',
            'dt' => 8,
            'title' => 'Fecha registro'
        ],
        [
            'db' => 'estado',
            'dt' => 9,
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