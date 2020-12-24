angular.module('app').controller("VideosCtrl", ["$scope", "API", "WAIUtils", "$compile", "Callbacks", "$filter", function($scope, API, WAIUtils, $compile, Callbacks, $filter){

    $scope.module_name = "videos";

    $scope.info = {
        title: "Videos"
    };

    $scope.dtOptions = {
        "ajax": WAIUtils.urlListar($scope.module_name),

        "columns": WAIUtils.createColumns($scope.module_name, {

            "description_short": {"class": "cell-export", "visible": false},
            "description_long": {"class": "cell-export", "visible": false},
            "description_add": {"class": "cell-export", "visible": false},
            "id_categoria": {"visible": false},
            "id_genero": {"visible": false},
            "title": { render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'title',
                    description: 'Título',
                    html: data
                });
            }, "class": "cell-export"},
            "year": {render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'year',
                    description: 'Año',
                    html: data
                });
            }, "class": "cell-export"},
            "url": {render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'url',
                    description: 'URL',
                    html: data
                });
            }, "class": "cell-export"},
            "trailer": {render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'trailer',
                    description: 'Trailer',
                    html: data
                });
            }, "class": "cell-export"},
            "portada": {render: function(data, type, row){
                return WAIUtils.createEditable({
                    module: $scope.module_name,
                    id: row[0],
                    name: 'portada',
                    description: 'Portada',
                    html: data
                });
            }, "class": "cell-export"},
            "actors": {visible: false},
            "categoria_url": {visible: false}

        })
    };
    
    let args = Array.prototype.slice.call(arguments);
    let filter = $filter;
    args[5] = null;
    args[6] = function($scope){
        
        let actor_actual = [];
        try{
            actor_actual = JSON.parse($scope.registro_info.actors||"[]");
        }catch(e){}

        console.log("$scope.registro_info.actors", $scope.registro_info.actors);
        $scope.chips = WAI.parametros.actor.filter(item => {
            return actor_actual.indexOf(String(item.id_actor)) !== -1;
        });
        $scope.selectedItem = null;
        $scope.searchText = null;
        $scope.querySearchItems = query => filter("filter")(WAI.parametros.actor, query);   

        $scope.$watch("chips", items => {
            if(!items) return;
            $scope.registro_info.actors = JSON.stringify(items.map(item => String(item.id_actor)));
        }, true);
      
        
    };
    
    //Callbacks.ctrlInit.apply(this, arguments);
    Callbacks.ctrlInit.apply(this, args);

}])