app.directive('movimientoPrioridad', ["$compile", function($compile) {
    return {
        restrict: 'A',
        scope: {
            movimientoPrioridad: '='
        },
        link: function(scope, element){

            var el = $(element), prioridad_obj = (WAI_config.parametros.PRIORI||[]).find(({codigo}) => codigo == scope.movimientoPrioridad);

            if(!prioridad_obj) return;

            el.addClass("movimiento-prioridad").css("background-color", "#" + prioridad_obj.codigo_hex).html(prioridad_obj.descripcion).attr("title", "Prioridad " + prioridad_obj.descripcion);

        }
    }
}]);