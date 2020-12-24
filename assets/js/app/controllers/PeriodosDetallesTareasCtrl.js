angular.module('app').controller("PeriodosDetallesTareasCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", function($scope, API, WAIUtils, $compile, Callbacks){

	$scope.module_name = "periodos_detalles_tareas";

	$scope.info = {
		title: "Tareas"
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