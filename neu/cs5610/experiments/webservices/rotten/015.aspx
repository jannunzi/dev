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

                <h2>Retrieve First Movie</h2>

                <div class="input-group">
                  <input type="text" class="form-control wam-movie-title" placeholder="Movie Title" value="Star Trek"/>
                  <span class="input-group-btn">
                    <button class="btn btn-default wam-go" type="button">Go</button>
                  </span>
                </div>

                <h2>Render Results</h2>

                <img class="wam-poster pull-left wam-height-100 wam-margin-right wam-sm" src="http://content7.flixster.com/movie/10/91/12/10911201_mob.jpg"/>

                <ul class="wam-no-bullets wam-no-padding wam-margin-left wam-sm">
                    <li>Movie title: <span class="wam-title">Avatar</span></li>
                    <li>Release date: <span class="wam-year">2009</span></li>
                    <li>Rating: <span class="wam-ratig">PG-13</span></li>
                    <li>Critict ranking: <span class="wam-ranking wam-critics">70</span>%</li>
                    <li>Audience ranking: <span class="wam-ranking wam-audience">80</span>%</li>
                </ul>

                <div class="clearfix"></div>

                <h3>Critics Concensus</h3>

                <p class="wam-concensus"></p>

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

            var movies = response.movies;
            var movie = movies[0];
            console.log(movie);

            var title = movie.title;
            var year = movie.year;
            var rating = movie.mpaa_rating;
            var detailed = movie.posters.detailed;
            var thumb = movie.posters.thumbnail;
            var audience = movie.ratings.audience_score;
            var critics = movie.ratings.critics_score;
            var concensus = movie.critics_consensus;

            $(".wam-title").html(title);
            $(".wam-year").html(year);
            $(".wam-rating").html(rating);
            $(".wam-ranking.wam-critics").html(critics);
            $(".wam-ranking.wam-audience").html(audience);
            $(".wam-poster").attr("src", thumb);
            $(".wam-concensus ").html(concensus);
        }

    </script>
</body>
</html>
