<?php
    
defined('BASEPATH') OR exit('No direct script access allowed');

class Upload extends MY_Controller {

    private $directory = [

        "thumb" => [
            "allowed_types" => 'jpg|gif|png|jpeg|webp',
            "max_size" => 2048,
        ],
        
        "clientes" => [
            "allowed_types" => 'jpg|gif|png|jpeg|webp',
            "max_size" => 10000,
        ],
        
        "libros" => [
            "allowed_types" => 'jpg|gif|png|jpeg|webp',
            "max_size" => 10000,
        ],
        "libros_archivos" => [
            "allowed_types" => 'jpg|gif|png|jpeg|webp|doc|docx|ppt|pdf|xls|xlsx',
            "max_size" => 20000,
        ],
             
   
        "avatars" => [
            "allowed_types" => 'jpg|gif|png|jpeg|webp',
            "max_size" => 2048,
        ],
   
    ];

	public function __construct(){
        
        parent::__construct();
                
    }
        
    public function index($type = '?'){

        $type = trim((string) $type);

        if(!isset($this->directory[$type])) return error("Directorio no seleccionado");
        
        $upload_config = $this->directory[$type];

        $config = array_merge([
            "upload_path" => './uploads/' . $type . '/',
            "allowed_types" => 'jpg|gif|png|jpeg',
            "max_size" => 2048,
            "file_ext_tolower" => true,
            "encrypt_name" => true,
        ], $upload_config);
        
        if (!is_dir($config['upload_path'])) mkdir($config['upload_path'], 0777, TRUE);

        $this->load->library('upload', $config);

        if ( ! $this->upload->do_upload('file')){
                $error_str = $this->upload->display_errors();
                if(preg_match("/allowed/", $error_str)) $error_str = "El archivo enviado no está permitido";
                error($error_str);
        } else{
                
                $upload_data = $this->upload->data();
                $data = array('upload_data' => $upload_data);
                json($data);
        }
    }

}
