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
      <div class="content-table" >
         <table class="rwd-table">
        
            <tbody>
               <tr>
                  <th width="10%">번호</th>
                  <th width="40%">내용</th>
                  <th width="25%">회원</th>
                  <th width="25%">생성일</th>
               </tr>
                 <c:choose>
                  <c:when test="${empty selectChatRoomList }">
                     <tr>
                        <td colspan="4" style="text-align:center;">채팅 문의가 없습니다.</td>
                     </tr>
                  </c:when>
	           <c:otherwise>
	               <c:forEach items="${selectChatRoomList.list}" var="chatList">
	               <tr onclick="location.href='<%=request.getContextPath()%>/admin/chat/room/${chatList.chatRoomNo}'">
	               	 <th>${chatList.chatRoomNo} </th>
	                  <th>${fn:substring(chatList.message,0,30)}</th>
	                  <th>${chatList.title} </th>
	                  <th>${chatList.createDate} </th>
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
</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />