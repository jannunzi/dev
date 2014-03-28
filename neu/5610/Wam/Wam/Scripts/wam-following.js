wam.following = {
    init: function () {
        this.dom.init();
        this.controllers.init();
    },
    constants : {
        title: "Following",
    },
    renderers : {
        list: function(followingList) {
            console.log(followingList);
            wam.following.dom.container.empty();
            for (var f in followingList) {
                var following = followingList[f];
                console.log(following.followedId);
                console.log(following.followedUsername);
                var item = wam.following.dom.item.clone();
                item.find(".username").html(following.followedUsername);
                item.attr("id", following.followedId);
                wam.following.dom.container.append(item);
            }
            wam.showPage("following");
        }
    },
    show: function(){
        wam.following.services.followingMe(
            wam.state.currentUser.id,
            wam.following.renderers.list);
    },
    dom: {
        searchBtn: null,
        searchFld: null,
        container: null,
        item: null,
        init: function() {
            this.searchBtn = $(".page.following .search.btn");
            this.searchFld = $(".page.following .searchFld");
            this.container = $(".page.following .following.list");
            this.item = $(".page.following .following.list .item:first").clone();
        }
    },
    controllers: {
        searchAction: function () {
            var searchStr = wam.following.dom.searchFld.val();
            wam.followingSearchResults.show(searchStr);
        },
        init : function(){
            wam.following.dom.searchBtn.click(this.searchAction);
        }
    },
    services: {
        followingMe: function (userId, callback) {
            $.ajax({
                url: "../api/following",
                data: { id: userId },
                dataType: "json",
                success: callback
            });
        }
    }
}