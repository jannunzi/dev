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
            <div class="col-sm-12">

                <h2>Details in a Dialog</h2>

                <div class="input-group">
                  <input type="text" class="form-control wam-movie-title" placeholder="Movie Title" value="Star Trek"/>
                  <span class="input-group-btn">
                    <button class="btn btn-default wam-go" type="button">Go</button>
                  </span>
                </div>

                <h2>Render Results in a Grid</h2>

                <div class="wam-results">
                </div>

            </div>
        </div>

        <div class="modal fade" id="myModal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Modal title</h4>
              </div>
              <div class="modal-body">
                <img height="200" class="modal-poster pull-left wam-margin-right wam-sm" src="http://content7.flixster.com/movie/10/91/12/10911201_mob.jpg" />
                <ul class="wam-no-bullets">
                    <li><span class="wam-title"></span></li>
                    <li><span class="wam-year"></span></li>
                </ul>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>
    <script src="../../../javascript/wam.js"></script>
    <script src="../../../javascript/cs5610.js"></script>
    <script>

        var responseCache;

        $(function () {
            $(".wam-go").click(searchForMovies);
        });

        function searchForMovies() {
            var movieTitle = $(".wam-movie-title").val();
            if (movieTitle === "" || movieTitle === null || typeof movieTitle === "undefined")
                return;
            cs5610.rottenTomatoes.searchMovieTitle(movieTitle, renderResults);
            $("body").on("click", ".wam-image", showDetails);
        }

        function showDetails(event) {
            var img = $(this);
            var id = img.attr("id");
            var movies = responseCache.movies;
            for (var i in movies) {
                var movie = movies[i];
                if (id != movie.id)
                    continue;

                var title = movie.title;
                var year = movie.year;
                var thumb = movie.posters.thumbnail;
                var original = movie.posters.original;
                var audience = movie.ratings.audience_score;
                var critics = movie.ratings.critics_score;
                console.log(movie);

                var myModal = $("#myModal");

                myModal.modal({ show: true });
                myModal.find(".modal-title, .wam-title").html(title);
                myModal.find(".modal-poster").attr("src", thumb);
                myModal.find(".wam-year").html(year);

                break;
            }
        }

        function renderResults(response) {
            responseCache = response;
            var movies = response.movies;
            var results = $(".wam-results");
            results.empty();
            for (var i in movies) {

                var movie = movies[i];

                var id = movie.id;
                var original = movie.posters.original;

                var img = $("<img>");
                img.attr("src", original);
                img.addClass("wam-image");
                img.attr("id", id);
                img.height(200);
                img.width(200);

                results.append(img);
            }
        }

    </script>
</body>
</html>
