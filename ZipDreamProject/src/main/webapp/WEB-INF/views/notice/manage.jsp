<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		width:200px;
	}
	.content{
		width:600px;
	}
	.time{
		width:200px;
	}
</style>
<body>
<jsp:include page="notice_header.jsp"/>
	<div class="notice_table">
		<table>
			<thead>
				<tr>
					<th class="title">제목</th>
					<th class="content">내용</th>
					<th class="time">날짜</th>
				</tr>
			</thead>
			<tbody class="noticeThead">
			  <c:forEach items="${list}" var="manageList" >
	               <tr >
	               	 <td  class="title">${manageList.noticeTitle} </td>
	               	 <td class="content">${manageList.noticeContent} </td>
	               	 <td class="time">${manageList.createDateTime} </td>
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
	addEventMessage2(refUno);
	addEventMessage3(refUno);
	addEventMessage4(refUno);
	addEventMessage5(refUno);

</script>
</body>

