wam.widgetEditor = {
    init: function () {
        this.dom.init();
        this.controllers.init();
    },
    dom: {
        ok: null,
        cancel: null,
        name: null,
        id: null,
        label: null,
        width: null,
        height: null,
        clazz: null,
        style: null,
        content: null,
        init: function () {
            this.ok = $(".widgetEditor.page .ok.btn");
            this.cancel = $(".widgetEditor.page .cancel.btn");

            this.name = $(".widgetEditor.page .name");
            this.id = $(".widgetEditor.page .id");
            this.label = $(".widgetEditor.page .label");
            this.width = $(".widgetEditor.page .width");
            this.height = $(".widgetEditor.page .height");
            this.clazz = $(".widgetEditor.page .clazz");
            this.style = $(".widgetEditor.page .style");
            this.content = $(".widgetEditor.page .content");
            this.data = $(".widgetEditor.page .data");
        }
    },
    controllers: {
        ok: function () {
            widgetTO = {
                name: wam.widgetEditor.dom.name.val(),
                id: wam.widgetEditor.dom.id.val(),
                label: wam.widgetEditor.dom.label.val(),
                width: wam.widgetEditor.dom.width.val(),
                height: wam.widgetEditor.dom.height.val(),
                class: wam.widgetEditor.dom.clazz.val(),
                style: wam.widgetEditor.dom.style.val(),
                content: wam.widgetEditor.dom.content.val(),
                data: wam.widgetEditor.dom.data.val()
            };
            $.ajax({
                url: "/api/widgets",
                type: "put",
                dataType: "json",
                data: widgetTO,
                success: function (response) {
                    console.log(response);
                }
            });
        },
        cancel: function () {
            wam.widgets.show();
        },
        init: function () {
            wam.widgetEditor.dom.ok.click(this.ok);
            wam.widgetEditor.dom.cancel.click(this.cancel);
        }
    },
    constants: {
        title: "Editor"
    },
    render: function (widget) {
        this.dom.name.val(widget.name);
        this.dom.label.val(widget.label);
        this.dom.data.val(widget.data);
        this.dom.content.val(widget.content);
        this.dom.url.val(widget.url);
        this.dom.clazz.val(widget.cssClass);
        this.dom.style.val(widget.style);
        this.dom.height.val(widget.height);
        this.dom.height.val(widget.width);
        this.dom.id.val(widget.id);
        this.dom.order.val(widget.order);
    },
    show: function (widgetId) {
        this.dom.id.val(widgetId);
        wam.services.widgets.get(widgetId, function (widgetTO) {
            wam.widgetEditor.state.widget = widgetTO;
            wam.widgetEditor.render(widgetTO);
            wam.showPage("widgetEditor");
        });
    },
    state: {
        widgetId: null
    }
}