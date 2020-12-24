app.filter("fecha", ["$filter", '$sce', function($filter, $sce){
    return function(value, noAgo){
        //$sce.trustAs(type || 'html', value);
        return $filter("amDateFormat")(value, 'L LT') + (noAgo !== false ? "<br />" + $filter("amTimeAgo")(value) : "");
    }
}]);