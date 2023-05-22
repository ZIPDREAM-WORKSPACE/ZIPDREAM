<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
	<section class="content-notice">
		<div class="content-notice-title">
			<h1>공지사항 관리</h1>
			<button type="button" onclick="location.href='<%=request.getContextPath()%>/admin/notice/enrollForm'">공지사항 작성</button>
		</div>
		<div class="content-notice-table">
			<table class="rwd-table">
				<tbody>
					<tr>
						<th>게시글번호</th>
						<th>내용</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
					<c:choose>
						<c:when test="${empty noticeBoardList.list } ">
							<tr>
								<td colspan="4">게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${noticeBoardList.list}" var="b">
								<tr>
									<td>${b.noticeBoardNo }</td>
									<td>${b.noticeBoardContent }...</td>
									<td>${b.noticeBoardTitle }</td>
									<td>${b.createDateTime }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
			<c:set var="url" value="notice?cpage="/>
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ noticeBoardList.pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${url}${noticeBoardList.pi.currentPage -1 }${sUrl}">이전</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="item" begin="${noticeBoardList.pi.startPage }" end="${noticeBoardList.pi.endPage }">
						<li class="page-item"><a class="page-link"
							href="${url}${item }${sUrl}">${item }</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${ noticeBoardList.pi.currentPage eq noticeBoardList.pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${url}${noticeBoardList.pi.currentPage + 1 }${sUrl}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</section>
</section>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />