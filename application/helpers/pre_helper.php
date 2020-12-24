<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('p'))
{
    function p($data){
        echo "<pre>";
        var_dump($data); exit;
    }   
}