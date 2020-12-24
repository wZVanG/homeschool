app.service("Cliente", ["Usuario", "$http", "API", "$state", "$mdToast", function(Usuario, $http, API, $state, $mdToast){
    
    var el = this;
  
    this.preScripts = function(type, $scope){

        switch(type){
            case 'TramiteNuevoCtrl': 

                //Script para Cliente UGEL Huari
                if(!Usuario.tienePermisos([3])){
                    $scope.seleccionar_tipo_origen = false;
                    $scope.registro_info.tipo_origen = Usuario.tienePermisos([2]) ? 2 : 1;
                }

                /*const pertenece_rol_externo = (Usuario.cargos||[]).some(({id_sede, id_oficina, id_cargo_usuario, id_usuario, oficina}) => {
                    return id_oficina == 6 || oficina.match(/MESAS? DE PARTES?/i);
                });
                $scope.registro_info.tipo_origen = pertenece_rol_externo ? 2 : 1;*/
                //script para Cliente UGEL Huari

                break;
            case 'GuardarTramiteNuevo':
                //Script para Cliente UGEL Huari
                /*if(!$scope.registro_info.nombre_archivo){
                    $mdToast.show(
                        $mdToast.simple()
                        .textContent("Por favor adjunta un archivo para enviar el expediente")
                        .hideDelay(3e3));
                    return false;
                }*/
                if($scope.registro_info.tipo_origen == 2 && ($scope.registro_info.nombre_archivo || "").length){
                    if(!/.pdf$/i.test($scope.registro_info.nombre_archivo)){
                        $mdToast.show(
                            $mdToast.simple()
                            .textContent("Solo se permite archivos PDF para documentos externos")
                            .hideDelay(3e3));
                        return false;
                    }
                }
                //Script para Cliente UGEL Huari
                return true;
                break;
        }

        return true;

    }
}]);