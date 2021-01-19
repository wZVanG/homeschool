<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Sesion extends MY_Controller {

    var $permissions = true;

    public function __construct() {
        parent::__construct();
    }

    public function generate(){

        $hashToStoreInDb = password_hash("dkjiex", PASSWORD_BCRYPT);
        die($hashToStoreInDb);

    }
    
    public function login(){
       
        $_POST = json_decode(file_get_contents('php://input'), true);

        $nombre_usuario = $this->input->post_get("nombre_usuario", "");
        $clave = $this->input->post_get("clave", "");

        $cargo_index = (int) $this->input->post_get("cargo_index", "");

        $this->db->limit(1);
        $this->db->where("nombre_usuario", $nombre_usuario);
        $query = $this->db->get("usuarios");

        $row = $query->row_array();
        $clave_actual = $row["clave"];

        if(!$row) return json(["login" => false, "usuario" => null, "mensaje" => "Este usuario no existe"]);
        if($row["estado"] != 1) return json(["login" => false, "usuario" => null, "mensaje" => "El usuario no se encuentra activo"]);

        $id_usuario_original = $row["id_usuario"];

        //Vista
        $this->db->where("id_usuario", $id_usuario_original);
        $query = $this->db->get("vista_usuarios");
        $row = $query->row_array();

        $compare = password_verify($clave, $clave_actual);

        if(!$compare) return json(["login" => false, "usuario" => null, "mensaje" => "La contraseña es incorrecta"]);

        //verifica admin
        if(!$this->usuario_class->info || $this->usuario_class->info["rol"] != 3) return error("No tienes permisos para realizar esta acción");


        unset($row["clave"]);

        $this->session->set_userdata($row);

        return json([
            "login" => true, 
            "usuario" => $this->session->get_userdata(), 
            "cargos" => [], 
            "mensaje" => "Iniciaste como: " . $row["nombre_completo"]
        ]);

    }

    public function logout(){
        $this->session->sess_destroy();
        return json(["logout" => 1]);
    }
}