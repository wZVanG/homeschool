app.filter("tipo_movimiento", [function(){
    return function(value){
        return ({
            1: 'Enviado',
            2: 'Derivado',
            3: 'Archivado',
        })[value]
    }
}]);