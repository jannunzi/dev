var f360 = {
    templates: {
        trips: null,
        fish : null
    },
    state : {
        login: {
            guid : null
        }
    },
    environment : "dev",
    constants: {
        dev: {
            baseUrl: "http://localhost:50465/"
        },
        prod: {
            baseUrl: "http://fish360.azurewebsites.net/"
        },
    },
    model : {},
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
        trip: {
            GetTripForId : function(id, callback) {
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
    }
}
f360.baseUrl = f360.constants[f360.environment].baseUrl;
