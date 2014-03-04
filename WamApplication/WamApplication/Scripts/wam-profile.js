wam.profile = {
    init: function () {

    },
    show: function () {
        wam.dom.pages.hide(); // hide all pages
        this.dom.page.show(); // show this page
    },
    dom: {
        page: null,
        init: function () {
            this.page = $(".wam-page-profile");
        }
    }
}