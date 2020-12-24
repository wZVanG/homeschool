<?php defined('BASEPATH') OR exit('No direct script access allowed');

//Habilitar envio de correo en Gmail https://accounts.google.com/b/1/DisplayUnlockCaptcha
// https://myaccount.google.com/lesssecureapps

$config = array(
    'protocol' => 'smtp', // 'mail', 'sendmail', or 'smtp'
    'smtp_host' => 'ssl://smtp.googlemail.com', 
    'smtp_port' => 465,
    'smtp_user' => 'the.wai.technologies@gmail.com',
    'smtp_pass' => 'dkjIEX0hm3',
    //'smtp_crypto' => 'ssl', //can be 'ssl' or 'tls' for example
    'mailtype' => 'html', //plaintext 'text' mails or 'html'
    'smtp_timeout' => '4', //in seconds
    'charset' => 'UTF-8',
    'wordwrap' => TRUE
);
