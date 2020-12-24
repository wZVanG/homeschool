<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once(FCPATH . "/vendor/rmccue/requests/library/Requests.php");
Requests::register_autoloader();
require_once(FCPATH . "/vendor/culqui/culqi-php/lib/culqi.php");

class Culqi {

  public function __construct() {

  }

  public function checkout($data) {

    // Configurar tu API Key y autenticación
$SECRET_KEY = "vk9Xjpe2YZMEOSBzEwiRcPDibnx2NlPBYsusKbDobAk";
$culqi = new Culqi\Culqi(array('api_key' => $SECRET_KEY));

    
  $stripe_secret_key	=	$data['stripe_secret_key'];
  \stripe\Stripe::setApiKey($stripe_secret_key);
      try {
          $charge = \stripe\Charge::create(array(
              'source'    => $data['stripe_token'],
              'amount'    => $data['amount'],
              'currency'  => 'usd',
              'description' => $data['description']
          ));
      } catch (Exception $e) {
          //print($e);
      }

  }

}