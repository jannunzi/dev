$(function () {
    social.init();
});

var social = {
    state : {
        currentUser: null,
        currentPage: "login"
    },
    init: function () {
        social.login.init();
        social.register.init();
        social.profile.init();
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