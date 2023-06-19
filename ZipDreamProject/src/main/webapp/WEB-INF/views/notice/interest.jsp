<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice/notice.css">
<style>

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
   tbody>tr:hover { background-color: rgb(234, 238, 240); }
	
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
			
				  <c:forEach items="${list}" var="interestList" >
	               <tr onClick="clickLink('${interestList.noticeUrl}')" class="link">
	               	 <td  class="title">${interestList.noticeTitle} </td>
	               	 <td class="content">${interestList.noticeContent} </td>
	               	 <td class="time">${interestList.createDateTime} </td>
	               </tr>
	           </c:forEach>
			
			</tbody>
		</table>
	</div>
	<jsp:include page="../common/footer.jsp"/>

<script>
var refUno ='${loginUser.userNo}';
	let houseSock = new SockJS("<%=request.getContextPath()%>/notice"); 
	addEventMessage(refUno);
	
function clickLink(url){
	window.open('about:blank').location.href =url;
	
}

</script>
</body>

