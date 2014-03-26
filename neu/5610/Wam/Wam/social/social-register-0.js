social.register = {
    init: function () {
        this.dom.registerBtn = $("");
    },
    dom : {
        registerBtn: null,
        cancelBtn  : null
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
        postDeveloper: function (developerTO, callback) {
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