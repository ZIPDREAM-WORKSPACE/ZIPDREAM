<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>



.s_image {
	width: 100%;
	height: 700px;
	object-fit: cover;
}


.slider {
	position: relative;
	width: 40%;
	margin: auto;
}



.slider .slick-list,  .news_slider .slick-list{
	margin: 0 -20px;
}

.slider .slick-slide, .news_slider .slick-slide{
	margin: 0 20px;
}

.notice_list {
	height: 300px;
	background: rgb(245, 245, 234);
	border-radius: 10px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	color: black;
	position: relative;
	margin-bottom: 20px;
	cursor: pointer;
}

.news {
	height: 300px;
	background: rgb(236, 236, 236);
	color: black;
	margin-bottom: 20px;
	cursor: pointer;
	position: relative;
	padding: 10px 20px 5px 20px;
}

.news:after {
	z-index: -1;
	position: absolute;
	content: "";
	bottom: 15px;
	right: 10px;
	left: auto;
	width: 50%;
	top: 80%;
	max-width: 400px;
	background: #777;
	-webkit-box-shadow: 0 15px 10px #777;
	-moz-box-shadow: 0 15px 10px #777;
	box-shadow: 0 15px 10px #777;
	-webkit-transform: rotate(3deg);
	-moz-transform: rotate(3deg);
	-o-transform: rotate(3deg);
	-ms-transform: rotate(3deg);
	transform: rotate(3deg);
}

.nlist_inner, .news_inner {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
}

.nlist, .news_list {
	position: relative;
	width: 100%;
	height: 100%;
}

.notice_text {
	width: 100%;
	height: 400px;
	margin: auto;
	text-align: center;
	line-height: 400px;
	font-size: 35px;
	font-weight: 600;
	color: #1F4B6B;
}

.nlist_text {
	text-align: center;
	height: 300px;
	width: 100%;
	padding-left: 20px;
	padding-right: 20px;
	font-weight: 600;
	position: absolute;
	top: 30%;
}

.pin {
	position: absolute;
	right: 10px;
	top: 5px;
	width: 20px;
	height: 20px;
}

.main_ad {
	position: relative;
	cursor: grab;
}

.main_text {
	width:100%;
	position: absolute;
	text-align:center;
	top:30%;
	color: white;
	font-weight: 600;
	font-size:45px;
}
.main_text2 {
	width:100%;
	position: absolute;
	text-align:center;
	top:40%;
	color: white;
	font-weight: 400;
	font-size:23px;
}

.search {
	margin-top: 150px;
	height: 400px;
	width: 100%;
	background-color: #1F4B6B;
}

#s_top {
	height: 200px;
	line-height: 250px;
	width: 100%;
	color: white;
	margin: auto;
	text-align: center;
	font-size: 35px;
	font-weight: 600;
}

#s_bottom {
	width: 50%;
	height: 50px;
	background: #FFFFFF;
	box-shadow: inset 0px 4px 12px rgba(0, 0, 0, 0.75);
	border-radius: 50px;
	margin: auto;
}

#s_text {
	width: 90%;
	margin: auto;
}

#s_icon {
	width: 10%;
	align: right;
}

#s_input {
	width: 100%;
	border: none;
}

#s_input:focus {
	outline: none;
	!
	important;
}

#s_bottom_inner>div {
	float: left;
	height: 90%;
}

#s_bottom_inner {
	width: 90%;
	height: 70%;
	padding-top: 14px;
	margin: auto;
	position: relative;
}

#s_icon_image {
	width: 26px;
	height: 27px;
	position: absolute;
	top: 14px;
	right: 0px;
}

@media only screen and (max-width: 900px) {
	#s_bottom {
		width: 80%;
		height: 50px;
		background: #FFFFFF;
		box-shadow: inset 0px 4px 12px rgba(0, 0, 0, 0.75);
		border-radius: 50px;
		margin: auto;
	}
}



.news_title {
	font-weight: 600;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	font-size: 20px;
}


.news_content{
	padding:5px 0px 5px 0px;
	display: flex;
	height:70%;
	width: 100%;
	justify-content: center;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	text-align: left;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 8;
	-webkit-box-orient: vertical;
	
}
.news_image{
	height:100%;
	width:48%;
	margin-right:2%;
}
.news_image>img{
	height:100%;
	width:100%;
	object-fit:cover;
}
.news_name{
	font-size:12px;
	text-align: right;
	color:grey;
}
.hr_color{
	background: grey;
	padding:0;
	margin-top:9px;
	margin-bottom:9px;
}
#more{
	width:40%;
	height:30px;
	text-align:right;
	margin: auto;
	cursor: pointer;
}
@keyframes move {
  0% {
    margin-left: 1px;
  }
  50% {
    margin-left: 6px;
  }
  100% {
    margin-left: 1px;
  }
}
#more_text{
	width:50px;
	height:26px;
	position: relative;
	color:black;
	
}
#more_text:hover{
	text-decoration: none;
}

#arrow{
	position:absolute;
	width:18px;
	height:18px;
	margin-top: 3px;
	margin-left:5px;
	 animation: move 0.7s ease-in-out infinite;
}




@media only screen and (max-width: 1200px) {
	.main_ad_inner{
	
	height:700px;
	width:55%;
	margin: auto;
	display: block;
	align-items:center;
	
	}
	.main_ad_text{
	height:500px;
	width:100%;
	padding-top:15%;
	
	}
	#main_ad3{
		height:550px;
	width:100%;
	padding-top:15%;
	}
	
	.main_ad_text>h1{
		font-weight: 600;
		
	}
	.mImage>img{
		width:100%;
		height:100%;
		object-fit:cover;
	}
	.mImage{
		width:100%;
		height:100%;
	}
	.main_ad_image{
		width:100%;
		height:40%;
		background: black;
		box-shadow: rgba(17, 17, 26, 0.1) 0px 8px 24px, rgba(17, 17, 26, 0.1) 0px 16px 56px, rgba(17, 17, 26, 0.1) 0px 24px 80px;
	}
	.main_ad2{
		height:900px;
		width:100%;
		background: #F4F9FF;
		
	}
		#main_ad2{
		height:770px;
		width:100%;
		background: #F4F9FF;
		padding-top:70px;
		
	}
		.news_slider{
		
		position: relative;
		width:50%;
		margin: auto;
	
	}

}


@media only screen and (min-width: 1200px) {
.news2{
	margin-top:50%;
}
	.main_ad2{
		height:700px;
		width:100%;
		background: #F4F9FF;
		
	}
		.main_ad_inner{
		
		height:700px;
		width:55%;
		margin: auto;
		display: flex;
		align-items:center;
		
		}
		.main_ad_text{
		height:700px;
		width:50%;
		padding-top:15%;
		
	}
	.main_ad_text>h1{
		font-weight: 600;
		
	}
	.mImage>img{
		width:100%;
		height:100%;
		object-fit:cover;
	}
	.mImage{
		width:100%;
		height:100%;
	}
	.main_ad_image{
		width:50%;
		height:40%;
		background: black;
		box-shadow: rgba(17, 17, 26, 0.1) 0px 8px 24px, rgba(17, 17, 26, 0.1) 0px 16px 56px, rgba(17, 17, 26, 0.1) 0px 24px 80px;
	}
	.news_slider{
		
		position: relative;
		width:80%;
		margin: auto;
	
	}


}

.more_btn{
	height:45px;
	width:135px;
	border: 3px solid black;
	font-weight: 600;
	border-radius: 30px;
	text-align: center;
	font-size:20px;
	cursor: pointer;
	padding-top:5px;
	background: white;
}
.more_btn:hover{
	border: 3px solid rgb(169, 192, 212);
	color:rgb(169, 192, 212);
	transition : 0.2s;
}

.main_h5{
	color:rgb(62, 44, 168);
}
.main_login{
	height:500px;
	width:100%;
	background: black;
	color:white;
}
.login_inner{
	width:100%;
	height:150px;
	margin: auto;
	text-align: center;
	padding-top:80px;
}
#login_btn{
	height:45px;
	width:135px;
	border: 3px solid white;
	font-weight: 600;
	border-radius: 30px;
	text-align: center;
	font-size:20px;
	cursor: pointer;
	padding-top:5px;
	color:white;
	margin: auto;
}
#login_btn:hover{
		border: 3px solid rgb(56, 28, 211);
	color:rgb(56, 28, 211);
	transition : 0.2s;
}
#login_ani{
	height:100px;
	width:135px;
	margin: auto;
	text-align: center;
	margin-bottom: 50px;
	
}
.s1_arrow{display:inline-block; position:relative; top:28px; text-align:center; animation:arrow_down 1.5s infinite;}
.scroll-arrow {width:20px; height:20px; border-right: 3px solid white; border-bottom: 3px solid white;
transform: rotate(45deg); -webkit-transform: rotate(45deg); -moz-transform: rotate(45deg); -o-transform: rotate(45deg);  -ms-transform: rotate(45deg);
animation: arrow-wave 1s infinite; animation-direction: alternate;}
.scroll-arrow:nth-child(1) {animation-delay: 0.1s;}
.scroll-arrow:nth-child(2) {margin-top:6px; animation-delay: 0.2s;}
.scroll-arrow:nth-child(3) {margin-top:6px; animation-delay: 0.3s;}

@keyframes arrow-wave {
0% {opacity: 0;}
50% {opacity: .5;}
100% {opacity: 1;}
}
@keyframes arrow_down{
0%{top:28px;}
50%{top:40px;}
100%{top:28px;}
}
.text_size{
	font-weight: 600;
	font-size:35px;
}


.slick-arrow{
	width: 30px; 
	height:30px;
}

.notice .slick-prev:before , .notice .slick-next:before{
	color: black;
	font-size: 40px;
	padding-bottom:30px;
}

.notice .slick-prev {
	left:-65px;
}
.notice .slick-next, .notice .slick-prev{
	top:45%;
}
.notice .slick-next{
right:-45px;
}

#slider-div  .slick-dots li button:before{
	font-size:30px;

	
}

#slider-div .slick-dots li{
	margin: 0 30px;
}


.ad_image{
	width: 60px;
	height: 60px;
	object-fit:cover;
}
.chat{
	width:100px;
	height:100px;
	position: fixed;
	bottom:3%;
	right:3%;
	box-shadow:rgba(0, 0, 0, 0.16) 0px 3px 10px;
	border-radius: 50px;
	z-index: 98;
	text-align: center;
	font-weight: 500;
	background: white;
	padding-top:5px;
	font-size:20px;
	font-weight: 600;
	cursor: pointer;
}

.chat>img{
	width:60%;
	margin-left:5%;
	object-fit:cover;
	
}
.chatting{
	width:350px;
	height:600px;
	background: #D4E1EF;
	bottom:3%;
	right:3%;
	position: fixed;
	z-index: 99;
	border-radius: 10px;
	box-shadow:rgba(0, 0, 0, 0.16) 0px 3px 20px;
	display: none;
	
}
.chatting_inner{
	width:350px;
	height:450px;
	margin-top:75px;
	background: white;
	border-bottom:1px solid rgb(234, 234, 234);
	border-top:1px solid rgb(212, 212, 212);
	
}
.chat_header{
	position:absolute;
	top:25px;
	width: 100%;
	text-align: center;
	font-weight: 600;
}
.chat_header>img{
	width:17px;
	height:17px;
	margin-bottom:3px;
}
#x{
	position: absolute;
	right:13px;
	top:-10px;
	width:12px;
	height:12px;
	cursor: pointer;
	
}
.chat_bottom{
	width:90%;
	height:40px;
	background: white;
	border-radius: 30px;
	margin: auto;
	margin-top:17px;
	border : 1px solid grey;
	z-index: 99;
	
}
#chat_msg{
	margin-left:10px;
	margin-top:5px;
	border: none;
	width:260px;

}
#chat_msg:focus{
	outline: none; !important;
}
#send{
	width:30px;
	height:30px;
	cursor: pointer;
}
.modal-title{
	width:60%;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.modal-body{
box-sizing: border-box;
	overflow:auto;
}
#m_date{
 width:40%; 
 height:30px; 
 line-height:30px; 
 text-align:right;
}
.login_service, .chat_open{
	width:300px;
	height:50px;
	background: grey;
	text-align: center;
	margin: auto;
	line-height:50px;
	margin-top:50px;
	background: #1F4B6B;
	color:white;
	cursor:pointer;
	border-radius: 10px;
	 box-shadow: 0 3px 3px rgba(0,0,0,0.2);
}
.display-chatting{
		width: 100%;
		height: 450px;
		border : 1px solid black;
		overflow: auto;
		list-style : none;
		padding : 10px 10px;
		
	}
	   .myChat{
      text-align: right;
      margin-bottom: 5px;
   }
   .myChat > p {
      background-color :rgb(25, 83, 125);
      color:white;
   }

   .chatDate{
      font-size : 10px;
   }
	   .chatP{
      display : inline-block;
      border-radius : 5px;
      padding : 4px 8px 4px 8px;
      margin:0;
      max-width: 250px;
       overflow:hidden;
    word-wrap:break-word;
       text-align: left;
       box-shadow: 0 3px 3px rgba(0,0,0,0.2);
        background-color :rgb(242, 249, 254);
      
   }
   .display-chatting::-webkit-scrollbar-thumb{
background: grey;
    border-radius: 10px;
}
.display-chatting::-webkit-scrollbar{
width: 10px;  
}
.logoImage{
	height:110px;
	width:120px;
	opacity: 0;
	position: absolute;
	top:60%;
	transition: all 0.5s;
	
}
.nlist_inner:hover>.logoImage{
display:  block;
    opacity : 0.3;
     

}

.notice_list:hover{
	background: rgb(231, 231, 219);
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<div class="chat" ><img src='https://ifh.cc/g/mQ6LcQ.png' ><br>채팅</div>
	<div class="chatting">
		<div class="chat_header"><img id="x" class="x" src='https://ifh.cc/g/8wfDZb.png' ><img src='https://ifh.cc/g/YX6YxA.png'>&nbsp;&nbsp;운영자와의 채팅</div>
		<div class="chatting_inner">
			<c:choose>  	
				<c:when test="${empty sessionScope.loginUser}">
					<div class="login_service" >로그인 후 이용가능한 서비스입니다.</div>
				</c:when> 
				<c:otherwise> 
				
					<div class="chat_open" >운영자와 채팅하기</div>
					<ul class="display-chatting" style="display:none">
					</ul>
				</c:otherwise> 
			</c:choose> 
			
			
		 </div>
		 
		<div class="chat_bottom">
	
         
         <c:choose>  	
			<c:when test="${empty sessionScope.loginUser}">
				<input type="text" id="chat_msg" readonly></input>
			</c:when> 
			<c:otherwise> 
				<input type="text" id="chat_msg"></input>
			</c:otherwise> 
		</c:choose> 
		
		<img id="send" src='https://ifh.cc/g/FCqYra.png'></div>
	</div>
	
	
	<div style="padding: 0; background-color: white;">
		<div id="slider-div">
			<div class="main_ad">
				<img class="s_image" src="https://ifh.cc/g/WmqQ9P.jpg" border='0'>
				<div class="main_text " >집드림이 드리는 혜택</div>
				<div class="main_text2">복비 할인, 기프티콘 증정</div>
			</div>
			<div class="main_ad">
				<img class="s_image"
					src="https://ifh.cc/g/5yxa4t.jpg""
					border='0'>
				<div class="main_text " style="color:rgb(25, 23, 130);">부동산 필수 웹, 집드림</div>
				<div class="main_text2" style="color:rgb(25, 23, 130);">이런 서비스 이용해보셨나요?</div>
			</div>
			<div class="main_ad">
				<img class="s_image"
					src="https://ifh.cc/g/JgzQJ1.jpg"
					border='0'>
				<div class="main_text ">새집 줄게 헌집 다오</div>
				<div class="main_text2">아파트는 집드림이 대세!</div>
			</div>

		</div>
	</div>

	<div class="notice">
		<div class="notice_text" data-aos="fade-up"  data-aos-duration="2000">
			<img class="ad_image" src='https://ifh.cc/g/s8kd0C.gif'>
		 집드림의 부동산 가이드</div>
		<div class="slider" id="n_slider">
		
		</div>

	</div>

	<div class="search">
		<div id="s_top" data-aos="fade-up"  data-aos-duration="2000">어떤 집을 찾으시나요?</div>
		<div id="s_bottom">
			<div id="s_bottom_inner">
				<div id="s_text">
					<input type="text" id="s_input" placeholder="찾고자 하는 매물의 지역을 입력하세요.">
				</div>
				<div id="s_icon">
					<a href='#'><img id="s_icon_image"
						src='https://ifh.cc/g/4amlfg.png' border='0'></a>
				</div>
			</div>
		</div>
	</div>


	<div class="notice">
		<div class="notice_text" data-aos="fade-up"  data-aos-duration="3000">
		<img class="ad_image" src='https://ifh.cc/g/5MrNyC.gif' border='0'>
		집드림의 부동산 뉴스</div>
		<div class="news_slider">
		</div>
		<div id="more">
			<a href="https://land.naver.com/news/headline.naver" id="more_text" >더보기&nbsp;&nbsp;<span><img id="arrow" src='https://ifh.cc/g/whCxm8.png' border='0'></span> </a>
		</div>
	</div>
	<div class="main_ad2" style="margin-top:200px;">
		<div class="main_ad_inner">
			<div class="main_ad_text"><div class="text_size" data-aos="fade-down-right" data-aos-duration="1500"
     				data-aos-offset="100" data-aos-easing="ease-in-sine"><img class="ad_image" src='https://ifh.cc/g/ct4KOO.png'><br>원하는<br>분양이 나오면<br>바로 알려드려요!</div><br>
					<h5 class="main_h5" data-aos="flip-up" >싸고 좋은 매물,</h5><h5 class="main_h5" data-aos="flip-up">제일 먼저 확보하세요</h5><br>
					<div class="more_btn" data-aos="zoom-in-up" id="sales">더 알아보기</div>
				</div>
			<div class="main_ad_image" data-aos="fade-down"
								     data-aos-easing="linear"
								     data-aos-duration="1500">
				<div class="mImage"><img src="<%=request.getContextPath()%>/resources/images/main4.png"></div>
			</div>
		</div>
		
	</div>
	<div class="main_ad2" id="main_ad2" >
		<div class="main_ad_inner">
			<div class="main_ad_image" data-aos="fade-down"
					     data-aos-easing="linear"
					     data-aos-duration="1500">
				<div class="mImage"><img src="https://ifh.cc/g/JwNfdb.jpg"></div>
			</div>
			<div class="main_ad_text" style="text-align:right;">
					<div class="text_size" data-aos="fade-down-left" data-aos-duration="1500"
     				data-aos-offset="100" data-aos-easing="ease-in-sine" ><img class="ad_image" src='https://ifh.cc/g/Nqrk4w.png'><br>다양한 이벤트를<br>만나보세요.</div><br>
					<h5 class="main_h5" data-aos="flip-up">첫 가입시 10% 복비 할인</h5>
					<h5 class="main_h5" data-aos="flip-up"> 첫 거래시 복비 할인 쿠폰</h5><br>
					<div class="more_btn" style="position:absolute; right:22%;" data-aos="zoom-in-up" id="coupon">더 알아보기</div>
				</div>
		</div>
		
	</div>
	<div class="main_ad2" >
		<div class="main_ad_inner">
			<div class="main_ad_text" id="main_ad3"><div class="text_size"  data-aos="fade-down" data-aos-duration="1500"
     				data-aos-offset="100" data-aos-easing="ease-in-sine"><img class="ad_image" src='https://ifh.cc/g/W8ptpC.png'><br>지역 내<br>베테랑 부동산이<br>당신의 거래를<br>책임집니다.</div><br>
					<h5 class="main_h5" data-aos="flip-up">집드림과 지역 전문 중개사들이</h5><h5 class="main_h5" data-aos="flip-up">함께합니다.</h5><br>
					<div class="more_btn" data-aos="zoom-in-up" id="agentMore">더 알아보기</div>
				</div>
			<div class="main_ad_image"  data-aos="fade-left"
									     data-aos-easing="linear"
									     data-aos-duration="1500">
									     
				<div class="mImage"><img src="https://ifh.cc/g/hYzCZ9.jpg"></div>
			</div>
		</div>
	</div>
	<div class="main_login">
		<div class="login_inner">
			<div id="login_text" data-aos="fade-down"
     data-aos-easing="linear"
     data-aos-duration="1500"><h1>이 모든 놀라운 기능을</h1><h1>지금 이용해보세요.</h1></div>
			<div id="login_ani" >
				<div class="s1_arrow">
  <div class="scroll-arrow"></div>
  <div class="scroll-arrow"></div>
  <div class="scroll-arrow"></div>
</div>
			</div>
			<div id="login_btn" data-aos="zoom-out-up"  data-aos-duration="3000">로그인</div>
		</div>
	</div>
	
	
	
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5><span id="m_date"></span>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close" style="border:none; background: white; font-size:20px;"> 
        	<span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

	<script>
	
	 
	 
	 	const refUno ='${loginUser.userNo}';
		const userId ='${loginUser.userId}';
		const userName = '${loginUser.userName}';
		const userLevel = '${loginUser.userLevel}';
		
		
		
	 
	 	function noticeModal(index){
	 		$("#exampleModalLabel").text(noticeBoardList.list[index].noticeBoardTitle);
			$("#m_date").text(noticeBoardList.list[index].createDateTime);
	    	$('#exampleModal').modal("show");
	    	$(".modal-body").html(noticeBoardList.list[index].noticeBoardContent);
		}
	
		$(function() {
			$('#slider-div').slick({
				slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
				infinite : true, //무한 반복 옵션	 
				slidesToShow : 1, // 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
				speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : false, // 옆으로 이동하는 화살표 표시 여부
				dots : true, // 스크롤바 아래 점으로 페이지네이션 여부
				autoplay : true, // 자동 스크롤 사용 여부
				autoplaySpeed : 3000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
				pauseOnHover : false, // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
				vertical : false, // 세로 방향 슬라이드 옵션
				// prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
				//nextArrow : "<button type='button' class='slick-next'>Next</button>",	 	// 다음 화살표 모양 설정
				dotsClass : "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
				draggable : true, //드래그 가능 여부 

			});

			$('#slider-div').slick('slickPlay');
			$('.slick-dots').css('bottom', '50px');

			
		 	$.ajax({
		 		url : "<%=request.getContextPath()%>/admin/noticeList",
		 		type : "get",
		 		
		 		success : function(result){
		 			console.log(result);
		 			let text="";
		 			
		 			noticeBoardList = result;
		 			
		 			for(let i = 0; i<result.list.length; i++){
		 				text +=
		 				'<div class="notice_list" onClick="noticeModal('+i+');"><img class="pin"'+
							'src="<%=request.getContextPath()%>/resources/images/pin.png">'+
						'<div class="nlist"><div class="nlist_inner">'+
								'<div class="nlist_text">'+result.list[i].noticeBoardTitle+'</div>'+
								'<img  class="logoImage" src="https://ifh.cc/g/QymlYO.png" ></div></div></div>';
		 			}
		 			
		 			$("#n_slider").html(text);
		 			let nsize = $('.notice_list').length;
		 			
		 			$('#n_slider').slick({
						// centerMode: true,
						// centerPadding: '60px',
						slidesToShow : 3,
						responsive : [ {
							breakpoint : 1300,
							settings : {
								arrows : true,
								centerMode : true,
								centerPadding : '10px',
								slidesToShow : nsize >= 2 ? 2 : nsize,
							}
						}, {
							breakpoint : 1000,
							settings : {
								arrows : true,
								centerMode : true,
								centerPadding : '10px',
								slidesToShow : 1
							}
						} ]
					});
		 		},
		 		error : function(request){
		 			console.log("에러발생");
		 			console.log("에러코드 : "+request.status);
		 		}
		 	});
		 	
		 	
	
		 	
		 	
		 	
		 	
		 	
		 	$.ajax({
		 		url : "<%=request.getContextPath()%>/naver/news",
		 		type : "get",
		 		dataType : "JSON",
		 		success : function(result){
		 			let text = "";
		 			
		 			for(let i = 0; i<result.items.length; i++){
		 			
		 			
		 			if(i%2==0){
		 				text +=
			 			'<div class="news" onclick='+'location.href="'+result.items[i].link+'"'+'><div class="news_list"><div class="news_inner">'+
			 			'<div class="news_title">'+result.items[i].title+'</div>'+
						'<div class="news_content">'+result.items[i].description+'</div>'+
							'<hr class="hr_color">'+
						'<div class="news_name">'+result.items[i].pubDate.replace('+0900','')+'</div>'+
						'</div></div></div>';
		 				}else{
		 					text +=
		 					'<div class="news news2" onclick='+'location.href="'+result.items[i].link+'"'+'><div class="news_list"><div class="news_inner">'+
		 					'<div class="news_title">'+result.items[i].title+'</div>'+
							'<div class="news_content">'+result.items[i].description+'</div>'+
								'<hr class="hr_color">'+
							'<div class="news_name">'+result.items[i].pubDate.replace('+0900','')+'</div>'+
							'</div></div></div>';
		 				}
		 			
		 			}
					$(".news_slider").html(text);
					$('.news_slider').slick({
						// centerMode: true,
						// centerPadding: '60px',
						slidesToShow : 5,
						responsive : [ {
							breakpoint : 1400,
							settings : {
								arrows : true,
								centerMode : true,
								centerPadding : '10px',
								slidesToShow : 4
							}
						} , {
						breakpoint : 1200,
						settings : {
							arrows : true,
							centerMode : true,
							centerPadding : '10px',
							slidesToShow : 2
						}
					} ,{
						breakpoint : 900,
						settings : {
							arrows : true,
							centerMode : true,
							centerPadding : '10px',
							slidesToShow : 1
							}
						}]					
					});
		 			AOS.init();
		 		},
		 		error : function(request){
		 			console.log("에러발생");
		 			console.log("에러코드 : "+request.status);
		 		}
		 	})
	
			 
			
			 	
		$(".chat").click(function(){
			$(".chatting").css("display","block");
			
			$(".chat").css("display","none");
			
		});
	 	$(".x").click(function(){
	 		$(".chatting").css("display","none");
			$(".chat").css("display","block");
			
		});
		
	 	$(".chat_open").click(function(){
	 		
	 		$("#chat_msg").focus();
			
			$.ajax({
		 		url : "<%=request.getContextPath()%>/chat/openChatRoom",
		 		type : "get",
		 		success : function(result){
		 			
		 				chatRoomNo = result;
		 				chattingSock = new SockJS("<%=request.getContextPath()%>/chat"); 
		 				addEventChat();
		 				$("#x").click(function(){
		 					
		 					let result2 = exitChatRoom();
		 					console.log(result2);
		 					if(result2 == 1){
		 						$(".chat_open").css("display","block");
		 					 	$(".display-chatting").css({"display":"none","border":"none"});
		 					 	$(".display-chatting").html('');
		 					}
		 				});
		 		},
		 		error : function(request){
		 			console.log("에러발생");
		 			console.log("에러코드 : "+request.status);
		 			
		 		}
			})
		 	/* 채팅 */
		 	
		 	
		 	$(".chat_open").css("display","none");
		 	$(".display-chatting").css({"display":"block","border":"none"});
		 	
		 	
		 	
	 	});	
	 	
	<%-- 	let url = "<%=request.getContextPath()%>";
	 	let currentUrl = "<%=request.getRequestURI()%>";
	 	
	 	if(!url.equals(currentUrl)){
	 		
	 		exitChatRoom();s
	 	}  --%>
	 	
		$("#login_btn").click(function(){
		 	location.href="<%=request.getContextPath()%>/member/login";
	 	});	
	 	
		$(".login_service").click(function(){
		 	location.href="<%=request.getContextPath()%>/member/login";
	 	});	
	 	
		$("#sales").click(function(){
			location.href="<%=request.getContextPath()%>/sales/schedule";
		});
		
		$("#agentMore").click(function(){
			location.href="<%=request.getContextPath()%>/map/main";
		});
		
		$("#coupon").click(function(){
			if(${empty sessionScope.loginUser}){
				location.href="<%=request.getContextPath()%>/member/login";
			}else{
				location.href="<%=request.getContextPath()%>/mypage/couponlist";
			}
		});
		
		
		
	
	/* 	$("#chat_btn").click(function(){
			$(".chatting").css("display","block");
			
			$(".chat").css("display","none");
		}); */
		
		
		
		});
		function chat(){
			$(".chatting").css("display","block");
			
			$(".chat").css("display","none");
		}
		
		
		function exitChatRoom(){
			let data= 0;
			if(confirm("문의를 종료하시겠습니까?")){
				$.ajax({
					url:"<%=request.getContextPath()%>/chat/exit",
					data:{ chatRoomNo},
					 async:false,
					success : function(result){
						// result == 1 나가기 성공
						if(result == 1){
							data = result;
							swal("","문의가 종료되었습니다.","success");
						}else{
							swal("","문의 종료가 실패했습니다.","error");
						}
						// result == 0 실패 
						
					},
			 		error : function(request){
			 			console.log("에러발생");
			 			console.log("에러코드 : "+request.status);
			 			
			 		}
				})
			}else{
				$(".chatting").css("display","block");
			 	$(".display-chatting").css({"display":"block","border":"none"});
				
			}	
			return data;
		};
		
		
		
		$("#chat_msg").keyup(function(event){
			if(event.which===13){
				  $("#send").click();
			}
		});
		
		let keyword="";
		$("#s_input").keyup(function(){
			keyword = document.getElementById("s_input").value;
			
		});
		
		$("#s_icon_image").click(function(){
			let kw = document.getElementById("s_input").value;
			if(kw==""){
				swal("","키워드를 입력해주세요.","warning");
			}else{
				$.ajax({
					url: "<%= request.getContextPath()%>/map/searchKeyword",
					method: "get",
					data: {keyword : keyword},
					dataType: "json",
					success: function(result){
						let searchcode = result[0].bjdCode;
						let bjdName = result[0].bjdName;
						console.log(result[0].bjdName);
						<%-- $.ajax({
							url: "<%= request.getContextPath()%>/map/maintosearch",
							method: "get",
							data: {searchcode: searchcode},
							success:function(result){
								console.log("이동 성공");
							}
						}); --%>
						location.href="<%= request.getContextPath()%>/map/maintosearch?searchcode="+searchcode+"&bjdName="+bjdName;
					},
					error: function(result){
						console.log("main에서 map 이동 실패");
					}
					
				});
			
			}
		});
		
	</script>
	
<script src="<%=request.getContextPath()%>/resources/js/chat/chat.js"></script>


	<jsp:include page="../common/footer.jsp" />
	
	
	
