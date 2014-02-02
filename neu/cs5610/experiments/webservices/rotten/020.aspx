<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Rotten Tomatoes Movie REST API</h1>

        <div class="row">
            <div class="col-sm-6">
                <h2>Get Info for Specific Movie</h2>

                <ul>
                    <li><a href="http://api.rottentomatoes.com/api/public/v1.0/movies/665118753.json?apikey=umgs9aw92awmyuw6qvmgqkgv" target="_blank">
                            Avatar
                        </a></li>
                    <li><a href="http://api.rottentomatoes.com/api/public/v1.0/movies/10009.json?apikey=umgs9aw92awmyuw6qvmgqkgv" target="_blank">
                            Star Wars II
                        </a></li>
                    <li><a href="http://api.rottentomatoes.com/api/public/v1.0/movies/9.json?apikey=umgs9aw92awmyuw6qvmgqkgv" target="_blank">
                            Star Wars III
                        </a></li>
                    <li><a href="http://api.rottentomatoes.com/api/public/v1.0/movies/11292.json?apikey=umgs9aw92awmyuw6qvmgqkgv" target="_blank">
                            Star Wars IV
                        </a></li>
                    <li><a href="http://api.rottentomatoes.com/api/public/v1.0/movies/770673029.json?apikey=umgs9aw92awmyuw6qvmgqkgv" target="_blank">
                            Star Trek
                        </a></li>
                </ul>
            </div>
        </div>

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script src="../../../javascript/wam.js"></script>
    <script>
        $(function () {
            $(".wam-go").click(searchForMovies);
        });

        function searchForMovies() {
            var movieTitle = $(".wam-movie-title").val();
            if (movieTitle === "" || movieTitle === null || typeof movieTitle === "undefined")
                return;
            rottenTomatoesMovieSearch(movieTitle, renderResults);
        }

        function rottenTomatoesMovieSearch(movieTitle, callback) {

            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json",
                dataType : "jsonp",
                data: { apikey: "umgs9aw92awmyuw6qvmgqkgv", q: movieTitle },
                success: function (response) {
                    console.log(response);
                    if (typeof callback === "function")
                        callback(response);
                }
            });
        }

        function renderResults(response) {
            var movies = response.movies;
            var ul = $(".wam-results");
            ul.empty();
            for (var i in movies) {
                var movie = movies[i];
                var title = movie.title;
                var li = $("<li>");
                li.append(title);
                ul.append(li);
            }
        }

    </script>
</body>
</html>
