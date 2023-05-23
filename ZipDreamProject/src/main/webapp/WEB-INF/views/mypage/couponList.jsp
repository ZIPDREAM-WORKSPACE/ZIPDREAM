<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	div{
		/* border: 1px solid red; */
	}
	.contentWrap{
		padding-top: 30px;
		width: 100%;
		height: 509px;
	}
	.coupon{
		display: inline-flex;
		justify-content: center;
		flex-direction: column;
   		align-items: center;
		width: 200px;
		height: 150px;
		background-color: #EEF1FF;
		border-radius: 10px;
		margin: 20px;
		line-height: 18px;
		cursor: pointer;
	}
	.couponWrap{
		position: absolute;
		left: 460px;
	}
	.coupon_img{
		margin: 15px 0px 10px 0px;
	}
	.coupon>p{
		font-weight: 900;
		color:#B799FF;
	}
	.coupon_name{
		font-size:1.5rem;
	}
	
/*모달창*/
     #modal.modal-overlay {
         width: 100%;
         height: 100%;
         position: absolute;
         left: 0;
         top: 0;
         display: flex;
         flex-direction: column;
         align-items: center;
         justify-content: center;
         background: rgba(255, 255, 255, 0.25);
         box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
         backdrop-filter: blur(1.5px);
         -webkit-backdrop-filter: blur(1.5px);
         border-radius: 10px;
         border: 1px solid rgba(255, 255, 255, 0.18);
     }
     #modal .modal-window {
         /* background: rgba( 69, 139, 197, 0.70 ); */            
         backdrop-filter: blur( 13.5px );
         -webkit-backdrop-filter: blur( 13.5px );
         border-radius: 10px;
         width: 700px;
         position: relative;
         top: -100px;
         padding: 10px;
     }
     #modal .title {
         padding-left: 10px;
         display: inline;
         text-shadow: 1px 1px 2px gray;
         color: white;
         
     }
     #modal .title h2 {
         display: inline;
     }
     #modal .close-area {
         display: inline;
         float: right;
         padding-right: 10px;
         cursor: pointer;
         text-shadow: 1px 1px 2px gray;
         color: white;
     }
     
     #modal .content {
         margin-top: 20px;
         padding: 0px 10px;
         text-shadow: 1px 1px 2px gray;
         color: white;
     }
     /*모달 css*/
     .seller_contect_modal, .seller_contect_modal2, .finish_apply{
         border: 1px solid  black;
         width: 70%;
         margin: 0 auto;
         display: flex;
         flex-direction: column;
         justify-content: center;
         align-items: center;
         background-color: #EEF1FF;
     }
     .seller_contect_modal{
         height: 26rem;
     }
     .radius{
         border-radius: 30px;
     }
     .modal_header1{
         height: 20%;
         text-align: center;
     }
     .modal_header1>p{
         font-size: 2rem;
         font-weight: 900;
     }
     .modal_header2{
         margin-top: 35px;
         font-size: 0.8rem;
         line-height: 5px;
         height: 15%;
         text-align: center;
     }
     .modal_body{
     	 margin-top:25px;
         height: 25%;
         text-align: center;
         font-weight: 600;
         line-height: 10px;
     }
     .modal_footer{
         height: 5%;
         margin-top:25px;
         
     }
   	 .hr{
   	 	width:350px;
   	 	border:1px solid gray;
   	 }
   	 .no{
   	 	margin-right: 30px;
   	 }

</style>
</head>
<body>
	<jsp:include page="mypage.jsp"/>
	<div class="contentWrap">
		<div class="couponWrap">
			<div class="coupon">
				<img class="coupon_img" src="https://ifh.cc/g/XDbNvq.png" width="80px" height="50px">
				<p class="coupon_name">첫 가입</p>
				<p class="coupon_content">중개보수 10%할인<p>
			</div>
			<div class="coupon">
				<img class="coupon_img" src="https://ifh.cc/g/XDbNvq.png" width="80px" height="50px">
				<p class="coupon_name">5월 이벤트</p>
				<p class="coupon_content">중개보수 5%할인</p>
			</div>
			<div class="coupon">
				<img class="coupon_img" src="https://ifh.cc/g/XDbNvq.png" width="80px" height="50px">
				<p class="coupon_name">생일 이벤트</p>
				<p class="coupon_content">중개보수 15%할인</p>
			</div>
			<div class="coupon">
				<img class="coupon_img" src="https://ifh.cc/g/XDbNvq.png" width="80px" height="50px">
				<p class="coupon_name">새해 복 많이</p>
				<p class="coupon_content">중개보수 10%할인</p>
			</div>
		</div>
	</div>
	
	   <div id="modal" class="modal-overlay" style="display:none;">
        <div class="modal-window">
            <div class="seller_contect_modal radius" > 
                <div class="modal_header1">
                    <img src="https://ifh.cc/g/XDbNvq.png" width="80px" height="50px" style="vertical-align: bottom;">
                    <p class="coupon_name">첫 가입 10%할인 쿠폰</p>
                </div>
                <div class="modal_header2">
                    <p>해당 쿠폰을 사용하실 경우,</p>
                    <p>중개보수비용의 10%를 할인받을 수 있습니다.</p>
                <hr class="hr">
                </div>
                <div class="modal_body">
                    <p id="copon_advice">쿠폰 사용을 원하실 경우</p>
                    <p id="copon_advice"">담당 공인중개사의 코드를 입력하고 사용하기를 눌러주세요</p>
                    <input type="text" placeholder="공인중개사 코드 입력" size="20">
                </div>
                <div class="modal_footer">
                    <input type="button" class="no" value="사용안함">
                    <input type="button" class="okay" value="사용하기">
                </div>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
<script type="text/javascript">
$(function(){
	$(".coupon").on("click",function(){
		$(".modal-overlay").show();
	})
	
	$(".no, .okay").on("click", function(){
		$(".modal-overlay").hide();
	})
})
</script>
</html>