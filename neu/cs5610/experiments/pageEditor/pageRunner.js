/* Copyright (C) 2013 Jose G. Annunziato - All Rights Reserved */
	$(function(){
		load(getParameter("page"));
	});
	
	function load(pageName) {
		if(typeof pageName != "string" || pageName == "" || pageName == null)
			return;
		var pageEditor = localStorage.getItem("pageEditor");
		if(typeof pageEditor != "string" || pageEditor == "" || pageEditor == null)
			return;
		pageEditor = JSON.parse(pageEditor);
		var html = $(pageEditor[pageName].html);
		if(pageEditor != null) {
			$(".body")
				.empty()
				.html(html);
		}
		$(".body").find(".content, .icontent").removeAttr("contenteditable");
		$(".body").find(".gotoPageOnClick").click(controller)
	}
	function controller() {
		var element = $(this);
		if(element.hasClass("gotoPageOnClick")) {
			var gotoPage = element.attr("gotoPageOnClick");
			console.log(gotoPage);
			load(gotoPage);
		}
	}
	function getParameter(name) {
		if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
			return decodeURIComponent(name[1]);
	}
