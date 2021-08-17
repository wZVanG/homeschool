angular.module('app').controller("PeriodosCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", function($scope, API, WAIUtils, $compile, Callbacks){


	console.log("WAI", WAI.parametros.libros);
	$scope.module_name = "periodos";

	$scope.info = {
		title: "Periodos"
	};

	$scope.periodo_libros = {};

	function cleanPeriodosLibros(){
		
		WAI.parametros.libros.forEach(item => {
			$scope.periodo_libros[item.id_libro] = 0;
		});
	}

	cleanPeriodosLibros();

	$scope.$watch("periodo_libros", function(value){
		console.log("value -->", value)
	}, true);

	$scope.loading_item = false;


	$scope.loadItem = function(nuevo, registro_info){

		if(nuevo) return;
		
        API.$http.post(API.url("periodos", "cargar_libros"), {id_periodo: registro_info.id_periodo}).success(function(data){

			cleanPeriodosLibros();

			data.forEach(item => {
				$scope.periodo_libros[item.id_libro] = item.estado == 1 ? +item.id_bloque : 0;
			});

        }).finally(() => {
            $scope.loading_item = false
        });
	}

	$scope.loading_switch = false

	$scope.switchLibro = guardar;

	function guardar(id_periodo, item){

        if($scope.loading_switch) return;

        $scope.loading_switch = true;

        let post_data = Object.assign({}, {id_periodo: id_periodo, id_libro: item.id_libro, id_bloque: $scope.periodo_libros[item.id_libro]});
		
        API.$http.post(API.url("periodos", "switch_libro"), post_data).success(function(data){

            if(!data.ok){
				//$scope.periodo_libros[item.id_libro]	
			}

        }).finally(() => {
            $scope.loading_switch = false
        });
	}
	
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
			"maximo_libros":			{"class": "cell-export", "visible": true},
			"descripcion":				{"class": "cell-export", "visible": false},
			"foto":						{"class": "cell-export", "visible": false},
			"fecha_registro":			{"class": "cell-export", "visible": true},
			"fecha_actualizacion":		{"class": "cell-export", "visible": false},
			"usuario_registro":			{"class": "cell-export", "visible": false},
			"usuario_actualizacion":	{"class": "cell-export", "visible": false},
		})
	};

	Callbacks.ctrlInit.apply(this, arguments);
}])