wam.services = {
    developer: {
        getDeveloperByUsername: function(username, callback) {
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
        getDeveloperByUsername : function (username, callback) {
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
        postDeveloper : function (developerTO, callback) {
            $.ajax({
                url: "/api/developers",
                type: "post",
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