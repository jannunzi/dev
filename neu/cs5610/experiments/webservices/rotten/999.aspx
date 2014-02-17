<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
    <style>
        .wam-results-1 {
            height: 340px;
            overflow-y: scroll;
        }
        .wam-details-poster {
            height : 200px;
        }
    </style>
</head>
<body>

    <div class="container">

        <div class="row">
            <div class="col-sm-6">
                <h2>Render Response JSON</h2>
                <input type="text" class="form-control wam-movie-field-1" placeholder="Type Movie Name" value="Star Wars" />
                <button class="btn btn-primary wam-go-btn-1">Get Movie</button>
                <ul class="wam-results-1 list-unstyled wam-no-padding">
                </ul>
            </div>
            <div class="col-sm-6">
                <h2 class="wam-details-movie-title">Details</h2>
                <div class="row">
                    <div class="col-xs-4">
                        <img class="wam-details-poster" src="#" />
                    </div>
                    <div class="col-xs-8">
                        <ul class="wam-no-bullets wam-no-padding">
                            <li class="wam-details-movie-title"></li>
                            <li class="wam-details-movie-date"></li>
                            <li class="wam-details-rating"></li>
                            <li class="wam-critics_consensus"></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <h2>Actors</h2>
                    <table class="wam-details-actors table"></table>
                </div>
            </div>
        </div>

        <h2>Iterate over response JSON</h2>
        <input type="text" class="form-control wam-movie-field" placeholder="Type Movie Name" value="Star Wars" />
        <button class="btn btn-primary wam-go-btn">Get Movie</button>

        <h2>Get Movie from input field</h2>
        <input type="text" class="form-control wam-movie-from-field" placeholder="Type Movie Name" value="Star Wars" />
        <button class="btn btn-primary wam-movie-from-field-btn">Get Movie</button>

        <h2>Get Star Trek programmatically</h2>

        <button class="btn btn-primary wam-get-star-trek">Get Star Trek</button>

        <h2>Get it from a link</h2>
        <a href="http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=umgs9aw92awmyuw6qvmgqkgv&q=Star%20Trek&page_limit=5" target="_blank">
            Get Start Trek
        </a>
    </div>

    <div class="wam-templates">
        <table class="actor-template table">
            <tr class="actor">
                <td class="id"></td>
                <td class="name"></td>
                <td class="characters"></td>
            </tr>
        </table>
        <ul class="wam-li-template">
            <li class="wam-get-details">
                <div>
                    <span class="wam-id">1234</span>
                    <span class="wam-title">Star Wars</span>
                    <span class="wam-year">1977</span>
                    <img height="100" style="float:left" src="http://images.rottentomatoescdn.com/images/redesign/poster_default.gif" class="wam-thumbnail"/>
                </div>
                <div style="clear:both"></div>
            </li>
            <li>
                <div>
                    <span class="wam-id">1234</span>
                    <span class="wam-title">Star Wars</span>
                    <span class="wam-year">1977</span>
                    <img height="100" style="float:left" src="http://images.rottentomatoescdn.com/images/redesign/poster_default.gif" class="wam-thumbnail"/>
                </div>
                <div style="clear:both"></div>
            </li>
            <li>
                <div>
                    <span class="wam-id">1234</span>
                    <span class="wam-title">Star Wars</span>
                    <span class="wam-year">1977</span>
                    <img height="100" style="float:left" src="http://images.rottentomatoescdn.com/images/redesign/poster_default.gif" class="wam-thumbnail"/>
                </div>
                <div style="clear:both"></div>
            </li>
            <li>
                <div>
                    <span class="wam-id">1234</span>
                    <span class="wam-title">Star Wars</span>
                    <span class="wam-year">1977</span>
                    <img height="100" style="float:left" src="http://images.rottentomatoescdn.com/images/redesign/poster_default.gif" class="wam-thumbnail"/>
                </div>
                <div style="clear:both"></div>
            </li>
        </ul>
    </div>

    <form id="form1" runat="server">
    <div class="container">
        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script src="../../../javascript/wam.js"></script>
    <script>

        var jq = {};

        $(function () {
            jq.detailActorList = $(".wam-details-actors");
            jq.detailsActorTemplate = $(".actor-template .actor");
            jq.detailMovieTitle = $(".wam-details-movie-title");
            jq.detailPoster = $(".wam-details-poster");
            jq.detailDate = $(".wam-details-movie-date");
            jq.detailRating = $(".wam-details-rating");
            jq.detailCritics_concensus = $(".wam-critics_consensus");
            
            $(".wam-go-btn-1").click(renderJSONResponse);
            $(".wam-go-btn").click(iterateOverJSON);
            $(".wam-movie-from-field-btn").click(getMovieFromFieldHandler);
            $(".wam-get-star-trek").click(getSTEventHandler);

//            $(".wam-get-details").click(getDetails);
            $(".wam-results-1").on("click", ".wam-get-details", getDetails);
        });

        function getDetails() {
            var id = $(this).attr("id");

            var params = {
                apikey: "umgs9aw92awmyuw6qvmgqkgv"
            };
            

            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies/"+id+".json",
                dataType: "jsonp",
                data: params,
                success: function (response) {
                    console.log(response);
                    jq.detailMovieTitle.html(response.title);
                    jq.detailPoster.attr("src", response.posters.original);
                    jq.detailDate.html(response.year);
                    jq.detailRating.html(response.mpaa_rating);
                    jq.detailCritics_concensus.html(response.critics_consensus);

                    jq.detailActorList.empty();

                    for (var a = 0; a < response.abridged_cast.length; a++) {
                        var actor = response.abridged_cast[a];
                        console.log(actor);

                        var actorDom = jq.detailsActorTemplate.clone();
                        for (var key in actor) {
                            var val = actor[key];
                            console.log(key + " = " + val);
                            var clazz = "." + key;
                            actorDom.find(clazz).html(val);
                            jq.detailActorList.append(actorDom);
                        }
                    }
                }
            });
        }

        function renderJSONResponse() {
            var movieName = $(".wam-movie-field-1").val();
            var params = {
                apikey: "umgs9aw92awmyuw6qvmgqkgv",
                q: movieName
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json",
                dataType: "jsonp",
                data: params,
                success: function (response) {
                    var template = $(".wam-li-template li:first");
                    var ul = $(".wam-results-1");
                    ul.empty();
                    for (var i = 0; i < response.movies.length; i++) {
                        var movie = response.movies[i];
                        var id = movie.id;
                        var title = movie.title;
                        var year = movie.year;
                        var thumbnail = movie.posters.thumbnail;

                        var instance = template.clone();

                        instance.attr("id", id);
                        instance.find(".wam-id").html(id);
                        instance.find(".wam-title").html(title);
                        instance.find(".wam-year").html(year);
                        instance.find(".wam-thumbnail").attr("src", thumbnail);

                        ul.append(instance);
                    }
                }
            });
        }

        function iterateOverJSON() {
            var movieName = $(".wam-movie-field").val();
            var params = {
                apikey: "umgs9aw92awmyuw6qvmgqkgv",
                q: movieName
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json",
                dataType: "jsonp",
                data: params,
                success: function (response) {
                    for (var i = 0; i < response.movies.length; i++) {
                        var movie = response.movies[i];
                        var id = movie.id;
                        var title = movie.title;
                        var year = movie.year;
                        var thumbnail = movie.posters.thumbnail;
                        console.log([id, title, year, thumbnail]);
                    }
                }
            });
        }

        function getMovieFromFieldHandler() {
            var movieName = $(".wam-movie-from-field").val();
            var params = {
                apikey: "umgs9aw92awmyuw6qvmgqkgv",
                q: movieName
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json",
                dataType: "jsonp",
                data: params,
                success: function (response) {
                    console.log(response);
                }
            });
        }
        function getSTEventHandler() {
            var params = {
                apikey : "umgs9aw92awmyuw6qvmgqkgv",
                q:"Nightmare before christmas",
                page_limit : 5
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json",
                dataType: "jsonp",
                data: params,
                success: function (response) {
                    console.log(response);
                }
            });
        }
    </script>
</body>
</html>
