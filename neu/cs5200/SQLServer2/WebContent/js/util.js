var util = {
	init: function() {
		alert("util init");
		this.toggable.init();
	},
	dom: {
	},
	toggable: {
		init: function() {
			$(".toggle").on("click", this.toggle);
			alert("toggable init");
		},
		toggle: function(event) {
			$($(event.currentTarget).parents(".toggable")[0]).toggle();
		}
	}
};