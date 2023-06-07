<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<style>
.display-chatting{
		width: 100%;
		height: 600px;
		
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

.chatting{
	width:450px;
	height:750px;
	background: #D4E1EF;
	z-index: 99;
	border-radius: 10px;
	box-shadow:rgba(0, 0, 0, 0.16) 0px 3px 20px;
	margin:auto;
	
}
.chatting_inner{
	width: 100%;
	height:600px;
	margin-top:25px;
	background: white;
	border-bottom:1px solid rgb(234, 234, 234);
	border-top:1px solid rgb(212, 212, 212);

	
}
.chat_header{
	
	padding-top:25px;
	width: 100%;
	text-align: center;
	font-weight: 600;
	font-size:20px;
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
	margin-top:14px;
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
	margin-bottom:23px;
}
.chat_btn{
	display: flex;
	padding:5px;
	justify-content: center;
}
.chat_btn>*{
	margin:10px;
	border-radius: 5px;
	box-shadow:rgba(0, 0, 0, 0.6) 0px 3px 5px;
}

.display-chatting::-webkit-scrollbar-thumb{
background: grey;
    border-radius: 10px;
}
.display-chatting::-webkit-scrollbar{
width: 10px;  
}
</style>
<section class="content">
   <section class="content-wrap">
      <div class="content-title">
         <h1>채팅 문의</h1>
      </div>

	<div class="chat_btn">
		<button type="button" class="btn btn-secondary" id="back">뒤로 가기</button>
		<button type="button" class="btn btn-warning" id="exit">방 나가기</button>
	</div>
	<div class="chatting">
		<div class="chat_header"><img src='https://ifh.cc/g/YX6YxA.png'>&nbsp;&nbsp;문의 채팅</div>
		<div class="chatting_inner">
			<ul class="display-chatting" >
				<c:forEach items="${list}" var="msg">
			
					<c:if test="${msg.refUno == loginUser.userNo }">
						<li class="myChat">
							<p class="chatP">${msg.message }</p><br>
							<span class="chatDate">
								${fn:substring(msg.createDatetime,11,13) > 11 ? "오후 " : "오전 " }
								${fn:substring(msg.createDatetime,11,16) }
							</span>
						</li>
					</c:if>
				
					<c:if test="${msg.refUno != loginUser.userNo }">
						<li>
							<b>${msg.userId}</b>	<br>
							<p class="chatP">${msg.message }</p><br>
							<span class="chatDate">
								${fn:substring(msg.createDatetime,11,13) > 11 ? "오후 " : "오전 " }
								${fn:substring(msg.createDatetime,11,16) }
							</span>
						</li>
					</c:if>
				</c:forEach> 
			</ul>
		 </div>
		<div class="chat_bottom">
				<textarea id="chat_msg" style="width:350px; height:30px; resize:none;"></textarea>
		<img id="send" src='https://ifh.cc/g/FCqYra.png'></div>
	</div>
   </section>
</section>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/chat/chat.js"></script>
<script>
$(function(){
	

	
});
const refUno ='${loginUser.userNo}';
const userId ='${loginUser.userId}';
const chatRoomNo = '${chatRoomNo}';
const userLevel = '${loginUser.userLevel}';



let chattingSock = new SockJS("<%=request.getContextPath()%>/chat"); 
addEventChat();

$("#exit").click(function(){
	exitChatRoom();
});

$("#back").click(function(){
	location.href="<%=request.getContextPath()%>/admin/chat";
});

function exitChatRoom(){
	if(confirm("채팅방을 나가시겠습니까?")){
		$.ajax({
			url:"<%=request.getContextPath()%>/chat/exit",
			data:{ chatRoomNo},
			 async:false,
			success : function(result){
				// result == 1 나가기 성공
				if(result == 1){
					alert("채팅방 나가기에 성공했습니다.");
					location.href="<%=request.getContextPath()%>/admin/chat";
				}else{
					alert("채팅방 나가기에 실패했습니다.");
				}
				// result == 0 실패 
				
			},
	 		error : function(request){
	 			console.log("에러발생");
	 			console.log("에러코드 : "+request.status);
	 			
	 		}
		})
	}	
};

$("#chat_msg").keyup(function(event){
	if(event.which===13){
		  $("#send").click();
	}
});


</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />