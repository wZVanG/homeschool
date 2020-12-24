
app.filter("parametro", [function(){

    function parametro(value, type, column){
        var param_obj = ((WAI_config.parametros[type] || []).find(({codigo}) => codigo == value) || {});
        if(column === "$obj") return param_obj;
        return param_obj[column !== undefined ? column : 'descripcion'];
    }
    
    //parametro.$stateful = true

    return parametro;

}]);

