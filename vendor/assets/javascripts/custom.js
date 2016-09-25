    // Preloader

    $(window).load(function() {
      $("#loader .icon").fadeOut();
      $("#loader").fadeOut("slow");    

    }); 
  

    // Scroll to top

    $(window).scroll(function() {
        if ($(this).scrollTop() > 300) {
            $('.scroll-top').fadeIn();
        } else {
            $('.scroll-top').fadeOut();
        }

    });

 
$(document).ready(function(){

    // Search

    $('#search-icon a, .fa-times').click(function () {
        $('.search-box').animate({height: 'toggle'}, 300);
    });      

    // Navbar scroll in landscape

    $(window).resize(function() {
        $(".navbar-collapse").css({ maxHeight: $(window).height() - $(".navbar-header").height() + "px" });
    }); 

    // Smooth Page Scrolling

    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
          $('html, body').stop().animate({
              scrollTop: $($anchor.attr('href')).offset().top
            }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });

    // Dropdown On Hover

    $('ul.nav li.dropdown').hover(function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(200);
    }, function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(200);
    });  
    

    // Portfolio sorting

    $('#portfolio-items').mixItUp();     

    // Animation reveal on scroll

    new WOW().init();   

    // Header Slider

    $('#slides').superslides({
        play: 5000,
        animation: 'fade', // slide, fade
        animation_speed: 2000,
        pagination: true,
        hashchange: false,
        scrollable: true
    });    

    // News Ticker

    $('.newsticker').newsTicker({
        row_height: 25,
        max_rows: 1,
        speed: 500,
        direction: 'down',
        duration: 3000,
        autostart: 1,
        pauseOnHover: 0
    });

    // Skills Progress Bar

    $(".progress .progress-bar").appear(function () {
        $('.progress .progress-bar').progressbar();
    });    

    // Smooth Page Scrolling requires - Jquery Easing

    jQuery('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
          $('html, body').stop().animate({
              scrollTop: $($anchor.attr('href')).offset().top
            }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });     

    // Reviews slider

    $("#reviews-slider").owlCarousel({
        items : 2,
        itemsDesktop : [1199,2],
        itemsDesktopSmall : [979,1],
        itemsTablet: [600,1],
        itemsMobile : [479,1],
        slideSpeed : 800,
        mouseDrag: false,
        pagination : true,
        navigation: false,        
        autoPlay : false        
    }); 

    // Clients slider

    jQuery("#clients-slider").owlCarousel({
        items : 4,
        itemsDesktop : [1199,4],
        itemsDesktopSmall : [979,3],
        itemsTablet: [600,2],
        itemsMobile : [479,1],
        slideSpeed : 400,
        mouseDrag: false,
        pagination : false,       
        autoPlay : true        
    }); 

    // Latest projects slider

    jQuery("#latest-projects").owlCarousel({
        items : 4,
        itemsDesktop : [1199,4],
        itemsDesktopSmall : [979,3],
        itemsTablet: [600,1],
        itemsMobile : [479,1],
        slideSpeed : 800,
        mouseDrag: false,
        pagination : true,
        navigation: false,        
        autoPlay : false        
    });           

    // Facts counter
    
    $('.counter').counterUp({
        delay: 10,
        time: 3000
    }); 

    // Video Popup

    $('.video').magnificPopup({
        disableOn: 200,
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: false,
        fixedContentPos: false
    });

    // Team slider

    $("#team-slider").owlCarousel({
        items : 3,
        itemsDesktop : [1199,3],
        itemsDesktopSmall : [979,2],
        itemsTablet: [600,1],
        itemsMobile : [479,1],
        slideSpeed : 800,
        mouseDrag: false,
        pagination : true,
        navigation: false,        
        autoPlay : false        
    });  

    // Newsletter  

    $('#mc-form').ajaxChimp({
        callback: mailchimpCallback,
        url: "http://coderscore.us10.list-manage.com/subscribe/post?u=15bc64c58895fffafdf3625f2&amp;id=5c97783c3f" //Replace this with your own mailchimp post URL. Don't remove the "". Just paste the url inside "".  
    });

    function mailchimpCallback(resp) {
         if (resp.result === 'success') {

            // Requires jQuery Toast Plugin

            $.toast({
                heading: 'Success',
                text: 'You have successfully subscribed, please confirm your email.',
                showHideTransition: 'fade',
                icon: 'success',
                hideAfter: 5000, 
            })
            
        } else if(resp.result === 'error') {
            $.toast({
                heading: 'Error',
                text: 'Subscription failed! Please try again.',
                showHideTransition: 'fade',
                icon: 'error',
                hideAfter: 5000, 
            })
        }  
    }


    // Google map

    if( $('#map').length ) {
        
        var map;

        map = new GMaps({
            el: '#map',
            lat: 51.524527,
            lng: -0.0738419
        });

        map.addMarker({
            lat: 51.524527,
            lng: -0.0738419
        });
    }

    // Contact form

    $('#contact-form').validator();

        $('#contact-form').on('submit', function (e) {
            if (!e.isDefaultPrevented()) {
                var url = "assets/email.php";

                $.ajax({
                    type: "POST",
                    url: url,
                    data: $(this).serialize(),
                    success: function (data)
                    {
                        var messageAlert = 'alert-' + data.type;
                        var messageText = data.message;

                        var alertBox = '<div class="alert ' + messageAlert + ' alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + messageText + '</div>';
                        if (messageAlert && messageText) {
                            $('#contact-form').find('.messages').html(alertBox);
                            $('#contact-form')[0].reset();
                        }
                    }
                });
                return false;
            }
        })      

    
});