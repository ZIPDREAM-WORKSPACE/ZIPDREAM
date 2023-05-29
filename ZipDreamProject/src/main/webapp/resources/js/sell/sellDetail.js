/**
 * 
 */
 $(function(){
    $(".market").on("click", function(){
    	$(".market").css({"background-color":"#0A2647", "color":"white", "font-weight":"900"});
    	$(".market>img").attr("src","https://ifh.cc/g/zF1Glv.png");
        $(".market_info").show();
        $(".subway_info").hide();
        $(".school_info").hide();
        $(".hospital_info").hide();
    })
    $(".subway").on("click", function(){
    	
        $(".market_info").hide();
        $(".subway_info").show();
        $(".school_info").hide();
        $(".hospital_info").hide();
    })
    $(".hospital").on("click", function(){
        $(".market_info").hide();
        $(".subway_info").hide();
        $(".school_info").hide();
        $(".hospital_info").show();
    })
    $(".school").on("click", function(){
        $(".market_info").hide();
        $(".subway_info").hide();
        $(".school_info").show();
        $(".hospital_info").hide();
    })
})

$(function(){
    $(".contect").on("click",function(){
        $(".modal-overlay").show();
        $(".seller_contect_modal").show();
    })
    $(".apply").on("click",function(){
        $(".seller_contect_modal").hide();
        $(".seller_contect_modal2").show();
    })
    $(".meet, .untact").on("click",function(){
        $(".seller_contect_modal").hide();
        $(".seller_contect_modal2").hide();
        $(".finish_apply").show();
    })
    $(".close_apply").on("click",function(){
        $(".seller_contect_modal").hide();
        $(".seller_contect_modal2").hide();
        $(".finish_apply").hide();
        $(".modal-overlay").hide();
    })
})

$(function() {
	$(".right").on("click",function() {
		$(".picture_two").show();
		$(".picture_one").hide();
		$(".left").show();
		$(".right").hide();
	})
	$(".left").on("click",function() {
		$(".picture_one").show();
		$(".picture_two").hide();
		$(".right").show();
		$(".left").hide();
	})
})

