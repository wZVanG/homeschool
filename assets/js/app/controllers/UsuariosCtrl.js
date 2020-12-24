angular.module('app').controller("UsuariosCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", function($scope, API, WAIUtils, $compile, Callbacks){

    $scope.module_name = "usuarios";

    $scope.info = {
        title: "Usuarios"
    };
    
    $scope.dtOptions = {
        "ajax": WAIUtils.urlListar($scope.module_name),
 
       "columns": WAIUtils.createColumns($scope.module_name, {
            "nombre_usuario": { render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'nombre_usuario',
                    description: 'Nombre Usuario',
                    html: data
                });
            }, "class": "cell-export"},
            "nombre_completo":       {"class": "cell-export"},
            "rol":       {"class": "cell-export"},
        })
    };

    Callbacks.ctrlInit.apply(this, arguments);
}])