wam.pages = {
    init: function() {
        this.dom.init();
        this.controllers.init();
    },
    constants: {
        title: "Pages"
    },
    show: function () {
        wam.services.pages.getPagesForApplicationId(
            wam.state.currentApplicationId,
            wam.pages.render);
    },
    render: function (pages) {
        wam.pages.dom.list.empty();
        for (var p in pages) {
            var pagesTO = pages[p];
            var item = wam.pages.dom.itemTpl.clone();
            item.attr("id", pagesTO.id);
            item.find(".name").html(pagesTO.name);
            wam.pages.dom.list.append(item);
        }
        wam.showPage("pages");
    },
    dom: {
        addBtn: null,
        list: null,
        itemTpl: null,
        item: null,
        init: function () {
            wam.pages.dom.addBtn     = $(".pages.page .add.btn")
            wam.pages.dom.item       = $(".pages.page .list .item");
            wam.pages.dom.itemTpl    = $(".pages.page .list .item:first").clone();
            wam.pages.dom.list       = $(".pages.page .list");
        }
    },
    controllers: {
        init: function () {
            wam.pages.dom.addBtn.click(wam.pages.controllers.addClick);
            $("body").on("click", ".pages.page .list .item", wam.pages.controllers.pageItemClick);
        },
        addClick: function() {

        },
        pageItemClick: function (event) {
            var id = $(this).attr("id");
            wam.pageDetails.show(id);
        },
    }
}