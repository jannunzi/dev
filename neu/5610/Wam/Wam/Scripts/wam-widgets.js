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

        window.location.hash = "pageId=" + pageId;

        if (typeof pageId != "undefined")
            this.state.pageId = pageId;
        else
            pageId = this.state.pageId;
        wam.services.widgets.getWidgetsForPageId(
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
            axis: 'y',
            stop: wam.widgets.controllers.sort
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
            wam.widgets.dom.addBtn.click(wam.widgets.controllers.add);
            wam.widgets.dom.editBtn.click(wam.widgets.controllers.edit);
            $("body").on("click", ".widgets.page .list .item", wam.widgets.controllers.select);
            $("body").on("click", ".widgets.page .list .item .delete", wam.widgets.controllers.delete);
        },
        sort: function (event, ui) {
            var li = ui.item;
            var id = li.attr("id");
            var ul = li.parent();
            var lis = ul.children();
            var index = lis.index(li);
            wam.services.widgets.sort(id, index);
        },
        delete: function (event) {
            event.stopPropagation();
            var id = $(this).parent().attr("id");
            console.log(id);
            $(this).parent().remove();
            wam.services.widgets.delete(id);
        },
        add: function () {
            wam.widgetSelector.show(wam.widgets.state.pageId);
        },
        edit: function () {
            $(".widgets.page .list .item .widget").css("width", "95%");
            $(".widgets.page .list .item .delete").show();
        },
        select: function () {
            var widget = $(this);
            var id = widget.attr("id");
            var dataRole = widget.attr("data-role");
            wam.widgets[dataRole].show(id);
//            wam.widgetEditor.show(id);
        },
    },
    services: {

    }
}