angular.module('app').controller("TrackingListadoCtrl", ["$scope", "API", "DoksUtils", "WAI", "$http", "$timeout", "$interval", "FileUploader", "$mdToast", "$mdDialog", "$state", "$filter", "Usuario", "Cliente", "Periodos", "PeriodosDetalles", "PeriodosMatriculas", "PeriodosDetallesTareas", "$window" ,function($scope, API, DoksUtils, WAI, $http, $timeout, $interval, FileUploader, $mdToast, $mdDialog, $state, $filter, Usuario, Cliente, Periodos, PeriodosDetalles, PeriodosMatriculas, PeriodosDetallesTareas, $window){


    $scope.Periodos = Periodos;
    $scope.PeriodosDetalles = PeriodosDetalles;
    $scope.PeriodosMatriculas = PeriodosMatriculas;
    $scope.PeriodosDetallesTareas = PeriodosDetallesTareas;

    $scope.registro_info = {
        id_local: 0
    };

    $scope.lista_notas = [];

    $scope.$watch("registro_info.id_periodo_detalle", value => {

        if(!value) return;

        $http.post(API.url("Periodos_detalles_tareas", "respuestas", `?id_periodo_detalle=${value}`)).success(data => {
            console.log("data", data);
            let notas = data;
                    
            $scope.lista_notas = PeriodosDetallesTareas.filter(i => +i.id_periodo_detalle === +value);

            /*$scope.lista_notas.forEach(item => {
                item._estudiantes = PeriodosMatriculas.reduce((obj, matricula) => {
                    obj[matricula.id_periodo_matricula] = notas.find((i) => {
                        return i.id_periodo_detalle_tarea == item.id_periodo_detalle_tarea && i.id_estudiante == matricula.id_usuario
                    });
                    return obj;
                }, {});
            });*/
            
        })

        

    });



    $scope.verImagen = (ev, item) => {
        $window.open("./uploads/productos/" + item.foto);
    }

    $scope.historial = function(ev, id, ver){
        $mdDialog.show({
            controller: 'TrackingVerCtrl',
            templateUrl: "./assets/views/gestion/ver.html",
            preserveScope: true,
            multiple: true,
            targetEvent: ev,
            clickOutsideToClose: true,
            escapeToClose: true,
            fullscreen: true,
            resolve: {
                IdTramiteMovimiento: () => id,

                IsVer: () => ver,

                Tramite: ["$http", "$q", ($http, $q) => {
                    let defer = $q.defer();
                    $http.get(API.url("tracking", "ver", id)).success(function(response){
                        defer.resolve(response)
                    });
                    return defer.promise
                }]
            }
        }).then(function (answer) {
        }, function () {
        });
    };



    //Crud
	let scope_crud_clientes = {
		/*registro_info: {CLI_IdCliente: }*/
	};
	$scope.crud_cliente = API.crud("clientes", scope_crud_clientes, null, function(){
        console.log("MODAL OPENEND!")
    });
	$scope.crud_cliente_callbacks = {
		onSave: (result, crud_params) => {
            
			//const integrante_index = crud_params[0];
			let item = result.item;

            $scope.BuscarTemp.id_cliente = angular.copy(item);
            $scope.BuscarTextos.id_cliente = item.nombre_completo;
            $scope.registro_info.id_cliente = item.id_cliente;

		}
	};
    
    Cliente.preScripts('TramiteNuevoCtrl', $scope);
    

    $scope.BuscarTemp = {id_cliente: void 0};
    $scope.BuscarTextos = {id_cliente: ''};

    $scope.$watchCollection("BuscarTemp",function(items){
        
        if(!items) return;
        //console.log("items", items);
        angular.forEach(items,function(value, key){

            console.log("value", value)
            
            if(value) $scope.registro_info[key] = value[key];

            //Para evitar error en crud (variable items loading)
            //if(key == 0) $scope.registro_info['CLI_IdCliente'] = value[key];

            if(key === 'id_cliente' && value){

                if(!scope_crud_clientes.items) scope_crud_clientes.items = {};
                scope_crud_clientes.items[value.id_cliente] = {loading: false};
            }
            
            
        })
    });
    
    $scope.BuscarFn = {};
    $scope.BuscarFn.personas = API.autocompleteList('personas');
    $scope.BuscarFn.clientes = API.autocompleteList('clientes');



}])