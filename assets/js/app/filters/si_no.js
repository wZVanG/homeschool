app.filter("si_no", [function(){
    return function(value){
        return value == 1 ? "SI" : "NO"
    }
}]);