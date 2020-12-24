app.filter("moneda", ["$filter", function($filter) {
	return function() {
		var t = Array.prototype.slice.call(arguments);
		return t[1] = "S/ ", $filter("currency").apply(null, t)
	}
}])