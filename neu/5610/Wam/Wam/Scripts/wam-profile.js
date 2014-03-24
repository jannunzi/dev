wam.profile = {
    constants : {
        title : "Profile"
    },
    show: function() {
        wam.showPage("profile");
    },
    init: function () {
        this.dom.init();
        this.controllers.init();
    },
    render: function() {
    },
    dom: {
        applicationsBtn: null,
        init: function () {
            wam.profile.dom.applicationsBtn = $(".profile.page .applications.btn");
        }
    },
    controllers: {
        init: function () {
            wam.profile.dom.applicationsBtn.click(wam.profile.controllers.applications);
        },
        applications: function () {
            wam.applications.show();
        }
    },
    services: {
    }
}