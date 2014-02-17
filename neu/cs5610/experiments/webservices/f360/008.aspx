<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
</head>
<body>
    <div class="container">

        <h1>Fishing Trip Web Service</h1>

        <div class="row">
            <div class="col-xs-8">

                <h2>Get All Trips for Username</h2>

                <a  href="http://dev.fish360.net/autotideapp/services/GetAllFishingTripsForUser.php?username=jsilva"
                    target="_blank">http://dev.fish360.net/autotideapp/services/GetAllFishingTripsForUser.php?username=jsilva</a>

                <div class="input-group">
                  <input type="text" class="form-control wam-username" value="jsilva" />
                  <span class="input-group-btn">
                    <button class="wam-go btn btn-primary" type="button">Search</button>
                  </span>
                </div>

                <h2>Result Set Drop Down</h2>

                <select class="wam-result-set form-control" name="wam-trips">
                </select>

            </div>
        </div>
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
        $(function () {

            // jQuery Cache
            var jqCache = {};
            jqCache.username = $(".wam-username");
            jqCache.resultSet = $(".wam-result-set");

            // event handlers
            $(".wam-go").click(goEventHandler);

            function goEventHandler() {
                var username = jqCache.username.val();
                $.ajax({
                    url: "http://dev.fish360.net/autotideapp/services/GetAllFishingTripsForUser.php",
                    data: { username: username },
                    dataType: "jsonp",
                    success: function (response) {
                        renderResultSet({
                            container : $(".wam-result-set"),
                            template  : $('<option class="nid title"></option>'),
                            collection: response,
                            mapping: {nid : "value", title:"html"}
                        })
                    }
                });
            }
            function renderResultSet(options) {
                options.container.empty();
                if (typeof options.mapping === "undefined") {
                    options.mapping = {};
                }
                for (var i = 0; i < options.collection.length; i++) {
                    var template = options.template.clone();
                    for (var key in options.collection[i]) {
                        var selector = "." + key;
                        if (template.hasClass(key)) {
                            if (options.mapping[key] === "value") {
                                template.val(options.collection[i][key]);
                            } else if (options.mapping[key] === "html") {
                                template.html(options.collection[i][key]);
                            } else {
                                template
                                    .html(options.collection[i][key])
                                    .val(options.collection[i][key]);
                            }
                        }
                        if (options.mapping[key] === "value") {
                            template.find(selector)
                                .val(options.collection[i][key]);
                        } else if (options.mapping[key] === "html") {
                            template.find(selector)
                                .html(options.collection[i][key]);
                        } else {
                            template.find(selector)
                                .html(options.collection[i][key])
                                .val(options.collection[i][key]);
                        }

                    }
                    options.container.append(template);
                }
            }
        });
    </script>
</body>
</html>
