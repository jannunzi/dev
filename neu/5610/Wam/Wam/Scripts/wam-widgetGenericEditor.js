wam.widgetGenericEditor = {
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
        init: function() {
            this.ok      = $(".widgetGenericEditor.page .ok.btn");
            this.cancel  = $(".widgetGenericEditor.page .cancel.btn");

            this.name    = $(".widgetGenericEditor.page .name");
            this.id      = $(".widgetGenericEditor.page .id");
            this.id.val(this.state.widgetId);
            this.label   = $(".widgetGenericEditor.page .label");
            this.width   = $(".widgetGenericEditor.page .width");
            this.height  = $(".widgetGenericEditor.page .height");
            this.clazz   = $(".widgetGenericEditor.page .clazz");
            this.style   = $(".widgetGenericEditor.page .style");
            this.content = $(".widgetGenericEditor.page .content");
        }
    },
    controllers: {
        ok: function(){
            widgetTO = {
                name: wam.widgetGenericEditor.dom.name.val(),
                id: wam.widgetGenericEditor.dom.id.val(),
                label: wam.widgetGenericEditor.dom.label.val(),
                width: wam.widgetGenericEditor.dom.width.val(),
                height: wam.widgetGenericEditor.dom.height.val(),
                class: wam.widgetGenericEditor.dom.clazz.val(),
                style: wam.widgetGenericEditor.dom.style.val(),
                content: wam.widgetGenericEditor.dom.content.val()
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
        cancel: function(){
            wam.widgets.show();
        },
        init: function () {
            wam.widgetGenericEditor.dom.ok.click(this.ok);
            wam.widgetGenericEditor.dom.cancel.click(this.cancel);
        }
    },
    constants: {
        title: "Editor"
    },
    show: function (widgetId) {
        this.state.widgetId = widgetId;
        wam.showPage("widgetGenericEditor");
    }
}