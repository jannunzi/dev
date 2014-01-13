/* Copyright (C) 2013 Jose G. Annunziato - All Rights Reserved */
	var editingPage = false;
	var selectedElement = null;
	$(function(){
		
		load(getParameter("page"));
		
		$(".tool").click(controller);
		var pageEditor = JSON.parse(localStorage.getItem("pageEditor"));
		updatePageList(pageEditor);
		$(".attributes-dialog").dialog({
			"autoOpen":false,
			"open" : function() {
				$(".ui-dialog").css("z-index", 100000);
			}
		});
		$(".attributes-dialog .ok").click(setElementsAttributes);
		$(".attributes-dialog .cancel").click(function(){$(".attributes-dialog").dialog("close")});

		$(".body").on("click", ".content, .icontent", function(event) {
			event.stopPropagation();
			selectElement($(this));
		});
		$(".body").click(unselectEverything)
	});
	var HTML = {
		"p" : "<p contenteditable=\"true\" class=\"content\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>",
		"h1" : "<h1 contenteditable=\"true\" class=\"content\">Header</h1>",
		"h2" : "<h2 contenteditable=\"true\" class=\"content\">Header</h2>",
		"ul" : "<ul contenteditable=\"true\" class=\"content\"><li>List Item 1</li><li>List Item 2</li><li>List Item 3</li></ul>",
		"ol" : "<ol contenteditable=\"true\" class=\"content\"><li>List Item 1</li><li>List Item 2</li><li>List Item 3</li></ol>",
		"div" : "<div contenteditable=\"true\" class=\"content\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>",
		"img" : "<img class=\"icontent\" width=10% src=\"img/falcon.jpg\"/>",
//		"img" : "<div class=\"content\"><img width=100% height=100% src=\"img/falcon.jpg\"/></div>",
		"form" : "<form class=\"content\">Form</form>",
		"inputText" : "<input type=\"text\" class=\"icontent\" value=\"Value\" style=\"width:200px;height:15px\"/>",
//		"inputText" : "<div class=\"content\"><input type=\"text\" value=\"Value\" style=\"width:90%;\"/></div>",
		"button" : "<button class=\"icontent\">Button</button>",
		"radio" : "<input class=\"icontent\" type=\"radio\"/>",
		"check" : "<input class=\"icontent\" type=\"checkbox\"/>"
//		"button" : "<div class=\"content\"><button  style=\"width:90%;height:90%;\">Button</button></div>"
	};
	function controller(event) {
		var link = $(event.currentTarget);
		var name = link.attr("name");
		
		if(name == "edit") {
			if(editingPage == true) {
				editingPage = false;
				$(".editTool").html("edit on");
				$(".content, .icontent")
					.draggable({"grid" : [5,5], "snapTolerance": 10, "cancel": null, "snap" : true})
					.hover(bringToFront);//, "drag" : dragElement})
				$(".content").resizable({"grid" : [5,5]});
			} else {
				editingPage = true;
				$(".editTool").html("edit off");
				$(".content, .icontent")
					.draggable("destroy");
				$(".content").resizable("destroy")
			}
			return;
		} else if(name == "attributes-dialog") {
			showAttributesDialog(selectedElement);
			return;
		} else if(name == "delete") {
			if(selectedElement != null && typeof selectedElement != "undefined")
				selectedElement.remove();
			return;
		} else if(name == "copy") {
			if(selectedElement != null && typeof selectedElement != "undefined") {
				var copy = selectedElement.clone();
				makeDraggableResizableHoverAndPosition(copy);
				var pos  = selectedElement.position();
				copy.css({"top":pos.top + 10, "left":pos.left + 10});
				$(".body").append(copy);
				selectElement(copy);
			}
			return;
		} else if(name == "save") {
			var pageName = $(".pageName").val();
			if(pageName == null || pageName == "" || typeof pageName == "undefined")
				pageName = $(".pageListTool").val();
			if(pageName == null || pageName == "" || typeof pageName == "undefined")
				return;

			// remove draggable and resizable bindings			
			try { $(".content").resizable("destroy"); } catch(e) {}
			try { $(".content, .icontent").draggable("destroy"); } catch(e) {}
			
			// get the html
			var content = $(".body").html();
			
			// put the draggable and resizable bindings back again
			$(".content, .icontent")
				.draggable({"grid" : [5,5], "cancel": null, "snap" : true, "snapTolerance": 10})
				.hover(bringToFront);//, "drag" : dragElement})
			$(".content").resizable({"grid" : [5,5]});
			
			var pageEditor = localStorage.getItem("pageEditor");
			pageEditor = JSON.parse(pageEditor);
			if(pageEditor == null)
				pageEditor = {};

			var gotoPageOnClick = {};
/*			$(".gotoPageOnClick").each(function(){
				var element = $(this);
				var gotoPage = element.attr("gotoPageOnClick");
				console.log(gotoPage);
			});
*/
			var page = {
				"html" : content,
				"gotoPageOnClick" : gotoPageOnClick
			};
				
			pageEditor.currentPage = pageName;
//			pageEditor[pageName] = content;
			pageEditor[pageName] = page;
			updatePageList(pageEditor);
			pageEditor = JSON.stringify(pageEditor);
			localStorage.setItem("pageEditor", pageEditor);
		} else if(name == "load") {
			var pageName = $(".pageListTool").val();
			if(pageName == null || pageName == "" || typeof pageName == "undefined")
				pageName = $(".pageName").val();
			if(pageName == null || pageName == "" || typeof pageName == "undefined")
				return;
			load(pageName);
		} else if(name == "clear") {
			localStorage.removeItem("pageEditor");
			$(".body").empty();
		} else {
			var element = $(HTML[name]);
			makeDraggableResizableHoverAndPosition(element);
			$(".body").append(element);
		}
	}
	
	function load(pageName) {
		if(typeof pageName != "string" || pageName == "" || pageName == null)
			return;
		var pageEditor = localStorage.getItem("pageEditor");
		if(typeof pageEditor != "string" || pageEditor == "" || pageEditor == null)
			return;
		pageEditor = JSON.parse(pageEditor);
		if(pageEditor != null && pageEditor[pageName] != null) {
			$(".body")
				.empty()
				.html(pageEditor[pageName].html);
			$(".content, .icontent")
				.draggable({"grid" : [5,5], "cancel": null, "snap" : true, "snapTolerance": 10})
				.hover(bringToFront);//, "drag" : dragElement})
			$(".content")
				.resizable({"grid" : [5,5]});
		}
	}
	
	function makeDraggableResizableHoverAndPosition(element) {
		if(element.hasClass("content")) {
			element
				.draggable({"grid" : [5,5], "snapTolerance": 10, "snap" : true})//, "cancel": null})//, "drag" : dragElement})
				.resizable({"grid" : [5,5]})
				.css({"position" : "absolute", "top" : "100px", "left" : "100px", "width" : "300px", "height" : "200px"})
				.hover(bringToFront);
		} else {
			element
				.draggable({"grid" : [5,5], "snapTolerance": 10, "snap" : true, "cancel": null})//, "drag" : dragElement})
				.css({"position" : "absolute", "top" : "100px", "left" : "100px"})
				.hover(bringToFront);
		}		
	}
	
	function updatePageList(pageEditor) {
		var pageList = $(".pageListTool").empty();
		for(var pageName in pageEditor) {
			if(pageName == "currentPage")
				continue;
			var option = $("<option>").append(pageName);
			pageList.append(option);
		}
	}
	function showAttributesDialog(element) {
		$(".attributes-dialog")
			.dialog("open")
			.data("element", element);
		$(".attributes-dialog").find(".name").val(element.attr("name"));
		$(".attributes-dialog").find(".id").val(element.attr("id"));
		$(".attributes-dialog").find(".class").val(element.attr("class"));
		$(".attributes-dialog").find(".style").val(element.attr("style"));
		$(".attributes-dialog").find(".value").val(element.attr("value"));
		$(".attributes-dialog").find(".src").val(element.attr("src"));
		$(".attributes-dialog").find(".href").val(element.attr("href"));
		$(".attributes-dialog").find(".bodyField").val(element.html());
		$(".attributes-dialog").find(".gotoPageOnClick").val(element.attr("gotoPageOnClick"));
	}
	/*
	 * Grab the values in the attributes dialog
	 * and update the attributes of the element 
	 */
	function setElementsAttributes() {
		// grab the values from the dialog form elements/fields
		var name  = $(".attributes-dialog").find(".name").val();
		var id    = $(".attributes-dialog").find(".id").val();
		var clazz = $(".attributes-dialog").find(".class").val();
		var style = $(".attributes-dialog").find(".style").val();
		var value = $(".attributes-dialog").find(".value").val();
		var src   = $(".attributes-dialog").find(".src").val();
		var href  = $(".attributes-dialog").find(".href").val();
		var body  = $(".attributes-dialog").find(".bodyField").val();
		var gotoPageOnClick = $(".attributes-dialog").find(".gotoPageOnClick").val();
		
		// when the dialog showed, we stored the element in the data
		// set the element's attributes with the values we got from the fields
		var element = $(".attributes-dialog").data("element");
		element.attr("name", name);
		element.attr("id", id);
		element.attr("class", clazz);
		element.attr("style", style);
		element.attr("value", value);
		element.attr("src", src);
		element.attr("href", href);
		
		if(gotoPageOnClick != "" && gotoPageOnClick != null && typeof gotoPageOnClick != "undefined") {
			element.attr("gotoPageOnClick", gotoPageOnClick);
			element.addClass("gotoPageOnClick");
		}
		
		// if there's value for body, update the element's body
		if(body != "" && body != null && typeof body != "undefined" && element.hasClass("icontent"))
			element.html(body);
			
		$(".attributes-dialog").dialog("close");		
	}

	var zIndex = 100;
	function bringToFront(event) {
		$(this).css("z-index", zIndex++);
	}

	function selectElement(element) {
		unselectEverything();
		selectedElement = element;
		selectedElement.addClass("selected");
	}

	function unselectEverything() {
		selectedElement = null;
		$(".content, .icontent").removeClass("selected");
	}
	
	function getParameter(name) {
		if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
			return decodeURIComponent(name[1]);
	}
