<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
   <section class="content-wrap">
      <div class="content-title">
         <h1>채팅방 조회</h1>
         
      </div>
      <div class="content-notice-table">
         <table class="rwd-table">
            <tbody>
               <tr>
                  <th>번호</th>
                  <th>이름</th>
                  <th>아이디</th>
               </tr>
               <c:forEach items="${selectChatRoomList.list}" var="chatList">
               <tr>
               	 <th>${chatList.chatRoomNo} </th>
                  <th>${chatList.title} </th>
                  <th>${chatList.userId}</th>
                 
               </tr>
               </c:forEach>
               
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
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />