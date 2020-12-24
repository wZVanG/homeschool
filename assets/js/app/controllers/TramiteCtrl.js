angular.module('app').controller("TramiteCtrl", ["$scope", "API", "WAIUtils", "$state", "MisCargos", function($scope, API, WAIUtils, $state, MisCargos){

    $scope.mis_cargos = MisCargos;
    

}])