var wam = {
    state : {},
    dom : {},
    init: function () {
        wam.user.init();
        this.application.init();

        this.user.dom.loginSection.show();
    },
    controllers: {
    }
}