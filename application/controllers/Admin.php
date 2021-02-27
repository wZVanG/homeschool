<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends MY_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

	 var $permissions = true;

	public function index(){

		
		if($this->usuario_class->info && $this->usuario_class->info["rol"] != 3) return error("No tienes permisos para realizar esta acción");
		//if(!$this->usuario_class->info || $this->usuario_class->info["rol"] != 3) return error("No tienes permisos para realizar esta acción");
		
		$usuario_info = $this->usuario_class->get_info();

		if(!empty($usuario_info["rol"]) && $usuario_info["rol"] != ROL_ADMINISTRADOR) {
			$this->session->sess_destroy();
			header("Location: ./");
			exit;
		}

		$this->load->model('parametros_valores_model');
		$this->load->helper('miscs');

		$config = $this->config->item("wai");

		$collection = ["columns" => [], "primary_keys" => [], "parametros" => []];

		//Load all models
		$files = glob(APPPATH . "models/*");
		$modules = [];
		foreach($files AS $file){
			if(preg_match('/.+\/(.+)_model\.php/', $file, $found)) $modules[] = strtolower($found[1]);
		}

		foreach($modules AS $item){
			$class_model = $item . "_model";
			$this->load->model($class_model);	
			$collection["columns"][$item] = $this->$class_model->columns;
			$collection["primary_keys"][$item] = $this->$class_model->primary_key;
		}

		//Parámetros acciones
		
		$collection["parametros"]["categorias"] = $this->categorias_model->listarTodos();
		
		$collection["parametros"]["periodos"] = $this->periodos_model->listarTodos();

		$collection["parametros"]["bloques"] = $this->bloques_model->listarTodos();

		//$collection["parametros"]["libros"] = $this->libros_model->listarTodos();
		
		

		$id_institucion = isset($this->usuario_class->id_institucion) ? $this->usuario_class->id_institucion : 1;
		$collection["parametros"]["institucion"] = $this->usuario_class->institucionData($id_institucion);
	

		$config["parametros"] = [];
		$params = $this->parametros_valores_model->listarTodos(["estado" => 1]);

		foreach($params AS $param){
			if(!isset($config["parametros"][$param["tipo"]])) $config["parametros"][$param["tipo"]] = [];
			$config["parametros"][$param["tipo"]][] = [
				"codigo" => $param["codigo"],
				"codigo_hex" => $param["codigo_hex"],
				"descripcion" => $param["descripcion"],
				"valor_1" => (float) $param["valor_1"],
				"valor_2" => (string) $param["valor_2"]
			];
		}

		//Assets JS

		$resources = ["scripts" => [], "styles" => []];
		
		if($config["assets_production"]){
			$resources["scripts"][] = "./assets/js/min/vendor.js";
		}else{
			$resources["scripts"] = array_merge(glob("./assets/js/vendor/*.js"), glob("./assets/js/libraries/*.js"), $resources["scripts"]);
		}

		if($config["assets_production"]){
			$resources["scripts"][] = "./assets/js/min/app.js";
		}else{
			$resources["scripts"][] = "./assets/js/app/init.js";
			$resources["scripts"][] = "./assets/js/app/routes.js";
			$resources["scripts"][] = "./assets/js/app/app.js";
			
			$app_dirs = glob('./assets/js/app/*' , GLOB_ONLYDIR);

			$app_files = [];

			foreach($app_dirs AS $dir) $app_files = array_merge($app_files, glob("$dir/*.js"));
			foreach($app_files AS $file) $resources["scripts"][] = $file;

		}

		//Assets JS

		//foreach($resources["scripts"] AS $i => $script) $resources["scripts"][$i] = $script . "?v=" . $config["assets_version"];
		foreach($resources["scripts"] AS $i => $script) $resources["scripts"][$i] = $script;

		if($config["assets_production"]){
			$resources["styles"][] = "./assets/css/min/vendor.css";
			$resources["styles"][] = "./assets/css/min/app.css";
		}else{
			$files = array_merge(glob("./assets/css/vendor/*.css"),glob("./assets/css/libraries/*.css"), glob("./assets/css/wai/*.css"), glob("./assets/css/project/*.css"));
			//foreach($files AS $file) $resources["styles"][] = str_replace("", "", $file) . "?v=" . $config["assets_version"];
			foreach($files AS $file) $resources["styles"][] = str_replace("", "", $file);
		}

		$id_institucion = isset($this->usuario_class->id_institucion) ? $this->usuario_class->id_institucion : 1;
		$config["institucion"] = $this->usuario_class->institucionData($id_institucion);

		$config["usuario"] = $usuario_info;

		$config["sistema"] = [
			"titulo" => $config["institucion"]["nombre"],
			"titulo_corto" => $config["institucion"]["nombre_corto"],
		];

		$this->load->view('admin', [
			"titulo" => $config["institucion"]["nombre"] . " - Panel de Administración", 
			"resources" => $resources,
			"collection" => $collection,
			"config" => $config
		]);
	}
}
