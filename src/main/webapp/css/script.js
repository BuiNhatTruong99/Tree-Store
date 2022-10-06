$('.slider').owlCarousel({
    loop: true,
    margin: 0,
    nav: true,
    autoplay: true,
    autoplayTimeout: 4000,
    animateOut: 'fadeOut',
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 1
        },
        1000: {
            items: 1
        }
    }
})
$('.owl-loaded').owlCarousel({
    loop: true,
    margin: 10,
    dots: false,
    nav: true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 3
        },
        1000: {
            items: 3
        }
    }
})


$(document).ready(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop()) {
            $('.sticky-header').addClass('sticky');
        } else {
            $('.sticky-header').removeClass('sticky');
        }
    })
})

$('.shop-btn').click(function () {
    $('nav .offcanvas_main_menu .shop-show').toggleClass("show");
})
$('.blog-btn').click(function () {
    $('nav .offcanvas_main_menu .blog-show').toggleClass("show");
})
$('.pages-btn').click(function () {
    $('nav .offcanvas_main_menu .pages-show').toggleClass("show");
})
$('.shop-lay-btn').click(function () {
    $('nav .offcanvas_main_menu .lay-show').toggleClass("show");
})
$('.shop-other-btn').click(function () {
    $('nav .offcanvas_main_menu .other-show').toggleClass("show");
})
$('.shop-pro-btn').click(function () {
    $('nav .offcanvas_main_menu .pro-show').toggleClass("show");
})

$('.mini_cart_wrapper').click(function () {
    $('.mini_cart').addClass("active");
})

$('.mini_cart_close').click(function () {
    $('.mini_cart').toggleClass("active");
})