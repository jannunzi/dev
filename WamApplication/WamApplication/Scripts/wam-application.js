wam.application = {
    init: function () {
    },
    dom: {
        list: {
            container: null,
            item: null,
            render: function (applications) 
            { 
            }
        },
        details:{
            render: function (application) {

            }
        },
        init: function () {
            wam.application.dom.listContainer = $("");
            wam.application.dom.listItemTemplate
                = $(".wam-profile .wam-application.wam-list tbody tr").clone();
        }
    },
    controllers: {
        init: function () {

        }
    },
    state:{

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