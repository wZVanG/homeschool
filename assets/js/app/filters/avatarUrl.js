app.filter("avatarUrl", [function(){
    return function(usuario){
        return usuario && usuario.foto ? `./uploads/avatars/${usuario.foto}`  : './assets/images/no_avatar.png';
    }
}]);