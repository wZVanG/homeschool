angular.module('app').controller("ViajerosCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", function($scope, API, WAIUtils, $compile, Callbacks){

    $scope.module_name = "viajeros";

    $scope.info = {
        title: "Viajeros / Carga"
    };
    
    $scope.dtOptions = {
        "ajax": WAIUtils.urlListar($scope.module_name),

       "columns": WAIUtils.createColumns($scope.module_name, {
            "tipo_documento": {"class": "cell-export"},
            "numero_documento": {"class": "cell-export"},
            "nombre_completo": { "class": "cell-export"},
            "email": {"class": "cell-export"},
            "celular": {"class": "cell-export"},
            "fecha_registro": {"class": "cell-export"}
        })
    };

    Callbacks.ctrlInit.apply(this, arguments);
}])