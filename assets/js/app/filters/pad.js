app.filter('pad', function () {
    return function(a,b){
        return(1e4+""+a).slice(-b);
    };
});