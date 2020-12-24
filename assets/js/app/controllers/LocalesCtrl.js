angular.module('app').controller("LocalesCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", function($scope, API, WAIUtils, $compile, Callbacks){

    $scope.module_name = "locales";

    $scope.info = {
        title: "Locales"
    };
    
    $scope.dtOptions = {
        "ajax": WAIUtils.urlListar($scope.module_name),
        "columns": WAIUtils.createColumns($scope.module_name, {
            "nombre": { render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'nombre',
                    description: 'Nombre',
                    html: data
                });
            }, "class": "cell-export"},
            "tipo": {visible:true}
        })
    };

    Callbacks.ctrlInit.apply(this, arguments);
    
}])