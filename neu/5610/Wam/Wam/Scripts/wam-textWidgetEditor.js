wam.widgets.text = {
    init: function () {
        this.dom.init();
        this.controllers.init();
    },
    dom: {
        ok: null,
        cancel: null,
        name: null,
        init: function() {
            this.name = $(".widgets.text.page .name");
            this.ok = $(".widgets.text.page .ok.btn");
            this.cancel = $(".widgets.text.page .cancel.btn");
        }
    },
    controllers: {
        ok: function () {
            wam.widgets.text.state.widget.name = wam.widgets.text.dom.name.val();
            wam.services.widgets.put(wam.widgets.text.state.widget, function (response) {
                console.log(response);
            })
        },
        cancel: function() {
            wam.widgets.show();
        },
        init: function () {
            wam.widgets.text.dom.ok.click(this.ok);
            wam.widgets.text.dom.cancel.click(this.cancel);
        }
    },
    show: function (id) {
        wam.services.widgets.get(id, this.render);
    },
    render: function (widget) {
        wam.widgets.text.state.widget = widget;
        console.log(widget);
        wam.widgets.text.dom.name.val(widget.name);
        wam.showPage("widgets.text", wam.widgets.text.constants.title);
    },
    constants: {
        title: "Text Widget"
    },
    state: {
        widget: null
    }
}