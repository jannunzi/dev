wam.applications = {
    init: function() {
        this.dom.init();
        this.controllers.init();
    },
    constants: {
        title: "Applications"
    },
    show: function () {
        wam.services.applications.getApplicationsForUsername(
            wam.state.currentUser.username,
            wam.applications.render);
    },
    render: function (applications) {
        wam.applications.dom.list.empty();
        for (var a in applications) {
            var applicationTO = applications[a];
            var item = wam.applications.dom.itemTpl.clone();
            item.attr("id", applicationTO.id);
            item.find(".name").html(applicationTO.name);
            wam.applications.dom.list.append(item);
        }
        wam.showPage("applications");
    },
    dom: {
        pagesBtn: null,
        dataBtn: null,
        scriptsBtn: null,
        list: null,
        itemTpl: null,
        item: null,
        init: function () {
            wam.applications.dom.pagesBtn   = $(".applications.page .pages.btn");
            wam.applications.dom.dataBtn    = $(".applications.page .data.btn");
            wam.applications.dom.scriptsBtn = $(".applications.page .scripts.btn");
            wam.applications.dom.item       = $(".applications.page .list .item");
            wam.applications.dom.itemTpl    = $(".applications.page .list .item:first").clone();
            wam.applications.dom.list       = $(".applications.page .list");
        }
    },
    controllers: {
        init: function () {
            wam.applications.dom.pagesBtn.click(wam.applications.controllers.pagesClick);
            wam.applications.dom.dataBtn.click(wam.applications.controllers.dataClick);
            $("body").on("click", ".applications.page .list .item", wam.applications.controllers.applicationItemClick);
            wam.applications.dom.scriptsBtn.click(wam.applications.controllers.scriptsClick);
        },
        applicationItemClick: function (event) {
            var target = event.currentUser;
            var id = $(this).attr("id");
            wam.applicationDetails.show(id);
        },
    }
}