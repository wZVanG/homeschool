<?php

class MY_Controller extends CI_Controller
{

    var $model_class;

    function __construct()
    {
        parent::__construct();
        
        //$module  = $this->router->fetch_class();

        $has_permission = property_exists($this, "permissions") ? $this->permissions : false;

        if(!$has_permission){
            $sess_id = (int) $this->session->userdata('id_usuario');

            if(!$sess_id) {
                if($this->input->is_ajax_request()) return json(["error" => "No has iniciado sesión"]);
                die("No has iniciado sesión");
            }
    
        }

		$wai_config = $this->config->item("wai");

		if(isset($wai_config["mantenimiento"]) && $wai_config["mantenimiento"]){
            $ips = is_array($wai_config["ips_habilitadas"]) ? $wai_config["ips_habilitadas"] : [];

            $mi_ip = isset($_SERVER["REMOTE_ADDR"]) ? $_SERVER["REMOTE_ADDR"] : '';
            if(!in_array($mi_ip, $ips)){
                echo $this->load->view('mantenimiento.html', [], true);	
                exit;
            }
			
        }

        $class_name = get_class($this);
        $model_class = ucwords(strtolower($class_name . "_model"));
		if(file_exists(APPPATH . "models/$model_class.php")){
            $this->load->model($model_class);
            $this->model_class = $model_class;
        }
        

        //$this->db->conn_id->options(MYSQLI_OPT_INT_AND_FLOAT_NATIVE, true);

    } 

    public function listar(){

        $estado = isset($_REQUEST["estado"]) ? (int) $_REQUEST["estado"] : null;

        $listar = $this->{$this->model_class}->listar($estado);

        json($listar);
    }

}