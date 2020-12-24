app.filter("tipo_origen", [function(){
    return function(value){
        return ({
            1: 'Interno',
            2: 'Externo'
        })[value]
    }
}]);