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
			<h1>매물 관리</h1>
		</div>
		<form id="searchForm" action="<%= request.getContextPath() %>/admin/selldetail" method="get" align="center">
			<div class="select">
				<select class="custom-select" name="condition">
					<option value="name" ${param.condition == 'name' ? 'selected':'' }>이름</option>
					<option value="address" ${param.condition == 'address' ? 'selected':'' }>주소</option>
					<option value="price" ${param.condition == 'price' ? 'selected':'' }>가격</option>
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
						<th>회원</th>
						<th>이름</th>
						<th>주소</th>
						<th>가격</th>
						<th>등록일</th>
						<th>상태</th>
					</tr>
					<c:choose>
						<c:when test="${fn: length(sellDetailList.list) == 0} ">
							<tr>
								<td colspan="7">회원이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${sellDetailList.list}" var="sellDetail">
								<tr data-no=${sellDetail.sellNo }>
									<td>${sellDetail.sellNo }</td>
									<td>${sellDetail.refUno }</td>
									<td>${sellDetail.sellName }</td>
									<td>${sellDetail.sellAddress }</td>
									<td>${sellDetail.sellPrice }</td>
									<td>${sellDetail.createDate }</td>
									<td>${sellDetail.status }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
			<c:set var="url" value="selldetail?cpage="/>
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ sellDetailList.pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${url}${sellDetailList.pi.currentPage -1 }${sUrl}">이전</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="item" begin="${sellDetailList.pi.startPage }" end="${sellDetailList.pi.endPage }">
						<li class="page-item"><a class="page-link"
							href="${url}${item }${sUrl}">${item }</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${ sellDetailList.pi.currentPage eq sellDetailList.pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${url}${sellDetailList.pi.currentPage + 1 }${sUrl}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		
		<div class="modal fade" id="sellDetailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl" style="max-width:1500px;">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">매물 상세 조회</h5>
						<button type="button" class="btn-close" data-dismiss="modal"
							aria-label="Close"
							style="border: none; background: white; font-size: 20px;">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="sellDetail-info">
							<input type="hidden" id="sellDetail-sellNo">
							<table class="rwd-table">
								<tbody>
									<tr style="background-color:#ebf3f9;color:#333;">
										<td>이름</td>
										<td class="sellDetail-name"></td>
										<td class="sellDetail-status"></td>
										<td class="sellDetail-no"></td>
									</tr>
									<tr>
										<td>주소</td>
										<td class="sellDetail-sellAddress"></td>
										<td>층 수</td>
										<td class="sellDetail-sellFloor"></td>
									</tr>
									<tr>
										<td>가격</td>
										<td class="sellDetail-sellPrice"></td>
										<td>관리비</td>
										<td class="sellDetail-maintenance"></td>
									</tr>
									<tr>
										<td>주차</td>
										<td class="sellDetail-parking"></td>
										<td>단기임대</td>
										<td class="sellDetail-shortTerm"></td>
									</tr>
									<tr>
										<td>방종류</td>
										<td class="sellDetail-type"></td>
										<td>해당층/건물층</td>
										<td class="sellDetail-allFloor"></td>
									</tr>
									<tr>
										<td>방수/욕실수</td>
										<td class="sellDetail-roomCount"></td>
										<td>전용/공급면적</td>
										<td class="sellDetail-provideArea"></td>
									</tr>
									<tr>
										<td>해당 면적 세대수</td>
										<td class="sellDetail-household"></td>
										<td>방향</td>
										<td class="sellDetail-way"></td>
									</tr>
									<tr>
										<td>입주 가능일</td>
										<td class="sellDetail-moveDatetime"></td>
										<td>건축물용도</td>
										<td class="sellDetail-buldtype"></td>
									</tr>
									<tr>
										<td>냉/난방시설</td>
										<td class="sellDetail-aircondition"></td>
										<td>승강시설</td>
										<td class="sellDetail-installation"></td>
									</tr>
									<tr>
										<td>총 세대 수</td>
										<td class="sellDetail-householdCount"></td>
										<td>세대주차대수</td>
										<td class="sellDetail-parkingCount"></td>
									</tr>
									<tr>
										<td>최초등록일</td>
										<td class="sellDetail-enrollDatetime"></td>
										<td>사용승인일</td>
										<td class="sellDetail-approvalDatetime"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer" style="justify-content:space-between;">
						<button class="btn btn-danger" onclick="deleteSellDetail();">매물 삭제</button>
						<button type="button" id="btn_register" class="btn btn-primary"
	                        data-dismiss="modal">닫기</button>
      				</div>
				</div>
			</div>
		</div>
	</section>
</section>
<script>
for(let i = 1; i < $("tbody>tr").length; i++){
	$("tbody>tr")[i].addEventListener('click',function(){
		let sellNo = $("tbody>tr")[i].dataset.no;
		<c:forEach items="${sellDetailList.list}" var="sellDetail">
			if(sellNo == ${sellDetail.sellNo}){	
				$("#sellDetail-sellNo").val(${sellDetail.sellNo});
				$(".sellDetail-name").text("${sellDetail.sellName}");
				$(".sellDetail-status").text("상태 : "+"${sellDetail.status}");
				$(".sellDetail-no").text("번호 : "+"${sellDetail.sellNo}");
				$(".sellDetail-sellAddress").text("${sellDetail.sellAddress}");
				$(".sellDetail-sellFloor").text("${sellDetail.sellFloor}");
				$(".sellDetail-sellPrice").text("${sellDetail.sellPrice}");
				$(".sellDetail-maintenance").text("${sellDetail.sellMaintenance}");
				$(".sellDetail-parking").text("${sellDetail.sellParking}");
				$(".sellDetail-shortTerm").text("${sellDetail.sellShortterm}");
				$(".sellDetail-type").text("${sellDetail.sellType}");
				$(".sellDetail-allFloor").text("${sellDetail.sellFloor}" + "/" +"${sellDetail.sellAllFloor}");
				$(".sellDetail-roomCount").text("${sellDetail.sellRoomCount}" + "/" +"${sellDetail.sellToiletCount}");
				$(".sellDetail-provideArea").text("${sellDetail.sellPrivateArea}" + "/" +"${sellDetail.sellProvideArea}");
				$(".sellDetail-household").text("${sellDetail.sellHousehold}");
				$(".sellDetail-way").text("${sellDetail.sellEntrance}");
				$(".sellDetail-moveDatetime").text("${sellDetail.sellMoveDatetime}");
				$(".sellDetail-buldtype").text("${sellDetail.sellBuldtype}");
				$(".sellDetail-aircondition").text("${sellDetail.sellAircondition}"+ "/" +"${sellDetail.sellHeating}");
				$(".sellDetail-installation").text("${sellDetail.sellInstallation}");
				$(".sellDetail-householdCount").text("${sellDetail.householdCount}");
				$(".sellDetail-parkingCount").text("${sellDetail.parkingCount}");
				$(".sellDetail-approvalDatetime").text("${sellDetail.sellApprovalDatetime}");
				$(".sellDetail-enrollDatetime").text("${sellDetail.sellEnrollDatetime}");
			}
		</c:forEach>
		$('#sellDetailModal').modal("show");
	});
} 

function deleteSellDetail(){
	let sellNo = $("#sellDetail-sellNo").val();
	location.href='<%=request.getContextPath()%>/admin/selldetail/del?sellNo='+sellNo;
}
</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />