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
		width:300px;
	}
	.content{
		width:400px;
	}
	.time{
		width:300px;
	}
	.link{
		cursor:pointer;
	}

	
</style>
<body>
<jsp:include page="notice_header.jsp"/>
	<div class="notice_table">
		<table>
			<thead >
				<tr>
					<th class="title">단지명</th>
					<th class="content">알림</th>
					<th class="time">시간</th>
				</tr>
			</thead>
			<tbody class="noticeThead">
			<c:choose>
                  <c:when test="${fn: length(list) == 0}">
                     <tr>
                        <td style="text-align:center; width:1000px;">새로운 알림이 없습니다.</td>
                     </tr>
                  </c:when>
	           <c:otherwise>
				  <c:forEach items="${list}" var="interestList" >
	               <tr onClick="clickLink('${interestList.noticeUrl}')" class="link">
	               	 <td  class="title">${interestList.noticeTitle} </td>
	               	 <td class="content">${interestList.noticeContent} </td>
	               	 <td class="time">${interestList.createDateTime} </td>
	               </tr>
	           </c:forEach>
			</c:otherwise>
	       </c:choose>
			</tbody>
		</table>
	</div>
	<jsp:include page="../common/footer.jsp"/>

<script src="<%=request.getContextPath()%>/resources/js/chat/noticeChat.js"></script>
<script>
var refUno ='${loginUser.userNo}';
	let houseSock = new SockJS("<%=request.getContextPath()%>/notice"); 
	addEventMessage(refUno);
	
function clickLink(url){
	window.open('about:blank').location.href =url;
	
}

</script>
</body>

