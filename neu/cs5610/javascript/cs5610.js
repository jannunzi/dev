var cs5610 = {
    rottenTomatoes: {
        searchMovieTitle : function (movieTitle, callback) {
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json",
                dataType: "jsonp",
                data: { apikey: "umgs9aw92awmyuw6qvmgqkgv", q: movieTitle },
                success: function (response) {
                    if (typeof callback === "function")
                        callback(response);
                }
            });
        },
        search: function (options) {
            if (typeof options != "object")
                return;
            var callback = options.callback;
            if (typeof callback != "function")
                return;
            var id = options.id;
            var title = options.title;
            if (typeof id === "undefined" && typeof title === "undefined")
                return;
            var data = {};
            if (typeof title === "string" && title !== "") {
                return this.searchMovieTitle(title, callback);
            }
            if (typeof id === "string" && id !== "") {
                var url = "http://api.rottentomatoes.com/api/public/v1.0/movies/" + id + ".json";
                $.ajax({
                    url: url,
                    dataType: "jsonp",
                    data: { apikey: "umgs9aw92awmyuw6qvmgqkgv" },
                    success: function (response) {
                        if (typeof callback === "function")
                            callback(response);
                    }
                });
            }
        },
        reviews: function (options) {
            if (typeof options != "object")
                return;
            var callback = options.callback;
            if (typeof callback != "function")
                return;
            var id = options.id;
            if (typeof id === "undefined")
                return;
            if (typeof id === "string" && id !== "") {
                var url = "http://api.rottentomatoes.com/api/public/v1.0/movies/" + id + "/reviews.json";
                $.ajax({
                    url: url,
                    dataType: "jsonp",
                    data: { apikey: "umgs9aw92awmyuw6qvmgqkgv" },
                    success: function (response) {
                        if (typeof callback === "function")
                            callback(response);
                    }
                });
            }
        }
    }
};