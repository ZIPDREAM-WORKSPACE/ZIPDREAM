<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
	<section class="content-wrap">
		<div class="content-title">
			<h1>회원 조회</h1>
			<div style="width:500px;height:100px;display:flex;">
				<button type="button" onclick="location.href='<%= request.getContextPath()%>/admin/user?type=1&cpage=1'">일반 회원</button>
				<button type="button" onclick="location.href='<%= request.getContextPath()%>/admin/user?type=2&cpage=1'">공인중개사</button>
			</div>
		</div>
		<div class="content-notice-table">
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
								<tr data-no=${user.userNo }>
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
			
			<c:set var="url" value="user?type=${type }&cpage="/>
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
		<div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">회원 상세 조회</h5>
						<button type="button" class="btn-close" data-dismiss="modal"
							aria-label="Close"
							style="border: none; background: white; font-size: 20px;">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="user-info">
							<table class="rwd-table">
								<tbody>
									<tr style="background-color:#ebf3f9;color:#333;">
										<td>아이디</td>
										<td class="user-userId"></td>
										<td class="user-office"></td>
										<td class="user-withdraw"></td>
									</tr>
									<tr>
										<td>이름</td>
										<td class="user-userName"></td>
										<td>전화번호</td>
										<td class="user-phone"></td>
									</tr>
									<tr>
										<td>권한</td>
										<td class="user-userLevel"></td>
										<td>상태</td>
										<td class="user-status"></td>
									</tr>
									<tr>
										<td>가입일</td>
										<td class="user-enrollDateTime"></td>
										<td>수정일</td>
										<td class="user-modifyDateTime"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="user-more">
							<div class="user-content-nav" style="display:flex;">
								<button type="button" class="btn btn-primary" style="border-radius:8px 8px 0px 0px;">신고 기록</button>

							</div>
							<div class="user-content" style="padding:12px;border:5px solid #007bff;border-radius:0px 8px 8px 8px;">
								<table class="rwd-table" style="margin-bottom:30px;">
									<tbody class="user-tbody">
										
									</tbody>
								</table>
								<div id="pagingArea">
									<ul class="pagination user-pagination">
										
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="justify-content:space-between;">
						<button class="btn btn-danger" onclick="deleteMember();">회원 탈퇴</button>
						<button type="button" id="btn_register" class="btn btn-primary"
	                        data-dismiss="modal">닫기</button>
      				</div>
				</div>
			</div>
		</div>
	</section>
</section>
<script>
	if(${type}==1){
		$(".content-title button")[1].style.backgroundColor = "gray";
	}else{
		$(".content-title button")[0].style.backgroundColor = "gray";
	}
	
	let uPage = 1;
	let uno = 0;
	for(let i = 1; i < $("tbody>tr").length; i++){
		$("tbody>tr")[i].addEventListener('click',function(){
			let userNo = $("tbody>tr")[i].dataset.no;
			<c:forEach items="${userList.list}" var="user">
				if(userNo == ${user.userNo}){					
					uno = userNo;
				    let userLevel = ${user.userLevel} == 1 ? "일반사용자" : "공인중개사";
					$(".user-userId").text("${user.userId}");
					$(".user-office").text("${user.office}");
					$(".user-withdraw").text("${user.withdraw}");
					$(".user-userName").text("${user.userName}");
					$(".user-phone").text("${user.phone}");
					$(".user-userLevel").text(userLevel);
					$(".user-status").text("${user.status}");
					$(".user-enrollDateTime").text("${user.enrollDateTime}");
					$(".user-modifyDateTime").text("${user.modifyDateTime}");
				}
			</c:forEach>
			getReportList(userNo,uPage);
			$('#userModal').modal("show");
		});
	}
	
	function getReportList(userNo,cPage){
		$.ajax({
			  url : "<%= request.getContextPath() %>/admin/getReportList",
			  method: "get",
			  data: {userNo, cPage},
			  contentType:'application/json;charset=utf-8',
	    	  dataType:'json',
			  success : function(result){
				  let html = "<tr><td>대상자</td><td>신고내용</td><td>처리여부</td><td>처리내용</td><td>타입</td><td>신고일자</td></tr>";
				  for(let i = 0; i < result.array.length; i++){
					let report = result.array[i];
				  	html += "<tr><td>"+report.tname+"</td><td>"+ report.reportContent+"</td>";
				  	html += "<td>"+report.reportStatus+"</td><td>"+report.reportResult+"</td><td>"+report.reportType+"</td><td>"+report.reportDate+"</td></tr>";
					  
				  }
				  $(".user-tbody").html(html);
				  
				  let userPage = "";
				  uPage = uPage-1 < 1 ? 1 : uPage;
				  
				  if(result.pi.currentPage == 1){
					  userPage += "<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>";
				  }else {
					  userPage += "<li class='page-item'><a class='page-link' onclick='getReportList(" +uno +","+ (uPage-1) + "); uPage--;'" +
							">이전</a></li>";
				  }
				  for(let i = result.pi.startPage; i< result.pi.endPage; i++){
					  userPage += '<li class="page-item"><a class="page-link" '+
							'onclick="getReportList(' +uno +','+ i + ')">${item }'+i+'</a></li>';
				  }
				  if(result.pi.currentPage == result.pi.maxPage){
					  userPage += '<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>';
				  }else {
					  userPage += "<li class='page-item'><a class='page-link' onclick='getReportList(" +uno +","+ (uPage+1) + "); uPage++;'" +
						">다음</a></li>";
				  }
				  $(".user-pagination").html(userPage);
			  },
              error: function(){
                  console.log("에러남");
               }
                  
        });
	}
	
	function deleteMember(){
		location.href='<%=request.getContextPath()%>/admin/changeMemberStatus?userNo='+uno+'&status='+$(".user-status").text();
	}
</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />