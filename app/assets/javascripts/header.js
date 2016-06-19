$(document).ready(function(){
    $(".menu-btn-o").click(function(){
        $(".mobile-menu").animate({left : "0px"});
        $(".menu-btn-o").hide();
        $(".menu-btn-c").show();
    });
    $(".menu-btn-c").click(function(){
       $(".mobile-menu").animate({left: "-60.8%"});
       $(".menu-btn-c").hide();
       $(".menu-btn-o").show();
    });
})

