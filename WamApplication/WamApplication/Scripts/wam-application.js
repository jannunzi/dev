wam.application = {
    dom : {},
    init: function () {
        this.dom.listWrapper
            = $(".wam-profile .wam-application.wam-list tbody");
        this.dom.listItemTemplate
            = $(".wam-profile .wam-application.wam-list tbody tr").clone();
    },
    services: {
        findAll: function (username, callback) {
            $.ajax({
                url: "http://localhost:63682/ApplicationService.asmx/findAll",
                type: "post",
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                }
            })
        }
    },
    renderers: {
        list: function (apps) {
            console(apps);
            wam.jqCache.appListWrapper.empty();
            apps = apps.d;
            for (var a in apps) {
                var app = apps[a];
                var instance = wam.jqCache.appListItemTemplate.clone();
            }
        }
    }
};