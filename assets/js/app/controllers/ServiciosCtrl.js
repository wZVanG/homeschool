angular.module('app').controller("ServiciosCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", function($scope, API, WAIUtils, $compile, Callbacks){

    $scope.module_name = "servicios";

    $scope.info = {
        title: "Servicios"
    };
    
    $scope.dtOptions = {
        "ajax": WAIUtils.urlListar($scope.module_name),
        "columns": WAIUtils.createColumns($scope.module_name, {
            "name": { render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'name',
                    description: 'Denominación',
                    html: data
                });
            }, "class": "cell-export"},
            "tipo": {"class": "cell-export"}
        })
    };

    Callbacks.ctrlInit.apply(this, arguments);
    
}])