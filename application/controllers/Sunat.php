
    <?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sunat extends MY_Controller {
	
	
    public function index(){
        
        require_once(APPPATH . "libraries/sunat/class.client.php");
        require_once(APPPATH . "libraries/sunat/class.parser.php");
        require_once(APPPATH . "libraries/sunat/class.captchacodes.php");
        require_once(APPPATH . "libraries/sunat/class.company.php");
        require_once(APPPATH . "libraries/sunat/class.person.php");
        require_once(APPPATH . "libraries/sunat/class.ruc.php");
        require_once(APPPATH . "libraries/sunat/class.dni_direct.php");
        require_once(APPPATH . "libraries/sunat/simple_html_dom.php");


        $numero_documento = isset($_REQUEST["numero_documento"]) ? trim($_REQUEST["numero_documento"]) : "";

        if(!$numero_documento) return error("Especifica el número de documento.");

        $es_dni = strlen($numero_documento) === 8;		
        $obj = $es_dni ? new Dni() : new Ruc();

        $obj->setClient(new ContextClient());
        $datos = $obj->get($numero_documento);

        if(!$datos) die(json_encode(array("error" => 1, "mensaje" => "No fue posible buscar esta información")));
        
        if($es_dni) $datos = [
            "nombre_completo" => sprintf("%s %s %s", $datos->nombres, $datos->apellidoPaterno, $datos->apellidoMaterno), 
            "nombres" => $datos->nombres,
            "apellido_paterno" => $datos->apellidoPaterno,
            "apellido_materno" => $datos->apellidoMaterno,
            "direccion" => null
        ];
        else $datos = ["nombre_completo" => sprintf("%s", $datos->razonSocial), "direccion_cli" => preg_replace('/\s+/', ' ', $datos->direccion)];

        //Petición
        //http://localhost/pawa/include/aditional_function_r.php?numedoc=20483906766

        //número de 11 digitos arroja resultado:
        //{"nombre":"CENTRO COMERCIAL DANILO HUMBERTO EIRL","direccion":"CAL.LIMA NRO. 501 PIURA - PIURA - LA UNION"}

        //número de 8 digitos arroja resultado:
        //{"nombre":"WALTER GERMAN CHAPILLIQUEN ZETA","direccion":null}

        die(json_encode($datos));

    }

    
}
