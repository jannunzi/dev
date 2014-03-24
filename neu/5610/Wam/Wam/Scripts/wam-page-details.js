wam.pageDetails = {
    constants : {
        title : "Page Details"
    },
    init: function () {
        this.dom.init();
        this.controllers.init();
    },
    show: function (pageId) {
        wam.state.currentPageId = pageId;
        wam.showPage("pageDetails");
    },
    render: function() {
    },
    dom: {
        widgetsBtn: null,
        init: function () {
            wam.pageDetails.dom.widgetsBtn    = $(".pageDetails.page .widgets.btn");
        }
    },
    controllers: {
        init: function () {
            wam.pageDetails.dom.widgetsBtn.click(wam.pageDetails.controllers.widgetsClick);
        },
        widgetsClick: function () {
            wam.widgets.show(wam.state.currentPageId);
        }
    },
    services: {
    }
}