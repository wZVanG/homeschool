app.directive('editable', ["API", function(API) {
    return {
        restrict: 'AE',
        link: function(scope, element){

            var el = $(element), data = el.data();

            el.editable({
                url: API.url("crud", "updateCell", data.module),
                ajaxOptions: { dataType: 'json'},
                container: 'body',
                success: function(response, newValue) {
                    return (!response || response.success === false) ? ( response || { msg: "Error desconocido!" }).msg : void(0);
                }
            });
        }
    }
}]);