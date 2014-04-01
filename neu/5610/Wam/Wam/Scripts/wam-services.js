wam.services = {
    pages: {
        getPagesForApplicationId: function (appId, callback) {
            $.ajax({
                url: "/api/pages",
                dataType: "json",
                data: { application: appId },
                success: callback
            });
        }
    },
    applications: {
        getApplicationsForUsername: function (username, callback) {
            $.ajax({
                url: "/api/applications",
                dataType: "json",
                data: { username: username },
                success: callback
            });
        },
        getApplications: function (username, callback) {
            $.ajax({
                url: "/api/applications",
                dataType: "json",
                success: callback
            });
        }
    },
    widgets: {
        get: function(widgetId, callback) {
            $.ajax({
                url: "/api/widgets",
                dataType: "json",
                data: {widgetId: widgetId},
                type: "get",
                success: callback
            });
        },
        // this actually adds a new widget to the page
        postWidgetForPage: function (pageId, widgetType, order, callback) {
            var data = {
                pageId: pageId,
                widgetType: widgetType,
                order: order
            };
            $.ajax({
                url: "../api/widgets",
                type: "get",
                data: data,
                dataType: "json",
                success: callback
            });
        },
        getWidgetsForPageId: function (pageId, callback) {
            $.ajax({
                url: "/api/widgets",
                dataType: "json",
                data: { pageId: pageId },
                success: callback
            });
        },
        delete: function (widgetId, callback) {
            $.ajax({
                url: "/api/widgets/" + widgetId,
                type: 'delete',
                dataType: "json",
                success: callback
            });
        },
        sort: function (widgetId, newOrder, callback) {
            var widgetTO = {
                id: widgetId,
                order: newOrder
            };
            $.ajax({
                url: "/api/widgets",
                type: "put",
                dataType: "json",
                data: widgetTO,
                success: callback
            });
        },
        put: function(widgetTO, callback) {
            $.ajax({
                url: "/api/widgets",
                type: "put",
                dataType: "json",
                data: widgetTO,
                success: callback
            });
        }
    },
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