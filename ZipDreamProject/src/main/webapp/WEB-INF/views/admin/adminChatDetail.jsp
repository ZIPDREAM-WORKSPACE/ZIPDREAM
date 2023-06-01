<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	margin-bottom:23px;
}
.chat_btn{
	display: flex;
	padding:5px;
}
.chat_btn>*{
	margin:10px;
}

</style>
<section class="content">
   <section class="content-wrap">
      <div class="content-title">
         <h1>채팅 문의</h1>
      </div>

	<div class="chat_btn">
		<div id="back">뒤로 가기</div>
		<div id="exit">방 나가기</div>
	</div>
	<div class="chatting">
		<div class="chat_header"><img id="x" class="x" src='https://ifh.cc/g/8wfDZb.png' ><img src='https://ifh.cc/g/YX6YxA.png'>&nbsp;&nbsp;문의 채팅</div>
		<div class="chatting_inner">
			<ul class="display-chatting" >
				<c:forEach items="${list}" var="msg">
					<c:if test="${msg.refUno == loginUser.userNo }">
						<li class="myChat">
							<p class="chatP">${msg.message }</p>
							<span class="chatDate">${msg.createDate}</span>
						</li>
					</c:if>
				
					<c:if test="${msg.refUno != loginUser.userNo }">
						<li>
							<b>${msg.userId}</b>	<br>
							<p class="chatP">${msg.message }</p>
							<span class="chatDate">${msg.createDate}</span>
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
const refUno ='${loginUser.userNo}';
const userId ='${loginUser.userId}';
const chatRoomNo = '${chatRoomNo}';
const userLevel = '${loginUser.userLevel}';


let chattingSock = new SockJS("<%=request.getContextPath()%>/chat"); 
addEventChat();



</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />