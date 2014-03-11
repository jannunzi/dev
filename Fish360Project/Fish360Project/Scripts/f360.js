var f360 = {
    environment: "dev",
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
            parameters.type = 'post';
            parameters.contentType = 'application/json';
            if (typeof parameters.callback === 'function')
                parameters.success = parameters.callback
            if (typeof parameters.data === 'object')
                parameters.data = JSON.stringify(parameters.data);

            $.ajax(parameters);
        },
        fish: {
            GetFishForId: function(fishId, callback) {
                var data = {
                    fishId: fishId,
                    token: f360.state.login.guid
                };
                f360.services.ajax({
                    url: "FishService.asmx/GetFishForId",
                    data: data,
                    callback: callback
                });
            },
            DeleteFishForId: function (fishId, callback) {
                var data = {
                    fishId: fishId,
                    token: f360.state.login.guid
                };
                f360.services.ajax({
                    url: "FishService.asmx/DeleteFishForId",
                    data: data,
                    callback: callback
                });
            },
            CreateFish: function (fishTO, callback) {
                var data = {
                    fishTO: fishTO,
                    token: f360.state.login.guid
                };
                f360.services.ajax({
                    url: "FishService.asmx/CreateFish",
                    data: data,
                    callback: callback
                });
            },
            UpdateFish: function (fishTO, callback) {
                var data = {
                    fishTO: fishTO,
                    token: f360.state.login.guid
                };
                f360.services.ajax({
                    url: "FishService.asmx/UpdateFish",
                    data: data,
                    callback: callback
                });
            },
            GetAllFishForTripId: function (tripId, callback) {
                var data = {
                    tripId: tripId,
                    token: f360.state.login.guid
                };
                f360.services.ajax({
                    url: "FishService.asmx/GetAllFishForTripId",
                    data: data,
                    callback: callback
                });
            }
        },
        trip: {
            UpdateTrip: function (id, name, startDate, endDate, callback) {
                var tripTO = {
                    id : id,
                    name: name,
                    startDate: startDate,
                    endDate: endDate
                };
                var data = {
                    tripTO : tripTO,
                    token: f360.state.login.guid
                };
                f360.services.ajax({
                    url: "TripService.asmx/UpdateTrip",
                    data: data,
                    callback: callback
                });
            },
            DeleteTripForId: function (id, callback) {
                var data = {
                    id: id,
                    token: f360.state.login.guid
                };
                f360.services.ajax({
                    url: "TripService.asmx/DeleteTripForId",
                    data: data,
                    callback: callback
                });
            },
            GetTripForId: function (id, callback) {
                var data = {
                    id: id,
                    token : f360.state.login.guid
                };
                f360.services.ajax({
                    url: "TripService.asmx/GetTripForId",
                    data: data,
                    callback: callback
                });
            },
            GetAllTrips: function (token, callback) {
                var data = {
                    userTO: {
                        token: token
                    }
                };
                f360.services.ajax({ url: "TripService.asmx/GetAllTrips", data: data, callback: callback });
            },
            create: function (name, startDate, endDate, callback) {
                // jga
                var data = {
                    tripTO: {
                        name: name,
                        startDate: startDate,
                        endDate: endDate
                    },
                    token: f360.state.login.guid
                };
                f360.services.ajax({
                    url: "TripService.asmx/CreateTrip",
                    data: data,
                    callback: callback
                });
            }
        },
        user: {
            name: 'UserService',
            login: function (username, password, callback) {
                var data = {
                    user: {
                        username: username,
                        password: password
                    }
                };
                f360.services.ajax({ url: this.name + '.asmx/LoginUser', data: data, callback: callback });
            },
            create:function(username, password, callback) {
                var data = {
                    user: {
                        username: username,
                        password: password
                    }
                };
                f360.services.ajax({ url: this.name + '.asmx/CreateUser', data: data, callback:callback });
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
