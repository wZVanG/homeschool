app.directive('periodoMax', [function() {
    return {
        restrict: 'A',
        scope: {
            fecha: '@',
            periodoMax: '@',
        },
        link: function(scope, element){

            var el = $(element), fecha = moment(scope.fecha), periodo = +scope.periodoMax
            , dias_pasados = fecha.diff(moment(), 'days');

            if(dias_pasados < 0 && Math.abs(dias_pasados) > periodo){
                el.addClass("periodo-max");
            }else{
                el.removeClass("periodo-max");
            }

        }
    }
}]);