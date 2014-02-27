var f360 = {
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
        user: {
            name: 'UserService',
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
    }
}
f360.baseUrl = f360.constants[f360.environment].baseUrl;
