wam.user = {
    init: function () {
        this.dom.init();
        this.controllers.init();
        this.services.init();
        this.state.init();
    },
    dom: {
        username: null,password: null,password2: null,
        login: null,logout: null,register: null,
        init: function () {
            this.username = $(".wam-user-username");
            this.password = $(".wam-user-password");
            this.password2 = $(".wam-user-password2");
            this.login = $(".wam-user-login-btn");
            this.logout = $(".wam-user-logout-btn");
            this.register = $(".wam-user-register-btn");
        },
        render: function () {
            this.username.val(wam.user.state.user.username);
            this.password.val(wam.user.state.user.password);
            this.password2.val(wam.user.state.user.password2);
        }
    },
    controllers : {
        init: function () {
            wam.user.dom.login.click(this.login);
            wam.user.dom.logout.click(this.logout);
            wam.user.dom.register.click(this.register);
        },
        login: function (event) {
            wam.user.state.user.username = wam.user.dom.username.val();
            wam.user.state.user.password = wam.user.dom.password.val();
            wam.user.services.login(wam.profile.show);
        },
        logout: function (event) {
            wam.user.state.user.username = wam.user.dom.username.val();
            wam.user.state.user.password = wam.user.dom.password.val();
        },
        register: function (event) {
            wam.user.state.user.username = wam.user.dom.username.val();
            wam.user.state.user.password = wam.user.dom.password.val();
            wam.user.state.user.password2 = wam.user.dom.password2.val();
            wam.user.services.register(wam.user.state.user);
        }
    },
    services :{
        init: function () {

        },
        login: function (user, callback) {

        },
        logout: function (user, callback) {

        },
        register: function (user, callback) {

        }
    },
    state: {
        init: function () {
        },
        user: {
            username: null,
            password: null,
            password2: null
        }
    }
};