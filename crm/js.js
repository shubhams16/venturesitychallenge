$("#block1").click(function () {
    $('html, body').animate({
        scrollTop: $("#content2").offset().top
    }, 2000);
});