social.login = {
    constants : {
        title : "Login"
    },
    show : function() {
        social.showPage("login");
    },
    init: function () {
        this.dom.init();
        this.controllers.init();
    },
    dom: {
        loginBtn:    null,
        registerBtn: null,
        usernameFld: null,
        passwordFld: null,
        messageLbl:  null,
        init: function () {
            this.loginBtn =     $(".login.page .login.action");
            this.usernameFld =  $(".login.page .username");
            this.passwordFld =  $(".login.page .password");
            this.messageLbl =   $(".login.page .message");
            this.registerBtn =  $(".login.page .register.navigate");
        }
    },
    controllers: {
        init: function () {
            social.login.dom.loginBtn.click(social.login.controllers.login);
            social.login.dom.registerBtn.click(social.login.controllers.register);
        },
        login: function () {
            var username = social.login.dom.usernameFld.val();
            var password = social.login.dom.passwordFld.val();
            social.login.services.getDeveloperByUsernameAndPassword(username, password, function (response) {
                if (response == null) {
                    social.currentUser = null;
                    social.login.dom.messageLbl.html("Sorry that username does not exist");
                } else {
                    social.state.currentUser = response;
                    social.profile.show();
                }
            });
        },
        logout: function () {

        },
        register: function () {
            social.register.show();
        }
    },
    services : {
        getDeveloperByUsernameAndPassword : function(username, password, callback) {
            $.ajax({
                url: "/api/developers?username=" + username + "&password=" + password,
                dataType: "json",
                success: function (response) {
                    if (typeof callback == "function") {
                        callback(response);
                    }
                }
            });
        },
        getDeveloperByUsernameAndPassword: function (username, password, callback) {
            $.ajax({
                url: "/api/developers?username=" + username + "&password=" + password,
                dataType: "json",
                success: function (response) {
                    if (typeof callback == "function") {
                        callback(response);
                    }
                }
            });
        },
        deleteDeveloper : function (id, callback) {
            $.ajax({
                url: "/api/developers/" + id,
                type: "delete",
                dataType: "json",
                success: callback
            });
        },
        putDeveloper : function (id, developerTO, callback) {
            $.ajax({
                url: "/api/developers/" + id,
                type: "put",
                dataType: "json",
                data: developerTO,
                success: callback
            });
        },
        getDeveloper : function (usernameId, callback) {
            $.ajax({
                url: "/api/developers/" + usernameId,
                dataType: "json",
                success: callback
            });
        },
        getAllDevelopers : function (callback) {
            $.ajax({
                url: "/api/developers",
                dataType: "json",
                success: callback
            });
        }
    }
}