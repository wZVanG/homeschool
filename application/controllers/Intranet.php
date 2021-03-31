<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Intranet extends CI_Controller {

	public function index(){


		$wai_config = $this->config->item("wai");

		if(isset($wai_config["mantenimiento"]) && $wai_config["mantenimiento"]){
            $ips = is_array($wai_config["ips_habilitadas"]) ? $wai_config["ips_habilitadas"] : [];

            $mi_ip = isset($_SERVER["REMOTE_ADDR"]) ? $_SERVER["REMOTE_ADDR"] : '';
            if(!in_array($mi_ip, $ips)){
                echo $this->load->view('mantenimiento.html', [], true);	
                exit;
            }

		}
	
		$data_usuario = null;

		if($this->usuario_class->info){
			$data_usuario = $this->usuario_class->info;
			unset($data_usuario["clave"]);
		}	



		$this->load->model("categorias_model");
		$this->load->model("libros_model");


		$config = $this->config->item("wai");

		$locals = [
			"assets_version" => $config["is_localhost"] ? time() : $config["assets_version"],
			"base_url" => $this->config->item("base_url"),
			"collections" => [],
			"keycodes" => [],
			"usuario" => $data_usuario
		];

	
		$locals["keycodes"]["categorias"] =  $this->categorias_model->obtenerKeycodes();
		$locals["keycodes"]["libros"] =  $this->libros_model->obtenerKeycodes();

		$locals["collections"]["categorias"] = $this->categorias_model->itemsCollectionToArray($this->categorias_model->listarTodos(["estado" => 1]));
	
		$id_institucion = isset($this->usuario_class->id_institucion) ? $this->usuario_class->id_institucion : 1;
		$locals["institucion"] = $this->usuario_class->institucionData($id_institucion);

		//No mostrar llaves secretas
		unset($locals["institucion"]["configuracion"]["payment"]["culqi_secret_key"]);		

		$this->load->view('intranet', [
			"titulo" => $locals["institucion"]["nombre"], 
			"config" => $config,
			"locals" => $locals
		]);

	}
}
