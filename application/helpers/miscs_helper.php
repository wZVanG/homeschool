<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('one_zero'))
{
    function one_zero($value){
        return $value ? 1 : 0;
    }   
}


if ( ! function_exists('paths'))
{
    function paths($url, $directory = null){
        $path = ($directory === null ? './' : $directory);
        $path = preg_replace('/\/$/', '/', $path);
        $url = preg_match("/^https?\:/", $url) ? $url : $path . $url;
        return $url;
    }   
}

if ( ! function_exists('extract_items'))
{
    function extract_items($text = '', $separator = '|'){
        
        $text = preg_split('/\n/', trim((string) $text));
        $items = [];

        foreach($text AS $item){
            $line = explode($separator, $item);
            if(!trim($line[0])) continue;
            $line = array_map('trim', $line);
            $items[] = $line;
        }

        return $items;
    }   
}