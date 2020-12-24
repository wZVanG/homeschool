angular.module('app').controller("UsuariosReemplazoCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", "Sedes", "Areas", "Oficinas", function($scope, API, WAIUtils, $compile, Callbacks, Sedes, Areas, Oficinas){

    $scope.module_name = "usuarios_reemplazo";

    $scope.sedes = Sedes;
    $scope.areas = Areas;
    $scope.oficinas = Oficinas;

    $scope.moment = (a) => {
        return moment(a).toDate();
    };
    
    $scope.info = {
        title: "Usuarios Reemplazo"
    };

    $scope.dtOptions = {
        "ajax": WAIUtils.urlListar($scope.module_name),

        "columns": WAIUtils.createColumns($scope.module_name, {
            "cargo":              {"class": "cell-export"},
            "oficina":              {"class": "cell-export"},
            "fecha_inicio":              {"class": "cell-export"},
            "fecha_fin":                {"class": "cell-export"},
            "cargo_nombre_usuario":      {"class": "cell-export"},
            "reemplazo_nombre_usuario":      {"class": "cell-export"},
            "cargo_nombre_completo":      {"class": "cell-export"},
            "reemplazo_nombre_completo":      {"class": "cell-export"},
            "cargo_numero_documento":      {"class": "cell-export"},
            "reemplazo_numero_documento":      {"class": "cell-export"},
        })
    };

    Callbacks.ctrlInit.apply(this, arguments);
}])