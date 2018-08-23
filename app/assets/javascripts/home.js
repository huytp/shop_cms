(function() {
  $(document).ready(function() {
    init();
  });
  var init = function () {
    rollMenu();
  }

  var rollMenu = function() {
     $(window).scroll(function(e) {
      if($(this).scrollTop()>=110){
        $('.page-head .navbar-inverse').addClass('sticky');
        $('.page-head .navbar-inverse').removeClass('shop-menu-main');
      }else{
        $('.page-head .navbar-inverse').removeClass('sticky');
        $('.page-head .navbar-inverse').addClass('shop-menu-main');
      }
    });
  }

}).call(this);
