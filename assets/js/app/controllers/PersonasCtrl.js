angular.module('app').controller("PersonasCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", function($scope, API, WAIUtils, $compile, Callbacks){

    $scope.module_name = "personas";

    $scope.info = {
        title: "Personas"
    };
    
    $scope.dtOptions = {
        "ajax": WAIUtils.urlListar($scope.module_name),

       "columns": WAIUtils.createColumns($scope.module_name, {
            "tipo_documento": {"class": "cell-export"},
            "numero_documento": {"class": "cell-export"},
            "nombre_completo": {"class": "cell-export"},
            "tipo_persona": {"class": "cell-export"},
            "email": {"class": "cell-export"},
            "celular": {"class": "cell-export"},
        })
    };

    Callbacks.ctrlInit.apply(this, arguments);
}])