<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
	<section class="content-wrap">
		<div class="content-title">
			<h1>이벤트 관리</h1>
			<div class="content-view-item add-coupon" style="margin-right:140px;box-shadow: 0px 10px 30px rgba(17, 38, 146, 0.3);cursor:pointer;">
				<div class="coupon-menu">
					<p class="text-gray">쿠폰 등록</p>
					<h5 style="margin-top:10px;">현재 : ${fn:length(couponList)}</h5>
				</div>
				<img src="<%=request.getContextPath()%>/resources/images/Group.svg">
			</div>
		</div>
		<form id="searchForm" action="<%= request.getContextPath() %>/admin/event" method="get" align="center">
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
						<th><button type="button" class="btn btn-success" onclick="ArrayInsertModal();">일괄 보내기</button></th>
					</tr>
					<c:choose>
						<c:when test="${fn: length(userList.list) == 0}">
							<tr>
								<td colspan="4" style="text-align:center;">회원이 없습니다.</td>
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
									<td><button type="button" class="btn btn-primary" onclick="event.stopImmediatePropagation();openInsertModal(this.parentNode);">보내기</button></td>
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
									<th><label  for="image">이미지</label></th>
									<td>
									<img class="preview" src="" style="object-fit:cover;">
									<input type="file" name="images" class="form-control" accept="images/*" id="img" required>
									</td>
								</tr>
							</table>
							
							<div align="center" style="margin-top:20px;">
								<button type="submit" class="btn btn-primary" >등록하기</button>
								<button type="reset"  class="btn btn-danger">취소하기</button>
							</div>				
						</form>
						
						<div class="coupon-list" style="margin-top:20px;padding:10px 5px;border:1px solid #999;">
							<c:forEach items="${couponList}" var="coupon">
								<img class="coupons" width="300px" height="150px" src="<%= request.getContextPath() %>${coupon.couponPath }" data-couponNo="${coupon.couponNo }" data-couponTitle="${coupon.couponTitle }" data-couponContent="${coupon.couponContent }" data-couponDate="${coupon.couponDate }" data-couponpath="${coupon.couponPath }" style="object-fit:cover;">	
							</c:forEach>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="btn_register" class="btn btn-primary"
	                        data-dismiss="modal">닫기</button>
      				</div>
				</div>
			</div>
		</div>
		
		<form id="couponInsertForm" action="<%= request.getContextPath() %>/admin/event/couponToUser" method="get">
		<div class="modal fade" id="couponInsertModal" tabindex="-1" aria-labelledby="couponInsertModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl" style="max-width:1500px;">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">쿠폰 보내기</h5>
						<button type="button" class="btn-close" data-dismiss="modal"
							aria-label="Close"
							style="border: none; background: white; font-size: 20px;">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" align="center" style="position:relative;">
						<table align="center" style="width:100%">
							<tbody>
								<tr>
									<th width="5%"><label for="coupon-userNo">번호</label></th>
									<td><input type="text" id="coupon-userNo" name="userNo" readonly style="width:100%"></td>
								</tr>
								<tr>
									<th><label for="coupon-userId">이름</label></th>
									<td><input type="text" id="coupon-userId" readonly style="width:100%"></td>
								</tr>
								<tr>
									<th><label for="coupon-userPhone">아이디</label></th>
									<td><input type="text" id="coupon-userPhone" readonly style="width:100%"></td>
								</tr>
								<tr>
									<th><label for="coupon-createDate">가입일</label></th>
									<td><input type="text" id="coupon-createDate" readonly style="width:100%"></td>
								</tr>
							</tbody>
						</table>
						
						
						<img id="coupon-preview" src="" style="object-fit:cover;">
						
						<select class="result-value coupon-select" name="couponNo" style="display:block;width:300px;height:100px;">
							<c:forEach items="${couponList}" var="coupon">
								<option value="${coupon.couponNo }">${coupon.couponTitle }</option>
							</c:forEach>
						</select>
						<div class="select-arrow" style="position:relative;top:-55px;left:100px;"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" onclick="eventSubmit();">등록하기</button>
						<button type="button" id="btn_register" class="btn btn-primary"
	                        data-dismiss="modal">닫기</button>
      				</div>
				</div>
			</div>
		</div>
		</form>
	</section>
</section>
<script>
let houseSock = new SockJS("<%=request.getContextPath()%>/notice"); 
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

function openInsertModal(td){
	let userInfo = td.parentElement.children;
	
	document.getElementById("coupon-userNo").value = userInfo[1].innerText;
	document.getElementById("coupon-userId").value = userInfo[2].innerText;
	document.getElementById("coupon-userPhone").value = userInfo[3].innerText;
	document.getElementById("coupon-createDate").value = userInfo[4].innerText;
	
	$('#couponInsertModal').modal("show");
}

function ArrayInsertModal(){
	let userCheck = document.querySelectorAll("input[name=userCheck]:checked");
	
	document.getElementById("coupon-userNo").value = "";
	document.getElementById("coupon-userId").value = "";
	document.getElementById("coupon-userPhone").value = "";
	document.getElementById("coupon-createDate").value = "";
	
	for(let i = 0; i < userCheck.length; i++){
		let userInfo = userCheck[i].parentElement.parentElement.children;
		if(i == userCheck.length-1){
			document.getElementById("coupon-userNo").value += userCheck[i].value;
			document.getElementById("coupon-userId").value += userInfo[2].innerText;
			document.getElementById("coupon-userPhone").value += userInfo[3].innerText;
			document.getElementById("coupon-createDate").value += userInfo[4].innerText;
		}else {
			document.getElementById("coupon-userNo").value += userCheck[i].value + ",";			
			document.getElementById("coupon-userId").value += userInfo[2].innerText + ",";
			document.getElementById("coupon-userPhone").value += userInfo[3].innerText + ",";
			document.getElementById("coupon-createDate").value += userInfo[4].innerText + ",";
		}
	}
	$('#couponInsertModal').modal("show");
}

$("#coupon-preview").attr("width","300px").attr("height","150px");
$("#coupon-preview").attr('src',"<%= request.getContextPath()%>/"+$('.coupons')[0].dataset.couponpath);
$(".coupon-select").change(function(){
	let no = $(".coupon-select option:selected").val();
	let coupons = $(".coupons");
	
	for(let i = 0; i < coupons.length; i ++){	
		if(no == Number(coupons[i].dataset.couponno)){
			$("#coupon-preview").attr('src',"<%= request.getContextPath()%>/"+coupons[i].dataset.couponpath);
		}
	}
	
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
function eventSubmit(){
	
	let no = $(".coupon-select option:selected").val();
	let coupon = $(".coupons[data-couponNo="+no +"]")[0];
	let couponUserNos = document.getElementById("coupon-userNo").value.split(",");
	for(let i = 0; i<couponUserNos.length ; i++){
		let couponUserNo =couponUserNos[i];
		console.log(couponUserNo);
		var conponContent = coupon.dataset.couponcontent;
		var conponDate = coupon.dataset.coupondate;
		var conponTitle = coupon.dataset.coupontitle;
		sendMessage3(conponContent,conponDate,conponTitle,couponUserNo); 
	}

	 
}

/* let no = $(".coupon-select option:selected").val();
let coupon = $(".coupons[data-couponNo="+no +"]")[0];
console.log(coupon.dataset); */


</script>
		
<script src="<%=request.getContextPath()%>/resources/js/chat/noticeChat.js"></script>	
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />