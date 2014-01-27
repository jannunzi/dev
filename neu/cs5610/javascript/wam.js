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
            height: Math.abs(fromTop - toTop),
            width: fromWidth > toWidth ? fromWidth / 2 + state.level * 50 : toWidth / 2 + state.level * 50,
            zIndex: -1
        }).addClass("wam-border-no-left");

    $("body").append(gotoDiv);

    toDiv.find(".wam-right").show();

    state.level++;
    $(this).data("gotoRendererState", state);
}
