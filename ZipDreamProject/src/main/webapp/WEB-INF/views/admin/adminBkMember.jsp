<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${ !empty param.condition }">
	<c:set var="sUrl" value="&condition=${param.condition }&keyword=${param.keyword }"/>
</c:if>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
	<section class="content-wrap">
		<div class="content-title">
			<h1>승인 대기 조회</h1>
		</div>
		<form id="searchForm" action="<%= request.getContextPath() %>/admin/bkmember" method="get" align="center">
			<div class="select">
				<select class="custom-select" name="condition">
					<option value="name" ${param.condition == 'name' ? 'selected':'' }>이름</option>
					<option value="id" ${param.condition == 'id' ? 'selected':'' }>아이디</option>
				</select>
			</div>
			<div class="text">
				<input type="text" class="form-control" name="keyword" value="${param.keyword }">
			</div>
			<button type="submit" class="searchBtn btn btn-secondary">검색</button>
		</form>
		<div class="content-table">
			<table class="rwd-table">
				<tbody>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>아이디</th>
						<th>전화번호</th>
						<th>가입일</th>
					</tr>
					<c:choose>
						<c:when test="${fn: length(userList.list) == 0} ">
							<tr>
								<td colspan="4">회원이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${userList.list}" var="user">
								<tr onclick="location.href='<%= request.getContextPath() %>/admin/bkmember/detail?userNo=${user.userNo }'" data-no=${user.userNo }>
									<td>${user.userNo }</td>
									<td>${user.userName }</td>
									<td>${user.userId }</td>
									<td>${user.phone }</td>
									<td>${user.enrollDateTime }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
			<c:set var="url" value="bkmember?&cpage="/>
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ userList.pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${url}${userList.pi.currentPage -1 }${sUrl}">이전</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="item" begin="${userList.pi.startPage }" end="${userList.pi.endPage }">
						<li class="page-item"><a class="page-link"
							href="${url}${item }${sUrl}">${item }</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${ userList.pi.currentPage eq userList.pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${url}${userList.pi.currentPage + 1 }${sUrl}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</section>
</section>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />