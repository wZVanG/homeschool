<?php

class Clientes_model extends MY_Model {
    
    public $vista = 'clientes';
    public $primary_key = 'id_cliente';
    public $columns = array(
        [
            'db' => 'id_cliente',
            'dt' => 0
        ],
        [
        
            'db' => 'foto',
            'dt' => 1,
            'title' => 'Foto',
            'file' => [
                'type' => 'image',
                'module' => 'clientes',
                'draw' => true,
                'size' => [
                    "width" => 50,
                    "height" => 50,
                ],
                'default' => './assets/images/no_avatar.png'
            ]
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
            'db' => 'fecha_registro',
            'dt' => 7,
            'title' => 'Fecha registro'
        ],
        [
            'db' => 'estado',
            'dt' => 8,
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