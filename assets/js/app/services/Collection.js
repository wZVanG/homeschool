
window["app"].provider("Collection", [function(){

    var el = this;

    this.$get = function () {
                
        return {
        };
    };

    this.create = function(types){
        return ["API", "$q", "$http", "WAI", function(API, $q, $http, WAI){
            let defers = [];

            types.forEach((type) => {

                const url = API.url("crud", type);
                let defer = $q.defer();
            
                $http.get(url).success(data => defer.resolve([type, data])).catch(() => defer.resolve([type, null]));
                defers.push(defer.promise);

            });
            
            let defer = $q.defer();
            
            $q.all(defers).then(results => {
                
                let obj = results.reduce((obj, item) => {
                    obj[item[0]] = item[1];
                    WAI.parametros[item[0]] = item[1];
                    return obj;
                }, {});
                defer.resolve(obj);
            })

            return defer.promise;
        }]
    }
    
}]);