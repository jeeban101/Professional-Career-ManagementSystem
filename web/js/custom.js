    new WOW().init();

(function ($) {

   'use strict';

    /*
     * ----------------------------------------------------------------------------------------
     *  SMOTH SCROOL JS
     * ----------------------------------------------------------------------------------------
     */

    $('a.smoth-scroll').on('click', function (e) {
        var anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $(anchor.attr('href')).offset().top - 50
        }, 1000);
        e.preventDefault();
    });



    /* ==========================================================================
      COUNTER UP 
 ========================================================================== */

    $('.counter').counterUp({
        delay: 10,
        time: 1000
    });

    $('.carousel').carousel({
      interval: 8000
    });
    
    /* Closes the Responsive Menu on Menu Item Click*/
    $('.navbar-collapse .navbar-nav a').on('click', function () {
        $('.navbar-toggler:visible').click();
    });
    /*END MENU JS*/

    
    /* ----------------------------------------------------------- */
    /*  Fixed header
    /* ----------------------------------------------------------- */


    $(window).on('scroll', function () {
        if ($(window).scrollTop() > 70) {
            $('.site-navigation,.trans-navigation').addClass('header-white');
        } else {
            $('.site-navigation,.trans-navigation').removeClass('header-white');
        }



    });


    /* ==========================================================================
      SCROLL SPY
 ========================================================================== */

    $('body').scrollspy({
        target: '.navbar-collapse',
        offset: 195
    });






          /*START GOOGLE MAP*/
          function initialize() {
            var mapOptions = {
              zoom: 15,
              scrollwheel: false,
              center: new google.maps.LatLng(40.7127837, -74.00594130000002)
            };
            var map = new google.maps.Map(document.getElementById('map'),
                mapOptions);
            var marker = new google.maps.Marker({
              position: map.getCenter(),
              icon: 'assets/img/map_pin.png',
              map: map
            });
          }
          google.maps.event.addDomListener(window, 'load', initialize);	
          /*END GOOGLE MAP*/	


})(window.jQuery);