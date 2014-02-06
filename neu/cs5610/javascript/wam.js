function renderBox(id, content) {
    var html = '<div class="wam-cb wam-top" id="40">' +
        '<div class="wam-left"><span class="wam-arrow">&#9658;</span></div>' +
        '<div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>' +
        '<div class="wam-top"><span class="wam-arrow">&#9660;</span></div>' +
        '<div class="wam-right"><span class="wam-arrow">&#9668;</span></div>' +
        '<div class="wam-content">' +
        'Text' +
        '</div>' +
        '</div>';
    var dom = $(html);
    dom.attr("id", id);
    dom.find(".wam-content").html(content);

    var scriptDom = $(".wam-script");
    scriptDom.append(dom);
}

function renderDownArrow() {
    var html = '<div class="wam-line-vertical-middle wam-height-50"></div>';
    var dom = $(html);

    var scriptDom = $(".wam-script");
    scriptDom.append(dom);
}

function gotoRenderer(from, to) {

    var state = $(this).data("gotoRendererState");
    if (typeof state === "undefined") {
        state = { level: 1 };
        $(this).data("gotoRendererState", state);
    }

    fromDiv = $("#" + from);
    fromHeight = fromDiv.outerHeight();
    fromWidth = fromDiv.outerWidth();
    fromPosition = fromDiv.offset();
    fromLeft = fromPosition.left;
    fromTop = fromPosition.top;

    toDiv = $("#" + to);
    toHeight = toDiv.outerHeight();
    toWidth = toDiv.outerWidth();
    toPosition = toDiv.offset();
    toLeft = toPosition.left;
    toTop = toPosition.top;

    gotoDiv = $("<div>").
        css({
            position: "absolute",
            top: fromTop > toTop ? toTop + toHeight / 2 : fromTop + fromHeight / 2,
            left: fromLeft + fromWidth / 2,
            height: Math.abs(fromTop - toTop) + 3,
            width: fromWidth > toWidth ? fromWidth / 2 + state.level * 50 : toWidth / 2 + state.level * 50,
            zIndex: -1
        }).addClass("wam-border-no-left");

    $("body").append(gotoDiv);

    toDiv.find(".wam-right").show();

    state.level++;
    $(this).data("gotoRendererState", state);
}

$(wamInit);

function wamInit() {
    $(".wam-draggable").draggable();
    $(".wam-resizable").resizable();
}

function renderObject(options) {
    for (var key in options.object) {
        var selector = "." + key;
        options.dom.find(selector).val(options.object[key]);
    }
}

/**
 *  @deprecated
 *
 *  Renders a collection into a DOM container
 *  @param options.collection is an array of objects
 *  @param options.template   jQuery element to be used a template.
 *                            can include classes for selecting and
 *                            populating copies of the template filled
 *                            with the data from the objects in the collection
 *  @param options.container  jQuery element that contains the copies of the template
 */
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
                } else if (options.mapping[key] === "id") {
                    template.attr("id", options.collection[i][key]);
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
            } else if (options.mapping[key] === "id") {
                template.find(selector)
                    .attr("id", options.collection[i][key]);
            } else {
                template.find(selector)
                    .html(options.collection[i][key])
                    .val(options.collection[i][key]);
            }

        }
        options.container.append(template);
    }
}

/**
 *  Renders a collection into a DOM container
 *  @param options.collection is an array of objects
 *  @param options.template   jQuery element to be used a template.
 *                            can include classes for selecting and
 *                            populating copies of the template filled
 *                            with the data from the objects in the collection
 *  @param options.container  jQuery element that contains the copies of the template
 */
function renderCollection(options) {
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
                } else if (options.mapping[key] === "id") {
                    template.attr("id", options.collection[i][key]);
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
            } else if (options.mapping[key] === "id") {
                template.find(selector)
                    .attr("id", options.collection[i][key]);
            } else {
                template.find(selector)
                    .html(options.collection[i][key])
                    .val(options.collection[i][key]);
            }

        }
        options.container.append(template);
    }
}

function stripOutTime(dateTime) {
    if (dateTime === null || dateTime.indexOf(" ") === -1)
        return dateTime;
    return dateTime.substring(0, dateTime.indexOf(" "));
}