app.controller("SesionCtrl", ["$scope", "$http", "API", "$mdToast", "$state", "WAI", "Usuario", function($scope, $http, API, $mdToast, $state, WAI, Usuario){

    $scope.user = {
        cargo_index: -1
    };
    $scope.loading = false;
    $scope.cargos = [];
    $scope.cargos_login = [];

    $scope.login = function(){
        
        $scope.cargos = [];
        $scope.loading = true;

        $http.post(API.url("sesion", "login"), $scope.user).success(function(data){
            $scope.loading = false;
            $mdToast.show(
                $mdToast.simple()
                .textContent(data.mensaje)
                .hideDelay(2000));
            
            if(data.prompt){
                $scope.cargos_login = data.row_cargos;
                $scope.user.cargo_index = -2;
                return;
            }

            if(!data.login) return;
            Usuario.setCargos(data.cargos);
            Usuario.login(data.usuario);
            $state.go("administracion.usuarios");
                
        });
    }
}])