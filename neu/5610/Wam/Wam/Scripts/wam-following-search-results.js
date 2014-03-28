wam.followingSearchResults = {
    init: function () {
        this.dom.init();
        this.controllers.init();
    },
    constants : {
        title: "Results",
    },
    renderers: {
        list: function (results) {
            console.log(results);
        }
    },
    show: function (searchTerm) {
        wam.showPage("followingSearchResults");
        wam.followingSearchResults.services.followingSearch(searchTerm, wam.followingSearchResults.renderers.list);
    },
    dom: {
        init: function () {

        }
    },
    controllers: {
        init : function(){
        }
    },
    services: {
        followingSearch: function (searchStr, callback) {
            console.log(searchStr);
            $.ajax({
                url: "../api/following",
                data: { search: searchStr },
                dataType: "json",
                success: callback
            });
        }
    }
}