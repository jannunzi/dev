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

                <h2>Search for Any Movie</h2>

                <div class="input-group">
                  <input type="text" class="form-control wam-movie-title" placeholder="Movie Title" value="Star Trek"/>
                  <span class="input-group-btn">
                    <button class="btn btn-default wam-go" type="button">Go</button>
                  </span>
                </div>

                <h2>Render Results as a Table</h2>

                <table class="table">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Date</th>
                            <th>Audience</th>
                            <th>Critics</th>
                            <th>Poster</th>
                        </tr>
                    </thead>
                    <tbody class="wam-results">

                    </tbody>
                </table>

            </div>
        </div>

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script src="../../../javascript/wam.js"></script>
    <script src="../../../javascript/cs5610.js"></script>
    <script>
        $(function () {
            $(".wam-go").click(searchForMovies);
        });

        function searchForMovies() {
            var movieTitle = $(".wam-movie-title").val();
            if (movieTitle === "" || movieTitle === null || typeof movieTitle === "undefined")
                return;
            cs5610.rottenTomatoes.searchMovieTitle(movieTitle, renderResults);
        }

        function renderResults(response) {
            console.log(response);
            var movies = response.movies;
            var table = $(".wam-results");
            table.empty();
            for (var i in movies) {

                var movie = movies[i];

                var title = movie.title;
                var year = movie.year;
                var thumb = movie.posters.thumbnail;
                var audience = movie.ratings.audience_score;
                var critics = movie.ratings.critics_score;

                var tr = $("<tr>");

                var td = $("<td>");
                td.append(title);
                tr.append(td);

                td = $("<td>");
                td.append(year);
                tr.append(td);

                td = $("<td>");
                td.append(audience);
                tr.append(td);

                td = $("<td>");
                td.append(critics);
                tr.append(td);

                var img = $("<img>");
                img.attr("src", thumb);
                img.height(91);
                td = $("<td>");
                td.append(img);
                tr.append(td);

                table.append(tr);
            }
        }

    </script>
</body>
</html>
