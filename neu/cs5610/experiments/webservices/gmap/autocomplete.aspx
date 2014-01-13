<!DOCTYPE html>
<html>
    <head>
        <title>Google Maps Autocomplete</title>
        <style>
            .attribute {
                display : inline-block;
                width : 200px;
                text-transform : capitalize;
            }
            #attributes {
                display: none;
            }
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
        <script src="../../pure/pure.js"></script>
    </head>
    <body>
        <h2>Search Location</h2>
        <input type="text" id="address" style="width: 500px;"></input>

        <h2>Google Map Results</h2>
        <ul id="attributes">
            <li>
                <span class="attribute"></span><span class="value"></span>
            </li>
        </ul>

        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-US"></script>

        <script>
            var autocomplete = new google.maps.places.Autocomplete($("#address")[0], {});

            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                var place = autocomplete.getPlace();
                console.log(place.address_components);
                var directive = {
                    "li": {
                        "component<-address_components": {
                            ".attribute": function () {
                                var type = this.types[0];
                                type = type.replace(/_/g, " ");
                                return type;
                            },
                            ".value" : "component.long_name"
                        }
                    }
                }
                $("#attributes").show();
                var lis = $('#attributes li');
                for (var li = 0; li < lis.length; li++) {
                    if (li == 0) continue;
                    $(lis[li]).remove();
                }
                $('#attributes').render({ 'address_components': place.address_components }, directive);
            });
        </script>
    </body>
</html>