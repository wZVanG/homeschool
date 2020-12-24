<?php

defined('BASEPATH') OR exit('No direct script access allowed');

date_default_timezone_set('America/Lima');


$config["app_constants"] = [];

defined('ROL_ADMINISTRADOR')        OR define('ROL_ADMINISTRADOR', 3);

defined('DATE_NOW')        OR define('DATE_NOW', date("Y-m-d"));
defined('DATETIME_NOW')        OR define('DATETIME_NOW', date("Y-m-d H:i:s"));

defined('ESTADO_MATRICULA_HOMESCHOOL_MATRICULADO')  OR define('ESTADO_MATRICULA_HOMESCHOOL_MATRICULADO', 1);



//4213 5500 8480 3807
defined('STRIPE_PUBLIC_KEY')        OR define('STRIPE_PUBLIC_KEY', 'pk_test_51Hd1NXItegEqeY0g9B3gVK32uevqg6G3AaYVEnbAcLuMeg1vaBs6D2R1hJ89D3b1t7q4gxFV2qWgfSOK8ZLAxVeY00J8cpGe5G');
defined('STRIPE_SECRET_KEY')        OR define('STRIPE_SECRET_KEY', 'sk_test_51Hd1NXItegEqeY0gABELacKWchmJiWwohLhOP54tVJWcLik2DWAnClpUGn3tt691R22qzRHT4j33vQRMYRRYawPx0011IOBYK8');
