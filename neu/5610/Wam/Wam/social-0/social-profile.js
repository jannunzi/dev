social.profile = {
    init : function() {
        social.profile.dom.init();
        social.profile.controllers.init();
    },
    dom : {
        searchFld: null,
        searchBtn: null,
        resultsList: null,
        movieTpl : null,
        init: function () {
            social.profile.dom.searchBtn = $('.profile.page .search.action');
            social.profile.dom.searchFld = $('.profile.page .search.field');
            social.profile.dom.resultsList = $('.profile.page .results');
            social.profile.dom.movieTpl = $('.profile.page .movie').clone();
        }
    },
    controllers: {
        init: function () {
            $(".profile.page .results").on("click", ".likes", social.profile.controllers.userLikesMovie)
            social.profile.dom.searchBtn.click(social.profile.controllers.searchBtnClk);
        },
        userLikesMovie: function() {
            var item = $(this);
            var id = item.attr("id");
            var username = social.state.currentUser.username;
            $.ajax({
                url: '/api/likes',
                type: 'post',
                data: { username: username, movieId: id },
                dataType: 'json',
                success: function (response) {

                }
            })
            console.log(id);
        },
        searchBtnClk: function () {
            var movieName = social.profile.dom.searchFld.val();
            var data = {
                apikey: 'umgs9aw92awmyuw6qvmgqkgv',
                q: movieName
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json",
                dataType: "jsonp",
                data: data,//{ apikey: "umgs9aw92awmyuw6qvmgqkgv", q: movieName },
                success: function (response) {
                    console.log(response);
                    if (typeof callback === "function")
                        callback(response);
                    social.profile.dom.resultsList.empty();
                    for (var m = 0; m < response.movies.length; m++) {
                        var movie = response.movies[m];
                        var id = movie.id;
                        var thumb = movie.posters.thumbnail;
                        var item = social.profile.dom.movieTpl.clone();
                        item.find("img").attr("src", thumb);
                        item.find(".likes").attr("id", id);
                        social.profile.dom.resultsList.append(item);
                    }
                }
            });
        }
    },
    constants: {
        title : "Profile"
    },
    show: function () {
        social.showPage("profile");
    }
}