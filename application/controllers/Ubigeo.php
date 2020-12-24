<?php
    
defined('BASEPATH') OR exit('No direct script access allowed');

class Ubigeo extends MY_controller {

	public function __construct(){
        
        parent::__construct();
     
    }

    public function buscar(){
        
        $term = $this->input->post_get('term');

        $query = $this->db->query("SELECT * FROM ubigeo
        WHERE 
        departamento LIKE '%" . $this->db->escape_like_str($term) . "' OR 
        provincia LIKE '%" . $this->db->escape_like_str($term) . "' OR 
        distrito LIKE '%" . $this->db->escape_like_str($term) . "' 
        ORDER BY id_ubigeo ASC LIMIT 30");
        $rows = $query->result_array();
        $items = [];
        foreach($rows AS $row){
            $items[] = [$row["id_ubigeo"], $row["departamento"], $row["provincia"], $row["distrito"]];
        }

        return json($items);

    }
    
    public function departamentos() {
        $query = $this->db->query('SELECT departamento 
        FROM `ubigeo` GROUP BY departamento ORDER BY departamento ASC');
        $rows = $query->result_array();
        $items = [];
        foreach($rows AS $row){
            $items[] = $row["departamento"];
        }
        return json($items);
    }

    public function provincias() {
        $departamento = $this->input->post_get('departamento');
        $query = $this->db->query("SELECT provincia 
        FROM `ubigeo` WHERE departamento = '" . $departamento . "' GROUP BY provincia ORDER BY provincia ASC");
        $rows = $query->result_array();
        $items = [];
        foreach($rows AS $row){
            $items[] = $row["provincia"];
        }
        return json($items);
    }

    public function distritos() {
        $departamento = $this->input->post_get('departamento');
        $provincia = $this->input->post_get('provincia');
        $query = $this->db->query("SELECT id_ubigeo, distrito 
        FROM `ubigeo` WHERE departamento = '" . $departamento . "' AND provincia = '" . $provincia . "' ORDER BY distrito ASC");
        $rows = $query->result_array();
        $items = [];
        foreach($rows AS $row){
            $items[] = [$row['id_ubigeo'], $row["distrito"]];
        }
        return json($items);
    }

}
