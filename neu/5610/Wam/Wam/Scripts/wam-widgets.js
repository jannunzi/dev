wam.widgets = {
    init: function() {
        this.dom.init();
        this.controllers.init();
    },
    constants: {
        title: "Widgets"
    },
    show: function (pageId) {
        wam.widgets.services.getWidgetsForPageId(
            pageId,
            wam.widgets.render);
    },
    render: function (widgets) {
        wam.widgets.dom.list.empty();
        for (var p in widgets) {
            var widgetsTO = widgets[p];
            var type = widgetsTO.widgetType;
            var item = wam.widgets.dom.widgetTemplates[type].clone();
            item.attr("id", widgetsTO.id);
            item.find(".name").html(widgetsTO.name);
//          item.find(".form-control").attr("readonly", "readonly");
            wam.widgets.dom.list.append(item);
        }
        $(".widgets.page .list").sortable({
            axis : 'y'
        });
        wam.showPage("widgets");
    },
    dom: {
        addBtn: null,
        list: null,
        itemTpl: null,
        item: null,
        widgetTemplates: {
            TEXT: null,
            SELECT: null,
            TEXTAREA: null
        },
        init: function () {
            wam.widgets.dom.addBtn     = $(".widgets.page .add.btn")
            wam.widgets.dom.item       = $(".widgets.page .list .item");
            wam.widgets.dom.itemTpl    = $(".widgets.page .list .item:first").clone();
            wam.widgets.dom.list = $(".widgets.page .list");

            wam.widgets.dom.widgetTemplates.LABEL =
                $(".widgets.page .list .LABEL").clone();
            wam.widgets.dom.widgetTemplates.TEXT =
                $(".widgets.page .list .TEXT").clone();
            wam.widgets.dom.widgetTemplates.BUTTON =
                $(".widgets.page .list .BUTTON").clone();
            wam.widgets.dom.widgetTemplates.TEXTAREA =
                $(".widgets.page .list .TEXTAREA").clone();
            wam.widgets.dom.widgetTemplates.SELECT =
                $(".widgets.page .list .SELECT").clone();
        }
    },
    controllers: {
        init: function () {
            wam.widgets.dom.addBtn.click(wam.widgets.controllers.addClick);
            $("body").on("click", ".widgets.page .list .item", wam.widgets.controllers.widgetItemClick);
        },
        addClick: function() {

        },
        widgetItemClick: function () {
            var id = $(this).attr("id");
//            wam.pageDetails.show(id);
        },
    },
    services: {
        getWidgetsForPageId: function (pageId, callback) {
            $.ajax({
                url: "/api/widgets",
                dataType: "json",
                data: { pageId: pageId },
                success: callback
            });
        }
    }
}