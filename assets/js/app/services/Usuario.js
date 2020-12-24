app.service("Usuario", ["$http", function($http){

    this.is_login = false;
    this.info = {};
    this.cargo_principal = null;
    this.login = function(data){
        this.is_login = !!data;
        this.info = this.is_login ? data : {};
    }
    this.logout = function(){
        this.is_login = false;
        this.info = {}
    }
    this.setCargos = function(cargos){
        this.cargos = cargos;
        this.cargo_principal = this.cargos && this.cargos.length ? this.cargos[0] : null;
    };
    this.tienePermisos = function(roles_arr){
        if(!this.is_login) return false;
        return roles_arr.indexOf(+this.info.rol || 0) !== -1;
    };

}])