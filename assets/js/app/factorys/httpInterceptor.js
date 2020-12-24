app.factory('httpInterceptor', ["$q", "$location", "$localStorage", function ($q, $location, $localStorage) {
    return {
        request: function (config) {
            //Prevenir Cache de templates
            if (config.url.includes('assets/views')){
                if(location.hostname === "localhost"){
                    //config.url = `${config.url}?v=` + WAI_config.assets_version;
                    Object.assign(config.headers, { "Cache-Control": "no-cache, must-revalidate" });
                }else{
                    config.url = `${config.url}?v=` + WAI_config.assets_version;
                }
            }
                
            //console.log("config", config);

            return config;
        }
    };
}]);