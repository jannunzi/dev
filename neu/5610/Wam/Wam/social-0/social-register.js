social.register = {
    constants : {
        title : "Register"
    },
    show: function() {
        social.showPage("register");
    },
    init: function () {
        this.dom.init();
        this.controllers.init();
    },
    dom: {
        usernameFld: null,
        passwordFld: null,
        password2Fld: null,
        registerBtn: null,
        cancelBtn: null,
        messageLbl: null,
        init: function () {
            this.registerBtn  = $(".register.page .register.btn");
            this.cancelBtn    = $(".register.page .cancel.btn");
            this.usernameFld  = $(".register.page .username.fld");
            this.passwordFld  = $(".register.page .password.fld");
            this.password2Fld = $(".register.page .password2.fld");
            this.messageLbl   = $(".register.page .message");
        }
    },
    controllers: {
        init: function () {
            social.register.dom.cancelBtn.click(social.register.controllers.cancel);
            social.register.dom.registerBtn.click(social.register.controllers.register);
        },
        register: function () {
            var username = social.register.dom.usernameFld.val();
            var password = social.register.dom.passwordFld.val();
            var password2 = social.register.dom.password2Fld.val();
            if (password != password2) {
                social.register.dom.messageLbl.html("Passwords must match");
                return;
            }
            if (password === "" || password2 === "") {
                social.register.dom.messageLbl.html("Passwords must not be empty");
                return;
            }
            social.register.services.getDeveloperByUsername(username, function (developer) {
                if (developer == null) {
                    var developerTO = {
                        username: username,
                        password: password
                    }
                    social.register.services.postDeveloper(developerTO);
                    social.state.currentUser = developerTO;
                } else {
                    social.register.dom.messageLbl.html("Username already exists");
                }
            });
        },
        cancel: function () {
            social.login.show();
        }
    },
    services: {
        getDeveloperByUsername: function (username, callback) {
            $.ajax({
                url: "/api/developers?username=" + username,
                dataType: "json",
                success: function (response) {
                    if (typeof callback == "function") {
                        callback(response);
                    }
                }
            });
        },
        postDeveloper : function (developerTO, callback) {
            $.ajax({
                url: "/api/developers",
                type: "post",
                dataType: "json",
                data: developerTO,
                success: callback
            });
        }
    }
}