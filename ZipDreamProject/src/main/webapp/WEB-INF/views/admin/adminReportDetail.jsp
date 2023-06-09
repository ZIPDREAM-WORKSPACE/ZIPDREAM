<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
		<section class="wrapper">
			<div class="item">
				<div class="report-content-User">
					<div>${rUser.userName }</div>
					<div>${report.reportDate }</div>
				</div>
				<div class="report-content">
					${report.reportContent }
				</div>
			</div>
			<div class="item tTable">
				<h3 style="padding:25px 0px 0px 25px;">대상자 피신고기록</h3>
				<table class="rwd-table" style="margin-top:20px;">
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
							<tr onclick="location.href='<%=request.getContextPath()%>/admin/report/detail?reportNo=${report.reportNo}'">
								<td>${report.rname }</td>
								<td>${report.tname }</td>
								<td>${fn:substring(report.reportContent,0,6) }</td>
								<td>${report.reportType == 1 ? "이용자" : "허위매물" }</td>
								<td>${report.reportStatus }</td>
								<td>${report.reportDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:set var="url" value='detail?reportNo=${report.reportNo}&cpage='/>
				<div id="pagingArea" style="margin: 20px auto;">
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
			<div class="item user-info">
				<h3>신고자 정보</h3>
				<table class="report-result-table">
					<tbody>
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/user?type=${rUser.userLevel }&condition=id&keyword=${rUser.userId }'">
							<th colspan=2 class="firstTh">${rUser.userName}</th>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${rUser.userId}</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td>${rUser.enrollDateTime}</td>
						</tr>
						<tr>
							<th>타입</th>
							<td>${rUser.userLevel == 1  ? '일반 사용자' : '공인 중개사'}</td>
						</tr>
						<tr>
							<th>상태</th>
							<td>${rUser.status}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="item user-info">
				<h3>대상자 정보</h3>
				<table class="report-result-table">
					<tbody>
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/user?type=${tUser.userLevel }&condition=id&keyword=${tUser.userId }'">
							<th colspan=2 class="firstTh">${tUser.userName}</th>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${tUser.userId}</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td>${tUser.enrollDateTime}</td>
						</tr>
						<tr>
							<th>타입</th>
							<td>${tUser.userLevel == 1  ? '일반 사용자' : '공인 중개사'}</td>
						</tr>
						<tr>
							<th>상태</th>
							<td>${tUser.status}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="item result-select" style="box-shadow:none;background-color:#E5E5E5;">
				<form id="report-result-update" action="<%= request.getContextPath() %>/admin/report/update" method="get">
					<input type="hidden" name="reportNo" value="${report.reportNo }">
					<select class="result-value" name="reportResult">
						<option>승인되었습니다.</option>
						<option>거절되었습니다. 사유 : 불명확 신고</option>
						<option>거절되었습니다. 사유 : 무분별 신고</option>
						<option>거절되었습니다. 사유 : 중복 신고</option>
						<option>거절되었습니다. 사유 : 보류</option>
					</select>
					<div class="select-arrow"></div>
				</form>
			</div>
			<button type="submit" class="report-submit btn btn-success" onclick="reportSubmit();">처리 완료</button>
		</section>
<script src="<%=request.getContextPath()%>/resources/js/chat/noticeChat.js"></script>
<script>
	let houseSock = new SockJS("<%=request.getContextPath()%>/notice"); 
function reportSubmit(){

	document.getElementById('report-result-update').submit();
	var reportContent = '${report.reportContent }';
	var reportDate = '${report.reportDate }';
	var refRuno = ${report.refRuno };
	var reportStatus = '${report.reportStatus }';
	var reportResult = $(".result-value").val();
	var reportType = '${report.reportType }';
	console.log(reportResult);
	sendMessage2(reportContent,reportDate,refRuno, reportStatus,reportResult,reportType );
	insertReportNotice("<%=request.getContextPath()%>",reportContent,reportDate,refRuno, reportResult,reportType );
}
</script>
</section>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />