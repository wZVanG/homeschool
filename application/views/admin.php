<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="es"  ng-app="app">
<head>
  <meta charset="utf-8" />
  <base href="<?=$this->config->item("base_url")?>" />
  <title ng-bind="($state.current.data.title ? $state.current.data.title + ' - ' : '') + '<?=$titulo?>'"><?=$titulo?></title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="apple-touch-icon" sizes="180x180" href="./assets/images/logo/favicon/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="./assets/images/logo/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/logo/favicon/favicon-16x16.png">
  <link rel="manifest" href="./assets/images/logo/favicon/site.webmanifest?3">
  <link rel="mask-icon" href="./assets/images/logo/favicon/safari-pinned-tab.svg" color="#00b7b7">
  <link rel="shortcut icon" href="./assets/images/logo/favicon/favicon.ico">
  <meta name="msapplication-TileColor" content="#00b7b7">
  <meta name="msapplication-config" content="./assets/images/logo/favicon/browserconfig.xml">
  <meta name="theme-color" content="#00b7b7">
  <?php foreach($resources["styles"] AS $url): ?>
<link rel="stylesheet" href="<?=$url?>" type="text/css" />
  <?php endforeach; ?>
<script>
        window.WAI = <?=json_encode($collection)?>;
        window.WAI_config = <?=json_encode($config)?>
      </script>
</head>
<body>
  <div class="app project" ui-view ng-controller="AppCtrl" current="{{$state.current.name}}"></div>
  <?php foreach($resources["scripts"] AS $url): ?>
    <script src="<?=$url?>"></script>
  <?php endforeach; ?>
</body>
</html>