window["app"].service("WAI", ["Usuario", "$http", "API", "$state", function(Usuario, $http, API, $state){
    
    var el = this;
    this.parametros = window.WAI.parametros;
    this.config = window.WAI_config;
    this.usuario = Usuario;
    this.theme = {name: "default"};

    Usuario.login(this.config.usuario);
    Usuario.setCargos(WAI_config.usuario_cargos);

    this.logout_loading = false;
    this.logout = function(){
        if(el.logout_loading) return;
        el.logout_loading = true;
        $http.post(API.url("sesion", "logout")).success(function(data){
            el.logout_loading = false;
            if(data.logout){
                Usuario.logout();
                $state.go("sesion.login");
            }
        });
    }
}]);