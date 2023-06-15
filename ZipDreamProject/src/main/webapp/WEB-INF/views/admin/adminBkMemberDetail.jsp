<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
	<section class="content-section">
		<div class="content-title">
			<h1>공인중개사 승인</h1>
		</div>
		<div class="content-bk-title">
			<input id="bk-userNo" type="hidden" value="${member.userNo }">	
			<h2 class="bk-userName">${member.userName}</h2>
			<div class="bk-enrollDateTime">${member.enrollDateTime}</div>
			<button class="btn btn-lg btn-primary" onclick="bkAccept('Y');">승인</button>
			<button class="btn btn-lg btn-danger" onclick="bkAccept('N');">거절</button>
		</div>
		<div style="object-fit:contain;">
			<div id="bk-img-slick">
				<div id="bk-img0" class="bk-images" style="background-image: url('<%=request.getContextPath()+"/" %>${attachment[0].filePath.replace('\\','/')}${attachment[0].changeName}')"></div>
				<div id="bk-img1" class="bk-images" style="background-image: url('<%=request.getContextPath()+"/" %>${attachment[1].filePath.replace('\\','/')}${attachment[1].changeName}')"></div>
				<div id="bk-img2" class="bk-images" style="background-image: url('<%=request.getContextPath()+"/" %>${attachment[2].filePath.replace('\\','/')}${attachment[2].changeName}')"></div>
			</div>
		</div>
		<div class="bk-info-1">
			<p>공인중개사 이름</p>
			<p>주소</p>
			<input class="bk-office" type="text" value="${member.office}" readonly>
			<input class="bk-address" type="text" value="${member.address}" readonly>	
			<p>아이디</p>
			<p>핸드폰 번호</p>	
			<input class="bk-userId" type="text" value="${member.userId }" readonly>
			<input class="bk-phone" type="text" value="${member.phone }" readonly>
		</div>
	</section>
	
	<section class="content-side">
		<div id="bk-list-slick">
			<c:forEach items="${list}" var="user">
				<div>
					<div class="content-main-apply-item bk-user-list" data-uno="${user.userNo}" onclick="viewBk(${user.userNo});">
						<div class="apply-item-wrap" style="margin:0px;">
							<div class="apply-item-circle"></div>
							<div class="apply-item-line" style="height:50px;"></div>
						</div>
						<div style="margin-top: 10px;">
							<h5>${user.userName }</h5>
							<p class="text-gray">${user.applyDateTime }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</section>

<script>
$(function() {
	$('#bk-img-slick').slick({
		slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
		infinite : true, //무한 반복 옵션	 
		slidesToShow : 1, // 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
		speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, // 옆으로 이동하는 화살표 표시 여부
		dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
		autoplay : false, // 자동 스크롤 사용 여부
		autoplaySpeed : 3000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : false, // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false, // 세로 방향 슬라이드 옵션
		prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-next'>Next</button>",	 	// 다음 화살표 모양 설정
		draggable : true, //드래그 가능 여부 
	});
	
	currentIndex = 0;
	if($(".bk-user-list").length > 10){
		$(".bk-user-list").each(function(index){
			if($(this).data('uno') == currentUserNo){
				currentIndex = index;
			}
		});
	}
	
	$('#bk-list-slick').slick({
		slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
		infinite : true, //무한 반복 옵션	 
		slidesToShow : 10, // 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 10,//스크롤 한번에 움직일 컨텐츠 개수
		speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : false, // 옆으로 이동하는 화살표 표시 여부
		dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
		autoplay : false, // 자동 스크롤 사용 여부
		autoplaySpeed : 3000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : false, // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : true, // 세로 방향 슬라이드 옵션
		verticalSwiping: true,
		draggable : true, //드래그 가능 여부 
		initialSlide : currentIndex
	});
	$(".bk-user-list[data-uno="+ ${member.userNo } +"]").css('background-color','#0069D9').css('color','#fff');
	
});
	currentUserNo = ${member.userNo};

	function bkAccept(answer) {
		
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/bkAccept",
			method:"get",
			data:{userNo : currentUserNo, answer, userId : $(".bk-userId").val()},
			dataType:"text",
			success:function(result){
				if(result = 1){					
					location.href="<%= request.getContextPath()%>/admin/bkmember";
				}else{
					console.log("error");
				}
			},
			error:function(){
				console.log("에러발생");
			}
			
		 })
	}
	
	function viewBk(userNo) {
		$(".bk-user-list[data-uno="+ currentUserNo +"]").css('background-color','#FFFFFF').css('color','#000');
		currentUserNo = userNo;
		document.getElementById("bk-userNo").value = userNo;
		$(".bk-user-list[data-uno="+ currentUserNo +"]").css('background-color','#0069D9').css('color','#fff');
		
		document.getElementById("bk-img0").style.backgroundImage = "";
		document.getElementById("bk-img1").style.backgroundImage = "";
		document.getElementById("bk-img2").style.backgroundImage = "";
		
		$.ajax({
			  url : "<%= request.getContextPath() %>/admin/getBkUserInfo",
			  method: "get",
			  data: {userNo},
			  contentType:'application/json;charset=utf-8',
	    	  dataType:'json',
			  success : function(result){
				  $(".bk-userName").text(result.member.userName);
				  
				  let enrollDate = new Date(result.member.enrollDateTime);
				  let dateString = enrollDate.getFullYear()+ "-"
				  					+((enrollDate.getMonth()+1)<10?"0"+(enrollDate.getMonth()+1):(enrollDate.getMonth()+1)) + "-"
				  					+((enrollDate.getDate())<10?"0"+(enrollDate.getDate()):(enrollDate.getDate()));
				  
				  $(".bk-enrollDateTime").text(dateString);
				  $(".bk-office").val(result.member.office);
				  $(".bk-userId").val(result.member.userId);
				  $(".bk-address").val(result.member.address);
				  $(".bk-phone").val(result.member.phone);
				  if(result.array[0] != null){
					  document.getElementById("bk-img0").style.backgroundImage = "url('<%= request.getContextPath()%>/"+result.array[0].filePath.replace(/\\/g, '/')+result.array[0].changeName+"')";
				  }
				  if(result.array[1] != null){
					  document.getElementById("bk-img1").style.backgroundImage = "url('<%= request.getContextPath()%>/"+result.array[1].filePath.replace(/\\/g, '/')+result.array[1].changeName+"')";					  
				  }
				  if(result.array[2] != null){
					  document.getElementById("bk-img2").style.backgroundImage = "url('<%= request.getContextPath()%>/"+result.array[2].filePath.replace(/\\/g, '/')+result.array[2].changeName+"')";  
				  }
			  },
              error: function(){
                  console.log("error");
               }
                  
        });
		
	}
</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />