<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('error'))
{
    function error($message = "Error desconocido", $code = 200){

        $ci = &get_instance();

        $json = ["error" => 1, "mensaje" => $message];

        $ci->output
        ->set_content_type('application/json')
        ->set_status_header($code)
        ->set_output(json_encode($json));

    }   
}