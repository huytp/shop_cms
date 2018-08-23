(function() {
  $(document).ready(function() {
    init();
  });
  var init = function () {
    projectSlider();
  }

  var projectSlider = function() {
    $(window).load(function() {
      $('#carousel').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        itemWidth: 157,
        itemMargin: 5,
        asNavFor: '#slider'
      });

      $('#slider').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        sync: "#carousel"
      });
    });
  }

}).call(this);
