window.app = angular.module('Tramite', ['angularMoment'])
//angular.module("app", ["ngAnimate", "ngAria", "ngCookies", "angularMoment", "ngMessages", "ngResource", "ngSanitize", "ngMaterial", "ngStorage", "ngStore", "ui.router", "ui.utils", "ui.bootstrap", "ui.load", "ui.jp", "pascalprecht.translate", "oc.lazyLoad", "angular-loading-bar","angularFileUpload"]), angular.module("app").controller("AppCtrl", ["$scope", "$translate", "$localStorage", "$window", "$document", "$location", "$rootScope", "$timeout", "$mdSidenav", "$mdColorPalette", "$anchorScroll", function(a, b, c, d, e, f, g, h, i, j, k) {
/*
.config(["$stateProvider", "$locationProvider", "MODULE_CONFIG", "$httpProvider", "$mdDateLocaleProvider", function ($stateProvider, $locationProvider, MODULE_CONFIG, $httpProvider, $mdDateLocaleProvider) {

}]);*/



window.app.controller("TramiteVerCtrl", ["$scope", "$http", function ($scope, $http) {
    
    $scope.codigo = window.get_codigo || "";
    $scope.tramite = {};
    $scope.movimiento = {};
    $scope.text_buscando = "Buscar";

    function actualizarTramite(tramite){

        console.log("tramite", tramite);
        
        $scope.movimiento = tramite.movimiento;
    
        let fechas = {};
        $scope.tramite = tramite;
        //Omitir de la misma fecha (se están mostrando también los registros enviados a diferentes cargos)
        //$scope.items = Tramite.historial.filter(({fecha}) => fechas.indexOf(fecha) === -1 ? (fechas.push(fecha), true) : false);
        $scope.items = [];
        $scope.tramite.historial.forEach((item, i) => {
            
            if(!(item.fecha in fechas)){
                fechas[item.fecha] = [];
                $scope.items.push(item);
            }
    
            fechas[item.fecha].push({
                id_usuario_destino: item.id_usuario_destino,
                destino_cargo: item.destino_cargo,
                destino_nombre_completo: item.destino_nombre_completo,
                destino_nombre_usuario: item.destino_nombre_usuario,
                destino_oficina: item.destino_oficina,
                destino_sede: item.destino_sede,
            });
    
            item.destinos = fechas[item.fecha];

        });        

        document.querySelector(".doks").classList.add("open_resultado");

    }

    $scope.cerrarResultado = () => {
        document.querySelector(".doks").classList.remove("open_resultado");
    };
   
    $scope.linkAdjunto = nombre_archivo => $("base").prop("href") + "uploads/" + nombre_archivo;

    $scope.descargarAdjunto = (event, nombre_archivo) => {
        window.open($scope.linkAdjunto(nombre_archivo), "_blank");
    };

    let apertura = false, derivacion = false, cierre = false;
    $scope.timelineHeader = (item) => {
        if(item.header) return true;
        else if(item.tipo_movimiento == 1 && !apertura) return (apertura = true, item.header = true);
        else if(item.tipo_movimiento == 2 && !derivacion) return (derivacion = true, item.header = true);
        else if(item.tipo_movimiento == 3 && !cierre) return (cierre = true, item.header = true);
        return false;
    };

    $scope.timelineText = (item) => {
        return ({
            1: "Inicio",
            2: "Derivar",
            3: "Archivado"
        })[item.tipo_movimiento];
    };

    $scope.loading = false;

    $scope.buscar = () => {

        if($scope.loading) return;

        $scope.loading = true;

        $scope.text_buscando = "Buscando...";

        $http.post("consulta", {codigo: $scope.codigo || "0", consulta: 1}).success(data => {
            if(data.error){
                alert(data.mensaje);
                return;
            }

            //$scope.tramite = data;
            actualizarTramite(data);

        }).finally(() => {
            $scope.loading = false;
            $scope.text_buscando = "Buscar";
        });
    }


}]);
/*
$(document).ready(function(){

    var enviando = false;
    
    $("#formulario").submit(function(e){
       
        e.preventDefault();
    
        if(enviando) return;
    
        enviando = true;
    
        var val = $("#campo").val(), result = $("#resultado");
    
        result.removeClass("error exito");
    
        $("[type='submit']").val("Buscando...");
        
        $.post("consulta", {codigo: (val || "0")}, function(data){
    
            result.addClass(data.indexOf("available") !== -1 ? "exito" : "error");
            result.html(data);
            $("[type='submit']").val("Enviar");
    
            enviando = false;
        });
      
    })
});*/