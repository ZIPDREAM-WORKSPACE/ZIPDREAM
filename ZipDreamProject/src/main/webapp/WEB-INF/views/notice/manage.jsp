<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice/notice.css">
<style>
	.title{
		width:150px;
	}
	.content{
		width:500px;
	}
	.time{
		width:250px;
	}
	.checkNotice{
		width:100px;
	}
	.check{
		color:red;
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
					<th class="checkNotice">확인</th>
				</tr>
			</thead>
			<tbody class="noticeThead">
			
			  <c:forEach items="${list}" var="manageList" >
	               <tr >
	               	 <td  class="title">${manageList.noticeTitle} </td>
	               	 <td class="content">${manageList.noticeContent} </td>
	               	 <td class="time">${manageList.createDateTime} </td>
	               	 <td class="check checkNotice" onclick="noticeCheck(${manageList.noticeNo});"> <button type="button" class="btn btn-outline-warning" >확인</button></td>
	               </tr>
	           </c:forEach>
			
			
			</tbody>
		</table>
	</div>
	<jsp:include page="../common/footer.jsp"/>
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
				if(result == 1){
					swal({
						text : "알림 확인이 완료되었습니다.",
					    	icon  : "success",
					    	closeOnClickOutside : false
					}).then(function(){
						 location.href="<%=request.getContextPath()%>/notice/manage";
					});
					  
				}else{
					 swal("", "알림 확인이 완료되지 않았습니다.", "warning");
				}
				
			},
	 		error : function(request){
	 			console.log("에러발생");
	 			console.log("에러코드 : "+request.status);
	 			
	 		}
		})
	}
</script>
</body>

