
$(document).ready(function() {
    $(".sub_menu").hide();

    $(".top_menu > li").on("mouseover", function() {
        $(this).children(".sub_menu").stop().slideDown();
    });
    $(".top_menu > li").on("mouseleave", function() {
        $(this).children(".sub_menu").stop().slideUp();
    });
});

