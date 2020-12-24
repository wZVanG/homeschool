angular.module('app').controller("EstadoEnvioCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", function($scope, API, WAIUtils, $compile, Callbacks){

    $scope.module_name = "estado_envio";

    $scope.info = {
        title: "Estados de Envío"
    };
    
    $scope.dtOptions = {
        "ajax": WAIUtils.urlListar($scope.module_name),
 
       "columns": WAIUtils.createColumns($scope.module_name, {
            "nombre": { render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'nombre',
                    description: 'Denominación',
                    html: data
                });
            }, "class": "cell-export"}
        })
    };

    Callbacks.ctrlInit.apply(this, arguments);
}])