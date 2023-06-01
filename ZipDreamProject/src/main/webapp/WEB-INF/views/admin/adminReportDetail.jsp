<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
		<section class="wrapper">
			<div class="item">
				<div class="reportContent-User">
					<div>${rUser.userName }</div>
					<div>${report.reportDate }</div>
				</div>
				<div class="reportContent">
					${report.reportContent }
				</div>
			</div>
			<div class="item tTable">
				<table class="rwd-table">
					<tbody>
						<tr>
							<th>신고자</th>
							<th>대상자</th>
							<th>내용</th>
							<th>타입</th>
							<th>처리 여부</th>
							<th>신고 일자</th>
						</tr>
						<c:forEach items="${reportList.list}" var="report">
							<tr>
								<td>${report.rname }</td>
								<td>${report.tname }</td>
								<td>${report.reportContent }</td>
								<td>${report.reportType }</td>
								<td>${report.reportStatus }</td>
								<td>${report.reportDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:set var="url" value='detail?reportNo=${report.reportNo}&cpage='/>
				<div id="pagingArea">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ reportList.pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${url}${reportList.pi.currentPage -1 }${sUrl}">이전</a></li>
							</c:otherwise>
						</c:choose>
		
						<c:forEach var="item" begin="${reportList.pi.startPage }" end="${reportList.pi.endPage }">
							<li class="page-item"><a class="page-link"
								href="${url}${item }${sUrl}">${item }</a></li>
						</c:forEach>
		
						<c:choose>
							<c:when test="${ reportList.pi.currentPage eq reportList.pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${url}${reportList.pi.currentPage + 1 }${sUrl}">다음</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<div class="item">
				<h3>신고자 정보</h3>
				<table class="reportResultTable" border=1>
					<tbody>
						<tr>
							<td colspan=2>${rUser.userName}</td>
						</tr>
						<tr>
							<td>가입일</td>
							<td>${rUser.enrollDateTime}</td>
						</tr>
						<tr>
							<td>타입</td>
							<td>${rUser.userLevel}</td>
						</tr>
						<tr>
							<td>상태</td>
							<td>${rUser.status}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="item">
				<h3>대상자 정보</h3>
				<table class="reportResultTable" border=1>
					<tbody>
						<tr>
							<td colspan=2>${tUser.userName}</td>
						</tr>
						<tr>
							<td>가입일</td>
							<td>${tUser.enrollDateTime}</td>
						</tr>
						<tr>
							<td>타입</td>
							<td>${tUser.userLevel}</td>
						</tr>
						<tr>
							<td>상태</td>
							<td>${tUser.status}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="item">
				<select>
					<option>거절되었습니다. 사유 : 무분별 신고</option>
					<option>승인되었습니다.</option>
				</select>
			</div>
		</section>
<script>
	console.log("${reportList}");
</script>
</section>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />