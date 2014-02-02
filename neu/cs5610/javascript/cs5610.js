var cs5610 = {
    rottenTomatoes: {
        search: function (movieTitle, callback) {
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json",
                dataType: "jsonp",
                data: { apikey: "umgs9aw92awmyuw6qvmgqkgv", q: movieTitle },
                success: function (response) {
                    if (typeof callback === "function")
                        callback(response);
                }
            });
        }
    }
};