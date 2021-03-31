<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="es" ng-app="WAI">
<head>
  <meta charset="utf-8" />
  <base href="<?=$this->config->item("base_url")?>" />
  <title ng-bind="($state.current.data.title ? $state.current.data.title + ' - ' : '') + '<?=$titulo?>'"><?=$titulo?></title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="apple-touch-icon" sizes="180x180" href="./assets/images/logo/favicon/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="./assets/images/logo/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/logo/favicon/favicon-16x16.png">
  <meta name="description" content="<?=htmlspecialchars($locals["institucion"]["description"])?>" />
  <meta name="keywords" content="<?=htmlspecialchars($locals["institucion"]["keywords"])?>" />
  <meta name="author" content="WAI Technology" />
  <link rel="manifest" href="./assets/images/logo/favicon/site.webmanifest?3">
  <link rel="mask-icon" href="./assets/images/logo/favicon/safari-pinned-tab.svg" color="#00b7b7">
  <link rel="shortcut icon" href="./assets/images/logo/favicon/favicon.ico">
  <meta name="msapplication-TileColor" content="#00b7b7">
  <meta name="msapplication-config" content="./assets/images/logo/favicon/browserconfig.xml">
  <meta name="theme-color" content="#00b7b7">
  <link rel="stylesheet" href="./assets/wai/css/bootstrap.min.css" >
  <link rel="stylesheet" href="./assets/wai/css/angular-material.min.css" >
  <link rel="stylesheet" href="./assets/wai/css/homeschool.css" >
  <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">-->
  <script>
    <?php
      if($config["is_localhost"]):
    ?>
    window.WAI = <?=(json_encode($locals))?>;
    <?php
      else:
    ?>
    window.WAI = JSON.parse(atob("<?=base64_encode(json_encode($locals))?>"));
    <?php
      endif;
    ?>
  </script>
</head>
<body layout="column">
  <homeschool current="{{$state.current.name}}" layout="row" layout-fill></homeschool>
  <script src="./assets/wai/js/jquery-2.2.4.min.js"></script>
  <script src="./assets/wai/js/bootstrap.min.js"></script>
  <script src="./assets/wai/js/angular.min.js"></script>
  <script src="./assets/wai/js/angular-ui-router.min.js"></script>
  <script src="./assets/wai/js/compiled.js"></script>
  <script src="./assets/js/libraries/ng-file-upload-shim.js"></script>
  <script src="./assets/js/libraries/ng-file-upload.js"></script>
  <script src="./assets/wai/js/angular-material.min.js"></script>
  <script src="./assets/wai/js/utils.js"></script>
  <script src="./assets/wai/js/homeschool.js"></script>
</body>
</html>