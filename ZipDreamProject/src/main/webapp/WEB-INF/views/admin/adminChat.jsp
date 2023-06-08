<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
   <section class="content-wrap">
      <div class="content-title">
         <h1>채팅 문의 목록 조회</h1>
         
      </div>
      <button type="button" class="btn btn-primary deleteChat" style="margin-bottom:10px;">채팅방 삭제</button>
      <div class="content-table" style="gap:50px;">
         <table class="rwd-table">
        
            <tbody>
               <tr>
               <th width="5%"><input type="checkbox" id="checkAll"></th>
                  <th width="10%">번호</th>
                  <th width="35%">내용</th>
                  <th width="20%">회원</th>
                  <th width="20%">생성일</th>
                  <th width="10%">참여수</th>
               </tr>
                 <c:choose>
                  <c:when test="${fn: length(selectChatRoomList.list) == 0}">
                     <tr>
                        <td colspan="6" style="text-align:center;">채팅 문의가 없습니다</td>
                     </tr>
                  </c:when>
	           <c:otherwise>
	               <c:forEach items="${selectChatRoomList.list}" var="chatList" varStatus="status">
	               <tr >
	               	 <td><input type="checkbox" name="chatCheck" value="${chatList.chatRoomNo }"></td>
	               	 <td onClick="chatDetail(${chatList.chatRoomNo})">${chatList.chatRoomNo} </td>
	                  <td onClick="chatDetail(${chatList.chatRoomNo})">${fn:substring(chatList.message,0,30)}</td>
	                  <td onClick="chatDetail(${chatList.chatRoomNo})">${chatList.title} </td>
	                  <td onClick="chatDetail(${chatList.chatRoomNo})">${chatList.createDate} </td>
	                   <td onClick="chatDetail(${chatList.chatRoomNo})">${countList[status.index].count} </td>
	               </tr>
	               </c:forEach>
		        </c:otherwise>
	                  
	       </c:choose>
               
            </tbody>
         </table>
         <c:set var="url" value="chat?cpage="/>
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ selectChatRoomList.pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${url}${selectChatRoomList.pi.currentPage -1 }${sUrl}">이전</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="item" begin="${selectChatRoomList.pi.startPage }" end="${selectChatRoomList.pi.endPage }">
						<li class="page-item"><a class="page-link"
							href="${url}${item }${sUrl}">${item }</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${ selectChatRoomList.pi.currentPage eq selectChatRoomList.pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${url}${selectChatRoomList.pi.currentPage + 1 }${sUrl}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
      </div>
      
   </section>
</section>
<script>
/* setTimeout("location.reload()", 5000); */

let chatCheck = document.getElementsByName("chatCheck");

for(let i = 0; i<chatCheck.length; i++){
	chatCheck[i].onclick = function () {
        let checkedListLength = document.querySelectorAll("input[name=chatCheck]:checked").length;
        let chatCheck = document.getElementsByName("chatCheck");
        if(checkedListLength == chatCheck.length){
            document.getElementById("checkAll").checked = true;
        } else {
            document.getElementById("checkAll").checked = false;
        }
       
    }
}

$(".deleteChat").click(function(){
	 let checkedList = document.querySelectorAll("input[name=chatCheck]:checked");
	 console.log(checkedList.length);
	 for(let i = 0; i<checkedList.length; i++){
		 deleteRoom(checkedList[i].value);
		 
	 }
	 alert("채팅방을 삭제했습니다.");
});


document.getElementById("checkAll").addEventListener("click",function(){
	
    let checked = document.getElementById("checkAll").checked;

    for (let i = 0; i < chatCheck.length; i++) {
    	chatCheck[i].checked = checked;
    }  
});

function chatDetail(chatRoomNo){
	location.href='<%=request.getContextPath()%>/admin/chat/room/'+chatRoomNo;
};
function deleteRoom(chatRoomNo){
	$.ajax({
		url:"<%=request.getContextPath()%>/chat/closeChatRoom/"+chatRoomNo,
		data:{ chatRoomNo},
		success : function(result){
			// result == 1 나가기 성공
			if(result >= 1){
				
				location.href="<%=request.getContextPath()%>/admin/chat";
			}else{
				alert("채팅방 삭제가 실패했습니다.");
			}
			// result == 0 실패 
			
		},
 		error : function(request){
 			console.log("에러발생");
 			console.log("에러코드 : "+request.status);
 			
 		}
	})
	
};
</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />