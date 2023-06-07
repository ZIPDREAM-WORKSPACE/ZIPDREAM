<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
	<section class="content-wrap">
		<div class="content-title">
			<h1>이벤트 관리</h1>
			<div class="content-view-item add-coupon" style="margin-right:140px;box-shadow: 0px 10px 30px rgba(17, 38, 146, 0.3);cursor:pointer;">
				<div class="coupon-menu">
					<p class="text-gray">쿠폰 등록</p>
					<h5 style="margin-top:10px;">현재 : 2</h5>
				</div>
				<img src="<%=request.getContextPath()%>/resources/images/Group.svg">
			</div>
		</div>
		<form id="searchForm" action="<%= request.getContextPath() %>/admin/event" method="get" align="center" style="display:flex;justify-content:flex-start;margin-bottom:25px;gap:10px;">
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
		<div class="content-table" style="gap:50px;">
			<table class="rwd-table">
				<tbody>
					<tr>
						<th><input type="checkbox" id="checkAll"></th>
						<th>번호</th>
						<th>이름</th>
						<th>아이디</th>
						<th>전화번호</th>
						<th>가입일</th>
						<th><button type="button" class="btn btn-success">일괄 보내기</button></th>
					</tr>
					<c:choose>
						<c:when test="${fn: length(userList.list) == 0} ">
							<tr>
								<td colspan="4">회원이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${userList.list}" var="user">	
								<tr class="user-label" data-no=${user.userNo }>
									<td onclick="event.stopImmediatePropagation();"><input type="checkbox" name="userCheck" value="${user.userNo }"></td>
									<td>${user.userNo }</td>
									<td>${user.userName }</td>
									<td>${user.userId }</td>
									<td>${user.phone }</td>
									<td>${user.enrollDateTime }</td>
									<td><button type="button" class="btn btn-primary" onclick="event.stopImmediatePropagation();">보내기</button></td>
								</tr>								
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<c:set var="url" value="event?&cpage="/>
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
		<div class="modal fade" id="couponModal" tabindex="-1" aria-labelledby="couponModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl" style="max-width:1500px;">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">쿠폰 현황</h5>
						<button type="button" class="btn-close" data-dismiss="modal"
							aria-label="Close"
							style="border: none; background: white; font-size: 20px;">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="enrollForm" action="<%= request.getContextPath() %>/admin/event/insert" enctype="multipart/form-data" method="post">
							<table align="center">
								<tr>
									<th><label for="title">제목</label></th>
									<td><input type="text" id="title" class="form-control" name="couponTitle" required></td>
								</tr>
								<tr>
									<th><label for="content">내용</label></th>
									<td><input type="text" id="content" class="form-control" name="couponContent"></td>
								</tr>
								<tr>
									<th><label for="date">유효기간</label></th>
									<td><input type="date" id="date" class="form-control" name="couponDate"></td>
								</tr>
								<tr>
									<th><label  for="image">업로드 이미지</label></th>
									<td>
									<img class="preview" src="">
									<input type="file" name="images" class="form-control" accept="images/*" id="img" required>
									</td>
								</tr>
							</table>
							
							<div align="center">
								<button type="submit" class="btn btn-primary">등록하기</button>
								<button type="reset"  class="btn btn-danger">취소하기</button>
							</div>				
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">쿠폰 등록</button>
						<button type="button" id="btn_register" class="btn btn-primary"
	                        data-dismiss="modal">닫기</button>
      				</div>
				</div>
			</div>
		</div>
	</section>
</section>
<script>
let userCheck = document.getElementsByName("userCheck");

for(let i = 0; i<userCheck.length; i++){
	userCheck[i].onclick = function () {
        let checkedListLength = document.querySelectorAll("input[name=userCheck]:checked").length;
        let userCheck = document.getElementsByName("userCheck");
        if(checkedListLength == userCheck.length){
            document.getElementById("checkAll").checked = true;
        } else {
            document.getElementById("checkAll").checked = false;
        }
       
    }
}

document.getElementById("checkAll").addEventListener("click",function(){
	
    let checked = document.getElementById("checkAll").checked;

    for (let i = 0; i < userCheck.length; i++) {
    	userCheck[i].checked = checked;
    }  
});

let userLabel = document.getElementsByClassName("user-label");

for (let i = 0; i < userLabel.length; i++) {
	userLabel[i].addEventListener('click',function(){
		event.stopPropagation();
		if(userCheck[i].checked == true){
			userCheck[i].checked = false;			
		}else {
			userCheck[i].checked = true;
		}
		
		let checkedListLength = document.querySelectorAll("input[name=userCheck]:checked").length;
        if(checkedListLength == userCheck.length){
            document.getElementById("checkAll").checked = true;
        } else {
            document.getElementById("checkAll").checked = false;
        }
	});
}

$(".add-coupon").click(function(){
	$('#couponModal').modal("show");
});

function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementsByClassName("preview")[0];
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}

const inputImage = document.getElementById("img")
inputImage.addEventListener("change", e => {
    readImage(e.target)
});

</script>
		
	
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />