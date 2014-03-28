f360.search = {
    init:function(){
        this.dom.init();
        this.controllers.init();
    },
    renderers: {
        searchResults: function (fishTOs) {
            f360.fish.render.list(fishTOs);
            showFishList();
        }
    },
    dom: {
        searchBtn: null,
        searchActionBtn: null,
        cancelBtn: null,

        fishName: null,
        caughtDate: null,
        weight: null,
        length: null,
        species: null,
        init: function () {
            this.searchBtn = $(".f360-search");
            this.searchActionBtn = $(".f360-search-action");
            this.cancelBtn = $(".f360-search-cancel");
            
            this.fishName = $("#f360-fish-name-search");
            this.caughtDate = $("#f360-fish-date-search");
            this.weight = $("#f360-fish-weight-search");
            this.length = $("#f360-fish-length-search");
            this.species = $("#f360-fish-species-search");
        }
    },
    services: {
        init: function () { },
        postSearch: function (searchTO, callback) {
            console.log(searchTO);
            $.ajax({
                url: "../api/search",
                type: "post",
                dataType: "json",
                data: searchTO,
                success: callback
            })
        }
    },
    controllers: {
        init: function () {
            f360.search.dom.searchBtn.click(this.searchBtnClk);
            f360.search.dom.searchActionBtn.click(this.searchActionBtnClk);
            f360.search.dom.cancelBtn.click(this.cancelBtnClk);
        },
        searchActionBtnClk: function (event) {
            var searchTO = {
                name: f360.search.dom.fishName.val(),
                caughtDate: f360.search.dom.caughtDate.val(),
                weight: f360.search.dom.weight.val(),
                length: f360.search.dom.length.val(),
                species: f360.search.dom.species.val(),
            };
            f360.search.services.postSearch(searchTO, f360.search.renderers.searchResults);
        },
        cancelBtnClk: function (event) {
            f360.showPage("f360-login");
        },
        searchBtnClk: function (event) {
            f360.showPage("f360-search-form");
            f360.state.currentView = "searchForm";
        }
    }
};