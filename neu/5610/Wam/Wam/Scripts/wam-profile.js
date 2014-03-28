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
        followingBtn: null,
        followersBtn: null,
        init: function () {
            wam.profile.dom.applicationsBtn = $(".profile.page .applications.btn");
            wam.profile.dom.followingBtn = $(".profile.page .following.btn");
            wam.profile.dom.followersBtn = $(".profile.page .followers.btn");
        }
    },
    controllers: {
        init: function () {
            wam.profile.dom.applicationsBtn.click(wam.profile.controllers.applications);
            wam.profile.dom.followingBtn.click(wam.profile.controllers.following);
            wam.profile.dom.followersBtn.click(wam.profile.controllers.followers);
        },
        following: function () {
            wam.following.show();
        },
        followers: function() {
            alert("followers");
        },
        applications: function () {
            wam.applications.show();
        }
    },
    services: {
    }
}