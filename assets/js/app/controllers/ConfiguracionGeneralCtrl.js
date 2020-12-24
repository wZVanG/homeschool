angular.module('app').controller("ConfiguracionGeneralCtrl", ["$scope", "$http", "API", "WAI", "FileUploader", "$mdToast", "$timeout", "Info", "$filter", function($scope, $http, API, WAI, FileUploader, $mdToast, $timeout, Info, $filter){
    
    if(!Info) Info = {};
    Info.institucion = Info.institucion || {};

    $scope.Info = Info;

    $scope.tab_active = "institucion";

    $scope.registro_info = {
        institucion: Info.institucion || {},
        configuracion: Info.institucion.configuracion || {}
    };

    $scope.registro_info.configuracion.externo = $scope.registro_info.configuracion.externo || {};
    
    $scope.registro_info.configuracion.externo["archivos_permitidos"] = $scope.registro_info.configuracion.externo["archivos_permitidos"] || ["pdf"];
    

    $scope.selectedItem = null;
    $scope.searchText = null;
    $scope.querySearchItems = query => $filter("filter")(WAI.parametros.videos_lite, query);   

    $scope.loading = false;
 
    function guardar(tipo, subtipo){
        //console.log("registro_info", $scope.registro_info);

        if($scope.loading) return;

        let post_data = {tipo: tipo, subtipo: subtipo};

        Object.assign(post_data, tipo === 'institucion' ? $scope.registro_info[tipo] : $scope.registro_info[tipo][subtipo]);

        $scope.loading = true;

        console.log("post_data", post_data);
//        return;

        $http.post(API.url("configuracion", "guardar"), post_data).success(function(data){

            let mensaje = data.ok ? (data.mensaje || "Guardado correctamente") : data.mensaje;

            $scope.loading = false;
            
            $mdToast.show(
                $mdToast.simple()
                .textContent(mensaje)
                .hideDelay(2500));

            if(!data.ok) return;

            //$state.go("gestion.tramite.enviados");
        });
    }

    $scope.guardar = guardar;
 

}])