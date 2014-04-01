$(function () {
    wam.init();
});

var wam = {
    state : {
        currentUser: null,
        currentPage: "login",
        currentApplicationId: 0
    },
    constants : {
        login: {
            title : "Login"
        },
        register: {
            title: "Register"
        },
        profile: {
            title: "Profile"
        }
    },
    init: function () {
        wam.login.init();
        wam.register.init();
        wam.profile.init();
        wam.following.init();
        wam.applications.init();
        wam.applicationDetails.init();
        wam.pages.init();
        wam.pageDetails.init();
        wam.widgets.init();
        wam.widgetSelector.init();
        wam.widgetEditor.init();
        wam.widgets.text.init();
    },
    showPage: function (pageName, title) {
        $(".message").val("");
        $(".page").hide();
        $(".page." + pageName).show();
        if(typeof title === "undefined")
            title = wam[pageName].constants.title;
        $(".main.header .title").html(title);
        this.state.currentPage = pageName;
    }
};