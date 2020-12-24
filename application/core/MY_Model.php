<?php

class MY_Model extends CI_Model
{

    function __construct()
    {
        parent::__construct();

        $this->db->conn_id->options(MYSQLI_OPT_INT_AND_FLOAT_NATIVE, true);

    } 

    public function row_format($query, &$item, $fields = null, $map_types = null){

        if(!is_array($item)) return $item;
        
        if(!$fields) $fields = $query->field_data();

        if(!$map_types){
            
            $map_types = [];

            foreach($fields AS $field){
                $map_types[$field->name] = $field->type;
            }    
        }
    
        foreach($item AS $key => $value){

            if(!isset($map_types[$key])) continue;

            switch ($map_types[$key]) {

                case MYSQLI_TYPE_LONGLONG: // 8 = bigint
                case MYSQLI_TYPE_LONG: // 3 = int
                case MYSQLI_TYPE_TINY: // 1 = tinyint
                case MYSQLI_TYPE_SHORT: // 2 = smallint
                case MYSQLI_TYPE_INT24: // 9 = mediumint
                case MYSQLI_TYPE_YEAR: // 13 = year
                case "int":
                case "tinyint":
                case "smallint":
                case "bigint":
                case "bit":
                case "year":    
                    if($item[$key] !== null) settype($item[$key], 'integer');
                    break;
    
                case MYSQLI_TYPE_NEWDECIMAL: // 246 = decimal
                case MYSQLI_TYPE_FLOAT: // 4 = float
                case MYSQLI_TYPE_DOUBLE: // 5 = double
                case "float":
                case "decimal":
                    if($item[$key] !== null) settype($item[$key], 'float');
                    break;
    
            }
        }

        return $item;

    }

    public function result_format($query, &$items){

        if(!is_array($items)) return $items;
        
        $fields = $query->field_data();

        $map_types = [];

        foreach($fields AS $field){
            $map_types[$field->name] = $field->type;
        }

        foreach ($items AS $item) {
            $this->row_format($query, $item, $fields, $map_types);
        }
        return $items;        
    }

    public function listar($estado = 1){
        
                
        $sql_details = [
            'user' => $this->db->username,
            'pass' => $this->db->password,
            'db'   => $this->db->database,
            'host' => $this->db->hostname
        ];
 
        $estado_query = $estado === null ? "estado <> 0" : "estado = $estado";
        
        return SSP::complex( $_GET, $sql_details, $this->vista, $this->primary_key, $this->columns, null, $estado_query);

    }   

    public function _listarTodos($filter = []){

        if(count($filter)){
           $this->db->where($filter);
        } 

        //$this->db->order_by($this->primary_key, "ASC");
        
        $query = $this->db->get($this->vista);        
        $items = $query->result_array();

        $this->result_format($query,  $items);

        /*if(isset($_REQUEST["type"]) && $_REQUEST["type"] === "array"){
            $items = $this->itemsCollectionToArray($items);
        }*/
            
        return $items;
    }

    public function listarTodos($filter = []){
        return $this->_listarTodos($filter);
    }

    public function obtenerKeycodes(){
        
        return array_map(function($column){
            return $column["db"];
        }, $this->columns); 
    }

    public function itemToArray($item_in_object, $fields, $sort = false){
        if($sort) sort($fields);

        $items = [];

        foreach($fields AS $key){
            $items[] = $item_in_object[$key];
        }

        return $items;
		
    }

    
    public function itemsToArray($items, $fieldsOrColletion, $mapFn = null, $sort = false){

        $fields = $fieldsOrColletion;

		if(!is_array($fieldsOrColletion)){
			$fields = [];
		}

        if($sort) sort($fields);

        return array_map(function($item) use ($mapFn, $fields) {
            $item_in_object = $mapFn ? $mapFn($item) : $item; //Custom map
			return $this->itemToArray($item_in_object, $fields);
        }, $items);
		
    }

    public function itemCollectionToArray($item, $collection){

     
		$sorted_fields = $this->obtenerKeycodes();
		//sorted_fields.sort();
		return $this->itemToArray($item, $sorted_fields);
		
    }

    public function itemsCollectionToArray($items){

		$sorted_fields = $this->obtenerKeycodes();
		//sorted_fields.sort();
	
        return $this->itemsToArray($items, $sorted_fields);
    }

    public function _one($filter = 0){

        $query = $this->db->get_where($this->vista, is_array($filter) ? $filter : [$this->primary_key => $filter]);
        $row = $query->row_array();
        
        $this->row_format($query,  $row);
        
        return $row;
    }

    public function one($filter = 0){
        return $this->_one($filter);
    }

    public function afterUpdate($id_result, $campos){
        return true;
    }

    public function beforeCreate(&$data, $campos){
        return true;
    }
}