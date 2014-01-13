var GET_ALL_FISHING_TRIPS_FOR_USER = '{"trips":[{"name":"jsilva","title":"Fishing Trip 1234","nid":"25"},{"name":"jsilva","title":"New Fishing Trip","nid":"456"},{"name":"jsilva","title":"Test New FCK Editor","nid":"59"}]}';
var GET_FISHING_TRIP_FOR_NODE_ID   = '{"trip":{"nid":"25","vid":"25","type":"fishing_trip_type","language":"en","title":"Title of the Trip","uid":"1","status":"1","created":"1239501752","changed":"1239501752","comment":"0","promote":"0","moderate":"0","sticky":"0","tnid":"0","translate":"0","body":""}}';
var GET_ALL_FISH_FOR_USER_AND_FISHING_TRIP = '{"fish":[{"name":"jsilva","title":"Fish 403","nid":"403"},{"name":"jsilva","title":"Fish 406","nid":"406"}]}';
var FISH = {"name" : "Fish 1","nid":"123","weight":"234","length":"23","date-caught":new Date()};
//var TRIPS = JSON.parse(GET_ALL_FISHING_TRIPS_FOR_USER).trips;
var TRIP = JSON.parse(GET_FISHING_TRIP_FOR_NODE_ID).trip;
//var FISHES = JSON.parse(GET_ALL_FISH_FOR_USER_AND_FISHING_TRIP).fish;
var USER   = { "nid" : "123", "username" : "jsilva", "password" : "ewqdsa"};
var FISHES = [	{"nid" : "12", "title" : "Fish 12", "weight" : "21", "length" : "212"},
				{"nid" : "13", "title" : "Fish 13", "weight" : "22", "length" : "213"}];
var TRIPS  = [	{"nid" : "121", "title" : "Trip 121", "username" : "jsilva"},
				{"nid" : "131", "title" : "Trip 131", "username" : "jsilva"},
              {"nid" : "132", "title" : "Trip 121", "username" : "jannunzi"},
              {"nid" : "133", "title" : "Trip 121", "username" : "jannunzi"},
              {"nid" : "134", "title" : "Trip 121", "username" : "jannunzi"},
              {"nid" : "135", "title" : "Trip 121", "username" : "jannunzi"},
              {"nid" : "136", "title" : "Trip 121", "username" : "jannunzi"},
              {"nid" : "137", "title" : "Trip 121", "username" : "jannunzi"},
              {"nid" : "138", "title" : "Trip 121", "username" : "jannunzi"},
              {"nid" : "139", "title" : "Trip 121", "username" : "jannunzi"},
				{"nid" : "140", "title" : "Trip 131", "username" : "jannunzi"}
              ];
function controller0(event) {
	event.preventDefault();
	var element = $(this);
	var eventName = element.attr("name");
	$(".page").hide();
	var currentPage = navigation["current-page"];
	var before = navigation.events[currentPage][eventName].before;
	var to = navigation.events[currentPage][eventName].to;
	var after = navigation.events[currentPage][eventName].after;
	
	if(typeof before == "function") {
		before(function(go){
			if(go) {
				showPage(to);
				if(typeof after == "function")
					after();
			}
		})
	} else {
		showPage(to);
		if(typeof after == "function")
			after();
	}
}
			
/*			
			var navigation = {
				"start-page"   : "login-page",
				"current-page" : "login-page",
				"events" : {
					"login-page" : {
						"event" : {
							"before" : login,
							"to" : "trip-list-page"
						}
					}
				}
			}
*/						
