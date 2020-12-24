<?php

class Usuarios_model extends MY_Model {
    
    public $vista = 'vista_usuarios';
    public $primary_key = 'id_usuario';
    public $columns = array(
        [
            'db' => 'id_usuario',
            'dt' => 0
        ],
        [
        
            'db' => 'foto',
            'dt' => 1,
            'title' => 'Foto',
            'file' => [
                'type' => 'image',
                'module' => 'avatars',
                'draw' => true,
                'size' => [
                    "width" => 50,
                    "height" => 50,
                ],
                'default' => './assets/images/no_avatar.png'
            ]
        ],
        [
            'db' => 'nombre_usuario',
            'dt' => 2,
            'title' => 'Nombre usuario',
            'prompt' => 'Nombre usuario'
        ],
        [
            'db' => 'nombre_completo',
            'dt' => 3,
            'title' => 'Nombre Completo'
        ],  
        [
            'db' => 'rol',
            'dt' => 4,
            'title' => 'Rol de Usuario',
            'param' => 'ROLES'
        ],
        [
            'db' => 'estado',
            'dt' => 5,
            'title' => 'Estado'
        ]
    );

    public function buscar($str){
        
        $this->db->like('nombre_completo', $str, 'both');
        $this->db->or_like('nombre_usuario', $str, 'both');
        $this->db->limit(10);
        $query = $this->db->get($this->vista);
        return $query->result_array();
    }

    public function beforeCreate(&$data, $campos){
        
        //Crear persona
        $fields = $this->db->list_fields("personas");
        $data_persona = [];

		foreach($campos AS $key => $value){
			if(in_array($key, $fields)) $data_persona[$key] = $value;
        }

        //$data_persona["nombre_completo"] = implode(" ", [$data_persona["apellido_paterno"], $data_persona["apellido_materno"], $data_persona["nombres"]]);
        
        $query = $this->db->insert("personas", $data_persona);
        $new_id_persona = $query ? $this->db->insert_id() : null;
        //crear persona

        //Setear id_persona a nuevo usuario
        $data["id_persona"] = $new_id_persona;
    }

    public function afterUpdate($id, $campos){
       
        //Actualizar persona
        $fields = $this->db->list_fields("personas");
        $data = [];

		foreach($campos AS $key => $value){
			if(in_array($key, $fields)) $data[$key] = $value;
        }

        $id_persona = (int) $data["id_persona"];

        unset($data["id_persona"]);
        $query = $this->db->update("personas", $data, ["id_persona" => $id_persona]);
        //actualizar persona
          
        return $query;

    }
}