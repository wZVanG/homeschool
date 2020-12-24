app.factory("API", ["WAI_CONSTANTS", "$resource", "$mdDialog", "$q", function (WAI_CONSTANTS, $resource, $mdDialog, $q) {
    var obj =  {
        url: function (controller, action) {
            var params = Array.prototype.slice.call(arguments);
            let url = `${WAI_CONSTANTS.BASE_API}${controller}/${action}${params.length > 2 ? "/" + params.splice(2).join("/") : ""}`;
            console.log("url", url);
            return url;
        },
        autocompleteList: function(module_name){
            var CRUDObj = $resource(`${WAI_CONSTANTS.BASE_API}crud/:moduleName?term=:term`, {moduleName: module_name}, {
                query: {method: 'get', isArray: true, cancellable: true},
                delete: {method: 'DELETE', cancellable: true},
            });
            var List = new CRUDObj();
            
            return List.$query
        },
        crud: function (module_name, parent, controllerName, executeModal) {

            var CRUDObj = $resource(`${WAI_CONSTANTS.BASE_API}crud/:moduleName`, {moduleName: module_name}, {
                one:  {method: 'get', isArray: false, cancellable: true}
            });

            parent.items = {};

            parent.editar = function($event, id){
                
                parent.crud.agregar($event, id);
            };

            parent.estado = function($event, id, estado){
                //parent.crud.estado($event, id);

                if(parent.items[id].loading) return;
                
                parent.items[id].loading = true;

                var Item = new CRUDObj(), defer = $q.defer();

                if(estado === 0){
                    var confirm = $mdDialog.confirm()
                    .title('¿Estás seguro de eliminar este registro?')
                    .targetEvent($event)
                    .ok('Si, eliminar')
                    .cancel('Salir');
          
                    $mdDialog.show(confirm).then(() => defer.resolve(), () => defer.reject());
                }else{
                    defer.resolve()
                }

                defer.promise.then(() => {

                    Item.$delete({id: id, estado: estado}).then((data) => {
                        if(!data.ok) return $mdToast.show(
                            $mdToast.simple()
                            .textContent('Error al realizar esta acción, por favor intente nuevamente.')
                            .hideDelay(2000));
                        $("#lista").DataTable().ajax.reload();
                    }).finally(() => {
                        parent.items[id].loading = false;
                    });

                }).catch(() => {
                    parent.items[id].loading = false;
                });               

            };
  
            return {
                agregar: function(ev, id, draw_new_item, callbacks){
                    if(id){
                        if(parent.items[id].loading) return;
                        parent.items[id].loading = true;
                    }
                    
                    $mdDialog.show({
                        controller: controllerName ? controllerName : ["$scope", "$mdToast", "WAI", "Item", function ($scope, $mdToast, WAI, Item) {

                            let item = Item ? Item.toJSON() : {};
                            
                            $scope.ctrl = parent;
                            $scope.crud = parent.crud;
                            $scope.nuevo = !Item;
                            $scope.WAI = WAI;
                            
                            $scope.registro_info = Object.assign({}, item);

                            $scope.loading = false;

                            $scope.BuscarTemp = {};
                            $scope.BuscarTextos = {};

                            $scope.AutocompleteReplacement = {};

                            if(typeof executeModal === "function") executeModal.call(this, $scope);


              
                            $scope.$watchCollection("BuscarTemp",function(items){
                                
                                if(!items) return;
                                angular.forEach(items,function(value, key){
                                    if(value) $scope.registro_info[key] = value[key];
                                })
                            });
                            
                            $scope.BuscarFn = {};

                            //for(parant)
                            
                            $scope.autocompleteList = obj.autocompleteList;
                            /*a().then(function(result){
                        console.log("aregs", result);
                            });*/
                        

                            $scope.hide = function () {
                                $mdDialog.hide();
                            };

                            $scope.cancel = function () {
                                $mdDialog.cancel();
                            };

                            $scope.enviar = function () {

                                if($scope.formulario.$invalid) return $mdToast.show(
                                    $mdToast.simple()
                                    .textContent('Por favor, revisar los campos requeridos')
                                    .hideDelay(2000));
                                
                                //Especifica si se va devolver los nuevos datos del servidor
                                $scope.registro_info.draw_new_item = draw_new_item ? 1 : 0;

                                var Item = new CRUDObj($scope.registro_info);

                                $scope.loading = true;
                                
                                Item.$save().then(function(data, foo) {
                                    
                                    $("#lista").DataTable().ajax.reload();
                                    $mdToast.show(
                                        $mdToast.simple()
                                        .textContent('Se ha guardado correctamente el registro')
                                        //.position("pinTo")
                                        .hideDelay(2000));
                                        
                                    $mdDialog.hide({
                                        item: draw_new_item ? data.item : null
                                    });
                                }).catch(function(){
                                    $mdToast.show(
                                        $mdToast.simple()
                                        .textContent('Error al guardar registro, intente nuevamente')
                                        //.position("pinTo")
                                        .hideDelay(3000));
                                }).finally(function(){
                                    $scope.loading = false;
                                });

                            };
                        }],
                        templateUrl: "./assets/views/pages/" + module_name + '/control.html',
                        //parent: angular.element(document.body),
                        multiple: true,
                        targetEvent: ev,
                        clickOutsideToClose: false,
                        escapeToClose: true,
                        fullscreen: true,
                        resolve: {
                            "Item": ["$http", function($http){
                                if(!id) return;
                                return (new CRUDObj()).$one({id: id});
                            }]
                        }
                    }).then(function (result) {
                        if(id) parent.items[id].loading = false;
                        if(callbacks){
                            (callbacks.onSave || angular.noop)(result);
                        }
                    }, function () {
                        if(id) parent.items[id].loading = false;
                    });
                }
            }
        }
    }

    return obj;
}])