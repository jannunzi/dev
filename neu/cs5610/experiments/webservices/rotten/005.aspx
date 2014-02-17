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

        Rotten Tomatoes API can be found

        <a target="_blank" href="http://developer.rottentomatoes.com/docs/read/JSON">here</a>

        <div class="row">
            <div class="col-sm-6">

                <h2>Search for Avatar</h2>

                <p>
                    <a href="http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=umgs9aw92awmyuw6qvmgqkgv&q=Avatar&page_limit=1" target="_blank">Click to get Avatar JSON response</a>
                </p>
                <pre>
&lt;a href=&quot;http://api.rottentomatoes.com/api/public/v1.0/movies.json?
      apikey=[my-key]&amp;q=Avatar&amp;page_limit=1&quot; target=&quot;_blank&quot;&gt;Avatar&lt;/a&gt;</pre>

                <p>Response</p>

                <pre>
{
  "total": 9,
  "movies": [
    {
      "id": "<b class="wam-highlight">665118753</b>",
      "title": "Avatar",
      "year": 2009,
      "mpaa_rating": "PG-13",
      "runtime": 162,
        ...
    }
  ]
}</pre>

                <p>
                    Avatar's ID: 665118753
                </p>
            </div>
            <div class="col-sm-6">

                <h2>Search for Any Movie</h2>

                <div class="input-group">
                  <input type="text" class="form-control wam-movie-title" placeholder="Movie Title" value="Star Trek"/>
                  <span class="input-group-btn">
                    <button class="btn btn-default wam-go" type="button">Go</button>
                  </span>
                </div>

                <h2>Search Results</h2>

                <ul class="wam-results"></ul>

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
