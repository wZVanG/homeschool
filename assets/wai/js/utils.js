window.UTILS = {
	arrayToObject: function(arr, keys){

		var obj = {}, keys_arr = Array.isArray(keys) ? keys : (keys || "").split(/[, ]+/), i = 0;
		
		while(i < arr.length) obj[keys_arr[i] || i] = arr[i++];

		return obj;
	},
	itemsArrayToObject: function(items, keys){
		if(!Array.isArray(items)) return;
		var el = this;
		return items.map(function(item){
			return el.arrayToObject(item, keys);
		});
	},
	
	itemCollectionToObject: function(item, collection){

		var sorted_fields = WAI.keycodes[collection.toLowerCase()];
		//sorted_fields.sort();


		return this.arrayToObject(item, sorted_fields);
	},
	
	itemsCollectionToObject: function(items, collection){

		var sorted_fields = WAI.keycodes[collection.toLowerCase()];
		//sorted_fields.sort();

		return this.itemsArrayToObject(items, sorted_fields);
	},
	random: function(min, max) {
		min = Math.ceil(min);
		max = Math.floor(max);
		return Math.floor(Math.random() * (max - min + 1)) + min;
	}
}