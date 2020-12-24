<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en" ng-app="Tramite">
<head>
  <meta charset="utf-8" />
  <base href="<?=$this->config->item("base_url")?>" />
  <title>Consulta - Documento Trámite</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="apple-touch-icon" sizes="180x180" href="./assets/images/logo/favicon/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="./assets/images/logo/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/logo/favicon/favicon-16x16.png">
  <link rel="manifest" href="./assets/images/logo/favicon/site.webmanifest">
  <link rel="mask-icon" href="./assets/images/logo/favicon/safari-pinned-tab.svg" color="#5bbad5">
  <link rel="shortcut icon" href="./assets/images/logo/favicon/favicon.ico">
  <meta name="msapplication-TileColor" content="#2d89ef">
  <meta name="msapplication-config" content="./assets/images/logo/favicon/browserconfig.xml">
  <meta name="theme-color" content="#ffffff">
  <link rel="stylesheet" href="./assets/css/vendor.min.css?v=1" type="text/css" />
  <link rel="stylesheet" href="./assets/external/consulta.css?v=1" type="text/css" />
  
      <script>
        window.DOKS = <?=json_encode($collection)?>;
        window.DOKS_config = <?=json_encode($config)?>;
        window.get_codigo = "<?=$get_codigo?>";
    </script>
</head>
<body ng-controller="TramiteVerCtrl" class="doks">

    <div class="main">
        <form name="formulario" ng-submit="buscar()">
            <div class="logo"></div>
            
            <p><b>Trámite Documentario <span class="highlight">WAI COMPANY</span></b></p>
            <br />
            
            <h2>Consultar Documento</h2>
            <p><input placeholder="Ingrese el código de trámite" type="text" ng-model="codigo" name="codigo" autocomplete="off" /></p>
            <div class="text-center text-muted"><H4> Ejemplo: EXT2020000040 </H4></div>
            <p><input type="submit" ng-value="text_buscando" /></p>
            <p id="resultado"></p>
            <p class="copyright">
                <H6> Copyright © 2020 <a href="http://www.sedachimbote.com.pe/" target="_blank">WAI COMPANY</a></H6>
            </p>
        </form>
            
    </div>

    <div class="resultado">
        <div class="content">
            <div class="m-r-sm">
                <div class="resultado-descripcion">
                    <div class="text-center">Resultados de Búsqueda: <b>{{tramite.tramite.tipo_origen == 1 ? 'INT' : 'EXT'}}{{tramite.tramite.codigo}}</b></div>
                    <div><b>Asunto</b>: {{tramite.tramite.asunto}}</div>
                    <div><b>Mensaje</b>: {{tramite.tramite.mensaje}}</div>
                    <div><i>- {{tramite.tramite.nombre_completo}}</i></div>
                </div>
                <ul class="timeline ng-scope" ng-class="{'timeline-center': center}">
                    <li hidden ng-repeat-start="item in items | orderBy:'fecha'" ></li>
                    <li class="tl-header list-item-static" ng-show="timelineHeader(item)"  ng-style="{'animation-delay': ($index * 0.15 + 0.25) + 's'}">
                        <span class="badge pos-rlt" ng-class="{'bg-dark': item.tipo_movimiento == 3, 'bg-success': item.tipo_movimiento == 2, 'bg-primary': item.tipo_movimiento == 1}">
                            <b class="arrow bottom pull-in" ng-class="{'b-dark': item.tipo_movimiento == 3, 'b-success': item.tipo_movimiento == 2, 'b-primary': item.tipo_movimiento == 1}"></b>{{timelineText(item)}}
                        </span>
                    </li>
                    <li class="tl-item tl-left list-item-static" ng-class="{'active': $last}" ng-style="{'animation-delay': ($index * 0.15 + 0.25) + 's'}">
                    
                            <div class="tl-wrap" ng-class="{'b-dark': item.tipo_movimiento == 3, 'b-success': item.tipo_movimiento == 2, 'b-primary': item.tipo_movimiento == 1}">
                            <span class="tl-date text-muted" title="{{item.fecha}}">{{item.fecha | amTimeAgo}} <br /> <i class="text-small">{{item.fecha | amDateFormat:'hh:mm a'}}</i></span>
                            <div class="tl-content panel panel-card dk block">
                                <span class="arrow b-white left pull-top hidden-left"></span>
                                <span class="arrow b-white right pull-top visible-left"></span>
                                <div class="text-lt p-h m-b-sm">
                                {{item.cargo_origen}} - {{item.nombre_completo_origen}} <span class="label" ng-class="{'bg-dark': item.tipo_movimiento == 3, 'bg-success': item.tipo_movimiento == 2, 'bg-primary': item.tipo_movimiento == 1}">
                                    {{item.accion}}</span> 
                                <!--<md-button class="pull-right md-secondary md-icon-button adjunto-button"
                                    ng-click="descargarAdjunto($event, item.nombre_archivo)"
                                    ng-show="item.flag_adjunto == 1">
                                    <md-icon>attach_file</md-icon>
                                </md-button>-->
                                </div>
                                <div class="panel-body b-t b-light p-h">
                                    <div class="text-muted text-small">{{item.sede}} - {{item.oficina_origen}}</div>
                                    <div md-truncate><small><i class="fa fa-check"></i> {{item.mensaje}}</small></div>
                                    <div ng-if="item.tipo_origen == 2 && $first">{{item.empresa}} · <small>{{item.empresa_numero_documento}}</small> · {{item.email}}</div>
                                    <!-- Destino actual solo al último movimiento-->
									<div ng-if="$last">
										<div>↘ <span class="label bg-light"> Actualmente en:</span></div>
										<div class="m-l-lg small" ng-repeat="destino in item.destinos" title="{{destino.destino_sede}} · {{destino.destino_oficina}} · {{destino.destino_cargo}}">{{destino.destino_oficina}} · <span class="md-muted">{{destino.destino_nombre_completo}}</span></div>
									</div>
									<!-- //Destino actual solo al último movimiento-->
                                </div>             
                            </div>
                            </div>
                    </li>
                    <li ng-repeat-end hidden></li>
            
                </ul>
            </div>
            <span class="close" ng-click="cerrarResultado()">X</span>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.3/angular.min.js"></script>
    <script src="./assets/external/moment.min.js?v=1"></script>
    <script src="./assets/external/moment-es.min.js?v=1"></script>
    <script src="./assets/external/angular-moment.min.js?v=1"></script>
    <script src="./assets/external/consulta.js?v=1"></script>
</body>
</html>