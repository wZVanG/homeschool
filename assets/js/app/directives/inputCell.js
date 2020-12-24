app.directive('inputCell', [function() {
    return {
        restrict: 'A',
        link: function(scope, element){

            var el = $(element), input = el.find("input"), tr = el.closest("tr");

            el.addClass("input-cell");

            input.bind("click", () => input.select());
            input.bind("focus", () => el.addClass("focus") && tr.addClass("focus"));
            input.bind("blur", () => el.removeClass("focus") && tr.removeClass("focus"));

        }
    }
}]);