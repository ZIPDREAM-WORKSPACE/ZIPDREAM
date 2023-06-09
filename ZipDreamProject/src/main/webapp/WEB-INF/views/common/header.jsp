<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<!--  공통적으로사용할 라이브러리 추가 -->
<!-- 소켓 -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- alert창 꾸미기  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Jquey 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
 <!-- 부트스트랩에서 제공하있는 스타일  -->
 <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
<!-- 부투스트랩에서 제공하고있는 스크립트   -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

 	
<!-- 슬릭 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"> 



<!-- aos 라이브러리 -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 





<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.header {
	width: 100%;
	height: 80px;
	position: sticky;
	top: 0;
	background-color: white;
	border-bottom: 1px solid rgb(206, 206, 206);
	z-index: 9;
}

.header_inner {
	width: 100%;
	height: 100%;
	position: relative;
}

.header_inner>ul {
	padding: 0px;
}

.login {
	position: absolute;
	right: 5%;
	top: 25%;
	width: 6%;
	height: 40px;
	font-size: 1.1vw;
	background: #1F4B6B;
	color: white;
	text-align: center;
	border-radius: 10px;
	min-width:45px;
	line-height : 40px;
	box-shadow: 0 17px 20px -18px rgba(0, 0, 0, 1);
	cursor: pointer;
	font-weight: 500;
}


.header_list {
	width: 60%;
	margin: auto;
	height: 100%;
	display: flex;
	justify-content: center;
	list-style: none;
}

.h_list {
	width: 20%;
	text-align: center;
	margin: auto;
}

#logo {
	width: 4.5vw;
	height: 3.5vw;
	cursor: pointer;
	justify-content: center;
	min-width: 50px;
	min-height: 40px;
	
}

.h_text {
	margin: auto; /* 25px; */
	font-size: 1.2vw;
	width: 18%;
	text-align: center;
	cursor: pointer;
	font-weight: 500;
}

.h_text>a:hover {
	color: rgb(76, 129, 141);
}

.h_text>a {
	text-decoration-line: none;
	color: black;
}
.login2 {
	position: absolute;
	right: 5%;
	top: 15%;
	width: 9%;
	height: 40px;
	font-size: 1.1vw;
	text-align: center;
	border-radius: 10px;
	min-width:70px;
	line-height : 40px;
	font-weight: 500;
}
#logout_bt{
position: absolute;
	right: 5%;
	top: 65%;
	color:red;
	font-size: 0.8vw;
	height:30px;
	width: 9%;
	text-align: center;
	min-width:70px;
}
#logout_bt>a:hover{

	color:red;
	text-decoration: none;

}
#logout_bt>a{

	color:red;

}
#profile_img{
	width:23px;
	heght:23px;
	padding-bottom:5px;
	margin-right:5px;
}
	.notice1{
		width:250px;
		height:60px;
		line-height:60px;
		position: absolute;
		background:lightyellow;
		top:150%;
		right:10%;
		border : 1px solid rgb(237, 237, 237);
		z-index : 99;
		 box-shadow: 0 3px 3px rgba(0,0,0,0.2);
		 text-align: center;
		 padding:0px;
		 cursor: pointer;
		
	}
	.alarmImg{
		width:30px;
		height:30px;
	}
</style>
</head>
<body>
<c:if test="${ not empty alertMsg }">
		<script>
			swal("", '${alertMsg.message}','${alertMsg.type}');
		</script>
		<c:remove var="alertMsg" />
	</c:if>
	<div class="header">
		<div class="header_inner">
			<ul class="header_list">
				<li class="h_text"><a href="<%=request.getContextPath()%>/map/main">지도</a></li>
				<li class="h_text"><a href="<%=request.getContextPath()%>/sales/schedule">분양</a></li>
				<li class="h_list"><a href="<%=request.getContextPath()%>"><img id="logo"src="<%=request.getContextPath()%>/resources/images/logo1.png"></a></li>
				<c:if test="${empty sessionScope.loginUser}">
					<li class="h_text"><a href="" onclick="swal('로그인 후 이용하실 수 있습니다.'); return false;">알림</a></li>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser}">
					<li class="h_text"><a href="<%=request.getContextPath()%>/notice/manage">알림</a></li>
				</c:if>
				<c:if test="${sessionScope.loginUser != null }">
					<c:if test="${sessionScope.loginUser.userLevel == 1 }">
						<li class="h_text"><a href="<%=request.getContextPath()%>/mypage/currentPage">마이페이지</a></li>
					</c:if>
					<c:if test="${sessionScope.loginUser.userLevel == 2 }">
						<li class="h_text"><a href="<%=request.getContextPath()%>/agent/list">마이페이지</a></li>
					</c:if>
				</c:if>
				<c:if test="${sessionScope.loginUser == null }">
					<li class="h_text"><a href="" onclick="swal('로그인 후 이용하실 수 있습니다.'); return false;">마이페이지</a></li>
				</c:if>
				
			</ul>
			<c:if test="${ empty sessionScope.loginUser}"> 
            		<div class="login">로그인</div>

            </c:if>
            <c:if test="${!empty sessionScope.loginUser}"> 
            		<div class="login2"><img id="profile_img" src="https://ifh.cc/g/bbzopf.png">${loginUser.userName} 님</div><div id="logout_bt"><a href="<%=request.getContextPath()%>/member/logout">로그아웃</a></div>

            </c:if>
		</div>
		
	</div>

	<script>
	let currentURL = "<%=request.getRequestURI()%>";
	let URL = "<%=request.getContextPath()%>/";
	
	
		
	if('${loginUser.userNo}'!='' && currentURL != URL && '${chatRoomNo}'!=''){
	 	$.ajax({
			url:"<%=request.getContextPath()%>/chat/chatRoomSelect",
			type : "get",
			success : function(result){
				// result == 1 나가기 성공
				if(result >= 1){
					$.ajax({
						url:"<%=request.getContextPath()%>/chat/exit",
						data:{ chatRoomNo : '${chatRoomNo}'},
						success : function(data){
							if(data == 1){
								console.log("채팅방에서 나갔습니다");
							}else{
								console.log("채팅방 나가기에 실패했습니다.");
							}
							
						},
				 		error : function(request){
				 			console.log("에러발생");
				 			console.log("에러코드 : "+request.status);
				 			
				 		}
					})
					
				}else{
					console.log("else");
				}
				// result == 0 실패 
				
			},     error: function(){
	            console.log("에러남");
	        }
			
		})
		
 	}else{
 		console.log("else");
 		
 	}
 	
	$(".login").click(function(){
		location.href="<%=request.getContextPath()%>/member/login";
	});
	
	var currentUserNo ='${loginUser.userNo}';
	
	let houseSock1 = new SockJS("<%=request.getContextPath()%>/notice"); 
	houseSock1.onmessage = function(e){
		let message = JSON.parse(e.data);
		if((message.userNo==currentUserNo && message.hsUrl !=null)|| 
				(message.refRuno==currentUserNo && message.reportType !=null)|| 
				(message.userNo==currentUserNo && message.couponContent !=null)|| 
				(message.refUno==currentUserNo&&message.dealType!=null&&message.refRuno!=null) || 
				(message.refUno==currentUserNo&&message.counsleMethod !=null &&message.refTuno==0) ||
				(message.refTuno==currentUserNo&&message.counsleMethod !=null&&message.refUno!=null) || 
				(message.refUno==0&&message.refRuno==currentUserNo && message.dealType != null)){
			
			createNotice();
		}
	}
	

	</script>
	<script src="<%=request.getContextPath()%>/resources/js/chat/noticeChat.js"></script>
</body>
</html>