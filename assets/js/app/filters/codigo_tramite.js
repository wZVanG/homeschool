app.filter("codigo_tramite", [function(){
    return function(value, tipo_tramite){
        return (tipo_tramite == 1 ? 'INT' : 'EXT') + value;
    }
}]);