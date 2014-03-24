wam.register = {
    constants : {
        title : "Register"
    },
    show: function() {
        wam.showPage("register");
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
            wam.register.dom.cancelBtn.click(wam.register.controllers.cancel);
            wam.register.dom.registerBtn.click(wam.register.controllers.register);
        },
        register: function () {
            var username = wam.register.dom.usernameFld.val();
            var password = wam.register.dom.passwordFld.val();
            var password2 = wam.register.dom.password2Fld.val();
            if (password != password2) {
                wam.register.dom.messageLbl.html("Passwords must match");
                return;
            }
            if (password === "" || password2 === "") {
                wam.register.dom.messageLbl.html("Passwords must not be empty");
                return;
            }
            wam.register.services.getDeveloperByUsername(username, function (developer) {
                if (developer == null) {
                    var developerTO = {
                        username: username,
                        password: password
                    }
                    wam.register.services.postDeveloper(developerTO);
                    wam.state.currentUser = developerTO;
                } else {
                    wam.register.dom.messageLbl.html("Username already exists");
                }
            });
        },
        cancel: function () {
            wam.login.show();
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