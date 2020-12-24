app.filter("fixNumber", ["$filter", function($filter) {
	return function(num) {
		return isNaN(num) || !isFinite(num) ? 0 : num;
	}
}])