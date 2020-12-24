app.filter("tipo_documento", [function(){
    return function(value){
        return ({
            1: 'DNI',
            2: 'RUC',
            3: 'C.E',
            4: 'PASAPORTE'
        })[value]
    }
}]);