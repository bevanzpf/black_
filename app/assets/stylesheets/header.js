$(document).ready(function(){
    $(".menu-btn").click(function(){
        if($(".left") != null){
                $(".mobile-menu").animate({left : "0px"});
                $(".mobile-menu").removeClass("left");
        }else{
            $(".mobile-menu").animate({left: "-60.8%"});
            $(".mobile-menu").addClass("left");
        }
    })
})
