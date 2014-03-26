$(function () {
    social.init();
});

var social = {
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
        social.login.init();
        social.register.init();
    },
    showPage: function (pageName) {
        $(".message").val("");
        $(".page").hide();
        $(".page." + pageName).show();
        var title = social[pageName].constants.title;
        $(".main.header .title").html(title);
        this.state.currentPage = pageName;
    }
};