angular.module('app').controller("TrackingCtrl", ["$scope", "API", "WAIUtils", "$state", "$mdDialog", "WAI_CONSTANTS", "Usuarios", function($scope, API, WAIUtils, $state, $mdDialog, WAI_CONSTANTS, Usuarios){

    $scope.abrir_prestamo = function(ev, item, parent_credito, refinanciamiento){

        console.log("item abrir_prestamo", item);
    
        return $mdDialog.show({
            controller: 'PrestamosNuevoCtrl',
            templateUrl: "./assets/views/gestion/prestamo.html",
            multiple: true,
            targetEvent: ev,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: !parent_credito,
            resolve: {
                Usuarios: [function(){
                   return Usuarios
               }],
               Prestamo: [function(){
                   if(!item || !item.PP_IdTemp) return item;
                   let obj = angular.copy(item); 
                   obj.PP_NumeroMovimiento = obj.PP_IdTemp;
                   return obj;
               }],
               Prestamo_valores: ["$q", "$http", function($q, $http){
                   let objPrestamo = item ? item : refinanciamiento;
                    if(!objPrestamo || objPrestamo && objPrestamo.PP_TipoCredito != WAI_CONSTANTS.TIPO_PRESTAMO.PYME) return;
                    let defer = $q.defer();
                    $http.get(`${API.url("prestacash","prestamo_valores")}?PP_NumeroMovimiento=${objPrestamo[objPrestamo.PP_IdTemp ? "PP_IdTemp" : "PP_NumeroMovimiento"]}`).success(data => defer.resolve(data));
                    return defer.promise;
               }],
               Cliente: ["$q", "$http", function($q, $http){
                   
                    if(!(item || refinanciamiento)) return;

                    let defer = $q.defer();
                    $http.get(`${API.url("crud","cliente")}?id=${(item ? item : refinanciamiento).PP_IdCliente}`).success(data => defer.resolve(data));
                    return defer.promise;
               }],
               Refinanciamiento: ["$q", "$http", function($q, $http){
                    if(refinanciamiento) return refinanciamiento;
                    console.log("item refinancia", item)
                    if(!item || !item.PP_NumeroMovimientoRefinanciado) return;
                    //Buscar crÃ©dito a refinanciar
                    let defer = $q.defer();
                    $http.get(`${API.url("prestacash","prestamo_info")}?PP_NumeroMovimiento=${item.PP_NumeroMovimientoRefinanciado}`).success(data => defer.resolve(data));
                    return defer.promise;
               }]
            },
            locals: {
                abrir_prestamo: $scope.abrir_prestamo,
                ParentCredito: parent_credito
            }
        });
        
    };

}])