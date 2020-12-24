<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('json'))
{
    function json($json){
        $ci = &get_instance();

        $ci->output
        ->set_content_type('application/json')
        ->set_output(json_encode($json));
    }   
}