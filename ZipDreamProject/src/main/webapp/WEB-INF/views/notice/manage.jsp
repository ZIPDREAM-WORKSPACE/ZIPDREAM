<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
tbody::-webkit-scrollbar {
    width: 10px;  
 
}
  tbody::-webkit-scrollbar-thumb {
    background: grey;
    border-radius: 10px;
  }
	.notice_table{
		margin: auto;
		width:1000px;
		height:480px;
		border: 1px solid grey;
		margin-top:50px;
		margin-bottom:50px;
		
	}
	thead{
		 display:block;
		 height:60px;
		 background: rgb(242, 242, 242);
	}
	tbody{
	display:block;
    overflow:auto;
    height:420px;
   
   border-top: 2px solid grey;
    border-bottom: 1px solid grey;
    
	}
	table{
    	table-layout: fixed;
    border-collapse: collapse;
	}
	  th {
    border-bottom: 1px solid grey;
    border-right: 1px solid grey;
  }
  th:last-child{
  	border:none;
  }
  tr{
  	height:60px;
  	 border-bottom: 1px solid grey;
  }
  
	.notice_table *{
		
		text-align: center;
	}
	.title{
		width:150px;
	}
	.content{
		width:500px;
	}
	.time{
		width:250px;
	}
	.check{
		width:100px;
	}
</style>
<body>
<jsp:include page="notice_header.jsp"/>
	<div class="notice_table">
		<table>
			<thead>
				<tr>
					<th class="title">유형</th>
					<th class="content">알림</th>
					<th class="time">시간</th>
					<th class="check">확인</th>
				</tr>
			</thead>
			<tbody class="noticeThead">
			
			  <c:forEach items="${list}" var="manageList" >
	               <tr >
	               	 <td  class="title">${manageList.noticeTitle} </td>
	               	 <td class="content">${manageList.noticeContent} </td>
	               	 <td class="time">${manageList.createDateTime} </td>
	               	 <td class="check" onclick="noticeCheck(${manageList.noticeNo});"> <button type="button" class="btn btn-primary deleteChat" >확인</button></td>
	               </tr>
	           </c:forEach>
			
			
			</tbody>
		</table>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	<script src="<%=request.getContextPath()%>/resources/js/chat/noticeChat.js"></script>
<script>
var refUno ='${loginUser.userNo}';
	let houseSock = new SockJS("<%=request.getContextPath()%>/notice"); 
	let houseSock2 = new SockJS("<%=request.getContextPath()%>/notice"); 
	let houseSock3 = new SockJS("<%=request.getContextPath()%>/notice"); 
	let houseSock4 = new SockJS("<%=request.getContextPath()%>/notice");
	let houseSock5 = new SockJS("<%=request.getContextPath()%>/notice");
	let houseSock6 = new SockJS("<%=request.getContextPath()%>/notice"); 
	addEventMessage2(refUno);
	addEventMessage3(refUno);
	addEventMessage4(refUno);
	addEventMessage5(refUno);
	addEventMessage6(refUno);
	addEventMessage7(refUno);

	function noticeCheck(noticeNo){
		
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/deleteManageNotice",
			data:{ noticeNo},
			success : function(result){
				// result == 1 나가기 성공
				if(result == 1){
					alert("확인");
					location.href="<%=request.getContextPath()%>/notice/manage";
				}else{
					alert("실패");
				}
				// result == 0 실패 
				
			},
	 		error : function(request){
	 			console.log("에러발생");
	 			console.log("에러코드 : "+request.status);
	 			
	 		}
		})
	}
</script>
</body>

