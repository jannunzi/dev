wam.widgets = {
    init: function() {
        this.dom.init();
        this.controllers.init();
    },
    constants: {
        title: "Widgets"
    },
    state : {
        pageId : null
    },
    show: function (pageId) {
        if (typeof pageId != "undefined")
            this.state.pageId = pageId;
        else
            pageId = this.state.pageId;
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
            wam.widgets.dom.list.append(item);
        }
        $(".widgets.page .list").sortable({
            axis : 'y'
        });
        wam.showPage("widgets");
    },
    dom: {
        addBtn: null,
        editBtn: null,
        list: null,
        itemTpl: null,
        item: null,
        widgetTemplates: {
            TEXT: null,
            SELECT: null,
            TEXTAREA: null
        },
        init: function () {
            wam.widgets.dom.addBtn = $(".widgets.page .add.btn")
            wam.widgets.dom.editBtn = $(".widgets.page .edit.btn")
            wam.widgets.dom.item = $(".widgets.page .list .item");
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
            wam.widgets.dom.editBtn.click(wam.widgets.controllers.editClick);
            $("body").on("click", ".widgets.page .list .item", wam.widgets.controllers.widgetItemClick);
            $("body").on("click", ".widgets.page .list .item .delete", wam.widgets.controllers.delete);
        },
        delete: function (event) {
            event.stopPropagation();
            var id = $(this).parent().attr("id");
            console.log(id);
            $(this).parent().remove();
            wam.widgets.services.delete(id);
        },
        addClick: function () {
            wam.widgetSelector.show(wam.widgets.state.pageId);
        },
        editClick: function () {
            $(".widgets.page .list .item .widget").css("width", "95%");
            $(".widgets.page .list .item .delete").show();
        },
        widgetItemClick: function () {
            var id = $(this).attr("id");
            console.log(id);
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
        },
        delete: function (widgetId, callback) {
            $.ajax({
                url: "/api/widgets/"+widgetId,
                type: 'delete',
                dataType: "json",
                success: callback
            })
        }
    }
}