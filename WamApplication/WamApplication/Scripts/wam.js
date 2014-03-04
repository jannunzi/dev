var wam = {
    init: function () {
        wam.user.init();
        this.dom.init();
        this.controllers.init();
        this.services.init();
        this.state.init();
//        this.application.init();
  //      this.user.dom.loginSection.show();
    },
    dom: {
        init: function () {
            this.pages = $(".wam-page");
        },
        pages: null
    },
    controllers: {
        init: function () {
        }
    },
    services : {
        init:function(){}
    },
    state: {
        init:function(){}
    }
}