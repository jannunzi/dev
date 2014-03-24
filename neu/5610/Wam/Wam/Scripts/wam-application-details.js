wam.applicationDetails = {
    constants : {
        title : "App Details"
    },
    init: function () {
        this.dom.init();
        this.controllers.init();
    },
    show: function (applicationId) {
        wam.state.currentApplicationId = applicationId;
        wam.showPage("applicationDetails");
    },
    render: function() {
    },
    dom: {
        pagesBtn: null,
        dataBtn: null,
        scriptsBtn: null,
        init: function () {
            wam.applicationDetails.dom.pagesBtn    = $(".applicationDetails.page .pages.btn");
            wam.applicationDetails.dom.dataBtn = $(".applicationDetails.page .data.btn");
            wam.applicationDetails.dom.scriptsBtn = $(".applicationDetails.page .scripts.btn");
        }
    },
    controllers: {
        init: function () {
            wam.applicationDetails.dom.pagesBtn.click(wam.applicationDetails.controllers.pagesClick);
            wam.applicationDetails.dom.dataBtn.click(wam.applicationDetails.controllers.dataClick);
            wam.applicationDetails.dom.scriptsBtn.click(wam.applicationDetails.controllers.scriptsClick);
        },
        pagesClick: function () {
            wam.pages.show();
        },
        dataClick: function () {
            alert("Data");
        },
        scriptsClick: function () {
            alert("Scripts");
        }
},
    services: {
    }
}