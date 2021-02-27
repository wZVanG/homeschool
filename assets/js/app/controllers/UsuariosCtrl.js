angular.module('app').controller("UsuariosCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", function($scope, API, WAIUtils, $compile, Callbacks){

    $scope.module_name = "usuarios";

    $scope.info = {
        title: "Usuarios"
    };

    $scope.bloques = {};
    $scope.bloques_loading = {};
    $scope.bloquest_list_loading = true;

    $scope.cargarBloque = (id_usuario) => {
        API.$http.get(API.url("usuarios", "cargar_bloques", id_usuario)).success(data => {
            $scope.bloquest_list_loading = false;
            $scope.bloques = data;
            for(let x in data){
                $scope.bloques_loading[x] = false;
            }
        });
    };

    $scope.cambiarBloque = (id_usuario, id_periodo) => {
        let id_bloque = $scope.bloques[id_periodo];
        $scope.bloques_loading[id_periodo] = true;
        API.$http.post(API.url("usuarios", "cambiar_bloque", id_usuario, id_periodo, id_bloque)).success(data => {
            $scope.bloques_loading[id_periodo] = false;
        });
    };

    $scope.$on("$destroy", () => {
        $scope.bloques = {};
        $scope.bloques_loading = {};
    })

    $scope.$watch("bloques", value => {
        console.log(value)
    }, true);
    
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