wam.widgetSelector = {
    init: function () {
        this.dom.init();
        this.controllers.init();
    },
    constants : {
        title : "Select Widget"
    },
    state : {
        pageId : null
    },
    show: function (pageId) {
        this.state.pageId = pageId;
        wam.showPage("widgetSelector");
    },
    dom: {
        cancelBtn: null,
        allItems : null,
        init: function () {
            this.cancelBtn = $(".widgetSelector.page .cancel.btn");
            this.allItems = $(".widgetSelector.page .item");
        }
    },
    controllers: {
        init: function () {
            wam.widgetSelector.dom.cancelBtn.click(this.cancel);
            wam.widgetSelector.dom.allItems.click(this.select);
        },
        select: function () {
            wam.widgetSelector.dom.allItems.blur();
            var item = $(this);
            var type = item.attr("data-role");
            var widgetCount = $(".widgets.page .list .item").length;
            wam.widgetSelector.services.postWidgetForPage(wam.widgetSelector.state.pageId, type, widgetCount, function (response) {
                wam.widgets.show();
            });
        },
        cancel: function () {
            wam.widgets.show();
        }
    },
    services: {
        // this actually adds a new widget to the page
        postWidgetForPage: function(pageId, widgetType, order, callback)
        {
            var data = {
                pageId: pageId,
                widgetType: widgetType,
                order: order
            }
            $.ajax({
                url: "../api/widgets",
                type: "get",
                data: data,
                dataType: "json",
                success: callback
            })
        }
    }
};