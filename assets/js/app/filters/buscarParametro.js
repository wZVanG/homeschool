app.filter("buscaParametro", [function(){
    return function(value, tipo, key){
        let items, param;
        console.log(value, tipo,key);
        if(!(items = WAI_config.parametros[tipo])) return;
        param = items.find(({codigo}) => codigo == value);
        if(!param) return;
        return key ? param[key] : param;
    }
}]);