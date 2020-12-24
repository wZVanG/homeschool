angular.module('app').controller("UbicacionesCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", function($scope, API, WAIUtils, $compile, Callbacks){

    $scope.module_name = "ubicaciones";

    $scope.info = {
        title: "Ubicaciones"
    };
    
    $scope.dtOptions = {
        "ajax": WAIUtils.urlListar($scope.module_name),

       "columns": WAIUtils.createColumns($scope.module_name, {
            "codigo": { render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'codigo',
                    description: 'Código URL',
                    html: data
                });
            }, "class": "cell-export"},
            "nombre": { render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'nombre',
                    description: 'Denominación',
                    html: data
                });
            }, "class": "cell-export"},
            "descripcion": {render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'descripcion',
                    description: 'Descripción',
                    html: data
                });
            }, "class": "cell-export"}
        })
    };

    Callbacks.ctrlInit.apply(this, arguments);
}])