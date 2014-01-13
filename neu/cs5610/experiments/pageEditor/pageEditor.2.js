	var editingPage = false;
	var editingAttributes = false;
	var selectedElement = null;
	$(function(){
		$(".tool").click(controller);
		var pageEditor = JSON.parse(localStorage.getItem("pageEditor"));
		updatePageList(pageEditor);
		$(".attributes-dialog").dialog({"autoOpen":false});
		$(".attributes-dialog .ok").click(setElementsAttributes);
		$(".attributes-dialog .cancel").click(function(){$(".attributes-dialog").dialog("close")});

//		$(".body").on("click", ".content, .icontent", function() {
//			showAttributesDialog($(this));
//			selectedElement = $(this);
//			console.log(selectedElement);
//		});
	});
	var HTML = {
		"p" : "<p contenteditable=\"true\" class=\"content\">Paragraph</p>",
		"h1" : "<h1 contenteditable=\"true\" class=\"content\">Header</h1>",
		"h2" : "<h2 contenteditable=\"true\" class=\"content\">Header</h2>",
		"ul" : "<ul contenteditable=\"true\" class=\"content\"><li>Unordered List</li></ul>",
		"ol" : "<ol contenteditable=\"true\" class=\"content\"><li>Ordered List</li></ol>",
		"div" : "<div contenteditable=\"true\" class=\"content\">DIV</div>",
		"form" : "<form class=\"content\" style=\"border:1px gray solid\"></form>",
		"inputText" : "<input type=\"text\" class=\"icontent\" value=\"Value\" style=\"width:200px;height:15px\"/>",
		"button" : "<button class=\"icontent\">Button</button>"
	};
	function controller(event) {
		var link = $(event.currentTarget);
		var name = link.attr("name");
		
		if(name == "edit") {
			if(editingPage == true) {
				editingPage = false;
				$(".editTool").html("edit on");
				$(".content, .icontent").draggable({"grid" : [5,5]});//, "cancel": null});//, "drag" : dragElement})
				$(".content").resizable({"grid" : [5,5]});
			} else {
				editingPage = true;
				$(".editTool").html("edit off");
				$(".content, .icontent").draggable("destroy");
				$(".content").resizable("destroy")
			}
			return;
		} else if(name == "attributes-dialog") {
			if(editingAttributes == false) {
				editingAttributes = true;
				$(".attributesTool").html("attributes off");



			} else {
				editingAttributes = false;
				$(".attributesTool").html("attributes on");

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
			$(".content, .icontent").draggable({"grid" : [5,5], "cancel": null});//, "drag" : dragElement})
			$(".content").resizable({"grid" : [5,5]});
			
			var pageEditor = localStorage.getItem("pageEditor");
			pageEditor = JSON.parse(pageEditor);
			if(pageEditor == null)
				pageEditor = {};
			pageEditor.currentPage = pageName;
			pageEditor[pageName] = content;
			pageEditor = JSON.stringify(pageEditor);
			localStorage.setItem("pageEditor", pageEditor);
		} else if(name == "load") {
			var pageName = $(".pageListTool").val();
			if(pageName == null || pageName == "" || typeof pageName == "undefined")
				pageName = $(".pageName").val();
			if(pageName == null || pageName == "" || typeof pageName == "undefined")
				return;
			var pageEditor = localStorage.getItem("pageEditor");
			pageEditor = JSON.parse(pageEditor);
			if(pageEditor != null) {
				$(".body").empty();
				$(".body").html(pageEditor[pageName]);
				$(".content, .icontent")
					.draggable({"grid" : [5,5], "cancel": null});//, "drag" : dragElement})
				$(".content")
					.resizable({"grid" : [5,5]});
			}
		} else if(name == "clear") {
			localStorage.removeItem("pageEditor");
			$(".body").empty();
		}
		
		var html = $(HTML[name]);
		if(html.hasClass("content")) {
			html.draggable({"grid" : [5,5]});//, "cancel": null})//, "drag" : dragElement})
//			html.resizable({"grid" : [5,5]});
			html.css({"position" : "absolute", "top" : "100px", "left" : "100px"});
		} else {
			html
				.draggable({"grid" : [5,5], "cancel": null})//, "drag" : dragElement})
				.css({"position" : "absolute", "top" : "100px", "left" : "100px"});			
		}
		
		$(".body").append(html);
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
		if(!editingAttributes)
			return;
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
		$(".attributes-dialog").find(".body").val(element.html());
	}
	function setElementsAttributes() {
		var element = $(".attributes-dialog")
			.data("element");
		$(".attributes-dialog").dialog("close");
		var name = $(".attributes-dialog").find(".name").val();
		var id = $(".attributes-dialog").find(".id").val();
		var clazz = $(".attributes-dialog").find(".class").val();
		var style = $(".attributes-dialog").find(".style").val();
		var value = $(".attributes-dialog").find(".value").val();
		var src = $(".attributes-dialog").find(".src").val();
		var href = $(".attributes-dialog").find(".href").val();
		var body = $(".attributes-dialog").find(".body").val();
		element.attr("name", name);
		element.attr("id", id);
		element.attr("class", clazz);
		element.attr("style", style);
		element.attr("value", value);
		element.attr("src", src);
		element.attr("href", href);
		if(body != "" && body != null && typeof body != "undefined")
			element.html(body);
	}