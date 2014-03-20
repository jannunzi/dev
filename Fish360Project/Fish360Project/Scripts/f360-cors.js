var f360 = {
    environment: "prod",
    fish: {
        template: {
            list: {
                container: {
                    selector: ".f360-page.f360-fish.f360-list ul.f360-list",
                    dom: null
                },
                item: {
                    selector: ".f360-page.f360-fish.f360-list ul.f360-list li.f360-fish",
                    dom: null
                }
            }
        },
        render: {
            list: function (fishList) {
                if(f360.fish.template.list.container.dom == null) {
                    f360.fish.template.list.container.dom =
                        $(f360.fish.template.list.container.selector);
                    f360.fish.template.list.item.dom =
                        $(f360.fish.template.list.item.selector).clone();
                }
                var container = f360.fish.template.list.container.dom;
                var item = f360.fish.template.list.item.dom;

                container.empty();

                if (typeof fishList !== "object" || fishList.length === 0)
                    return;

                for(var f in fishList) {
                    var fish = fishList[f];
                    var instance = item.clone();
                    instance.find(".f360-name").html(fish.name);
                    instance.find(".f360-id").attr("id", fish.id);
                    container.append(instance);
                }
            }
        }
    },
    services: {
        ajax: function (parameters) {
            if (typeof parameters.url === "string")
                parameters.url = f360.baseUrl + parameters.url;
            else
                return;

            $.ajax(parameters);
        },
        fish: {
            GetFishForId: function(fishId, callback) {
                f360.services.ajax({
                    url: "../api/fish/"+fishId,
                    success: callback
                });
            },
            DeleteFishForId: function (fishId, callback) {
                f360.services.ajax({
                    url: "../api/fish/" + fishId,
                    type: "delete",
                    success: callback
                });
            },
            CreateFish: function (fishTO, callback) {
                f360.services.ajax({
                    url: "../api/fish/",
                    type: "post",
                    data: fishTO,
                    success: callback
                });
            },
            UpdateFish: function (fishTO, callback) {
                f360.services.ajax({
                    url: "../api/fish/",
                    type: "put",
                    dataType: "json",
                    data: fishTO,
                    success: callback
                });
            },
            GetAllFishForTripId: function (tripId, callback) {
                f360.services.ajax({
                    url: "../api/trip/"+tripId+"/fish/",
                    success: callback
                });
            }
        },
        trip: {
            UpdateTrip: function (id, name, startDate, endDate, notes, callback) {
                var tripTO = {
                    notes: notes,
                    id: id,
                    name: name,
                    startDate: startDate,
                    endDate: endDate
                };
                f360.services.ajax({
                    url: "../api/trip",
                    data: tripTO,
                    type: "put",
                    success: callback
                });
            },
            DeleteTripForId: function (id, callback) {
                f360.services.ajax({
                    url: "../api/trip/"+id,
                    type: "delete",
                    success: callback
                });
            },
            GetTripForId: function (id, callback) {
                f360.services.ajax({
                    url: "../api/trip/"+id,
                    success: callback
                });
            },
            GetAllTrips: function (username, callback) {
                f360.services.ajax({
//                    url: "/api/user/" + userId + "/trip/",
                    url: "../api/tripsForUsername/"+username,
                    success: callback
                });
            },
            create: function (name, startDate, endDate, userId, notes, callback) {
                // jga
                var tripTO = {
                    name: name,
                    startDate: startDate,
                    endDate: endDate,
                    notes: notes,
                    userId: userId
                };
                f360.services.ajax({
                    url: "../api/trip/",
                    data: tripTO,
                    type: "post",
                    success: callback
                });
            }
        },
        user: {
            name: 'UserService',
            login: function (username, password, callback) {
                var userTO = {
                    username: username,
                    password: password
                };
                f360.services.ajax({
                    url: "../api/user/"+username+"/"+password,
                    success: callback
                });
            },
            create:function(username, password, callback) {
                var userTO = {
                    username: username,
                    password: password
                };
                f360.services.ajax({
                    url: "../api/user/",
                    data: userTO,
                    dataType: "json",
                    type: "post",
                    success: callback
                });
            },
            validateUser: function (username, password, callback) {
                var url = this.name;
                var data = {
                    user: {
                        username: username,
                        password: password
                    }
                };
                f360.services.ajax({ url: this.name + '.asmx/ValidateUser', data: data, callback: callback });
            },
            validateUsername: function (username, callback) {
                var url = this.name;
                var data = {
                    user: {
                        username: username
                    }
                };
                f360.services.ajax({ url: this.name + '.asmx/ValidateUsername', data: data, callback: callback });
            },
            hello: {
                name: 'HelloWorld',
                test: function () {
                    var url = 'UserService.asmx/'+this.name;
                    f360.services.ajax({ url: url });
                }
            }
        },
    },
    utils: {
        dateToYYYYMMDD: function (date) {
            var mm = date.getMonth() + 1;
            var dd = date.getDate();
            var yyyy = date.getFullYear();
            if (mm < 10)
                mm = "0" + mm;
            if (dd < 10)
                dd = "0" + dd;
            return yyyy + "-" + mm + "-" + dd;
        },
        jsDateToAsmx: function (jsDate) {
//            return '\\\/Date(' + jsDate + ')\\\/';
            return '/Date(' + jsDate + ')/';
        }
    },
    templates: {
        trips: null,
        fish : null
    },
    state : {
        login: {
            user : {
                username: null,
                password: null,
                id: null,
                token: null
            },
            guid : null
        }
    },
    constants: {
        dev: {
            baseUrl: "http://localhost:50465/"
        },
        prod: {
                baseUrl: "http://fish360.azurewebsites.net/"
        },
    },
    model : {}
}
f360.baseUrl = f360.constants[f360.environment].baseUrl;
