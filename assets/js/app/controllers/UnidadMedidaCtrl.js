angular.module('app').controller("UnidadMedidaCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", function($scope, API, WAIUtils, $compile, Callbacks){

    $scope.module_name = "unidad_medida";

    $scope.info = {
        title: "Unidad Medida"
    };
    
    $scope.dtOptions = {
        "ajax": WAIUtils.urlListar($scope.module_name),
 
       "columns": WAIUtils.createColumns($scope.module_name, {
            "nombre": { render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'nombre',
                    description: 'Unidad Medida',
                    html: data
                });
            }, "class": "cell-export"}
        })
    };

    Callbacks.ctrlInit.apply(this, arguments);
}])