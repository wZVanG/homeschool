
app.filter("parametroCollection", [function(){

    function parametro(value, type, primary, column){
        var param_obj = ((WAI.parametros[type] || []).find(item => item[primary || 'id'] == value) || {});
        
        if(column === "$obj") return param_obj;
        return param_obj[column !== undefined ? column : 'descripcion'];
    }
    
    //parametro.$stateful = true

    return parametro;

}]);

