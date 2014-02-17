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
                <div class="input-group">
                  <input type="text" class="form-control wam-movie-title" placeholder="Search Movie" value="Star Trek"/>
                  <span class="input-group-btn">
                    <button class="btn btn-default wam-go" type="button">Go</button>
                  </span>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <h2>Search Results</h2>
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
            <div class="col-sm-6">
                <h2>Reviews</h2>
                <table class="wam-reviews table">
                    <thead>
                        <tr>
                            <th>Critic</th>
                            <th>Date</th>
                            <th>Freshness</th>
                            <th>Publication</th>
                        </tr>
                    </thead>
                    <tbody>
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
            $("body").on("click", ".wam-details", handleDetailsLink);
        });

        function handleDetailsLink() {
            var link = $(this);
            var id = link.attr("id");
//            cs5610.rottenTomatoes.search({ id: id, callback: renderDetails });
            cs5610.rottenTomatoes.reviews({ id: id, callback: renderReviews });
        }

        function renderReviews(movie) {
            var html = '<tr style="vertical-align: top;">' +
                            '<td class="wam-critic"></td>' +
                            '<td class="wam-date"></td>' +
                            '<td class="wam-freshness"></td>' +
                            '<td>' +
                                '<a target="_blank" href="#" class="wam-publication"></a>' +
                            '</td>' +
                        '</tr>';
            html += '<tr style="vertical-align: top;"><td class="wam-quote" colspan=4></td></tr>';

            console.log("renderReviews");
            console.log(movie);
            var tbody = $(".wam-reviews tbody");
            tbody.empty();
            for (var i in movie.reviews) {
                var dom = $(html);
                dom.find(".wam-critic").html(movie.reviews[i].critic);
                dom.find(".wam-date").html(movie.reviews[i].date);
                dom.find(".wam-freshness").html(movie.reviews[i].freshness);
                dom.find(".wam-publication")
                    .html(movie.reviews[i].publication)
                    .attr("href", movie.reviews[i].links.review);
                dom.find(".wam-quote").html("Quote: "+movie.reviews[i].quote);
                tbody.append(dom);
            }
        }

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
                var id = movie.id;
                var year = movie.year;
                var thumb = movie.posters.thumbnail;
                var audience = movie.ratings.audience_score;
                var critics = movie.ratings.critics_score;

                var tr = $("<tr>");

                var titleLink = $("<a href='#' class='wam-details'>");
                titleLink.append(title);
                titleLink.attr("id", id);

                var td = $("<td>");
                td.append(titleLink);
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
