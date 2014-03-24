wam.login = {
    constants : {
        title : "Login"
    },
    show : function() {
        wam.showPage("login");
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
            wam.login.dom.loginBtn.click(wam.login.controllers.login);
            wam.login.dom.registerBtn.click(wam.login.controllers.register);
        },
        login: function () {
            var username = wam.login.dom.usernameFld.val();
            var password = wam.login.dom.passwordFld.val();
            wam.login.services.getDeveloperByUsernameAndPassword(username, password, function (response) {
                if (response == null) {
                    wam.currentUser = null;
                    wam.login.dom.messageLbl.html("Sorry that username does not exist");
                } else {
                    wam.state.currentUser = response;
                    wam.profile.show();
                }
            });
        },
        logout: function () {

        },
        register: function () {
            wam.register.show();
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