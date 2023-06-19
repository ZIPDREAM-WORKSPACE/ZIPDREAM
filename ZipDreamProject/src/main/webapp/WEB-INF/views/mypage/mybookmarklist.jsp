<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<style>
.recentContent {
	width: 100%;
	height:450px;
	margin-top:40px;
}
.recentContent>div {
	display: flex;
	flex-direction: column;
	min-height: 400px;
	padding: 0px 10px 0px;
	width: 1200px;
	height: 100%;
	margin: 0px auto;
}

.emptyContent {
	margin-top : 60px;
	display: flex;
	flex: 0 0 auto;
	padding: 100px 0px 50px;
	flex-direction: column;
	align-items: center;
	color: rgb(174, 174, 174);
}

.emptyContent>svg {
	margin-bottom: 20px;
}

.emptyContent>p {
	color: rgb(174, 174, 174);
	font-size: 16px;
	font-weight: 400;
	line-height: 24px;
	text-align: center;
}

/* 가로 스크롤 꾸미기 */
.recentContent li {
	list-style: none;
}

.recentContent a {
	text-decoration: none;
}

.nav {
	width: 100%;
}

.nav ul {
	/* border: 1px solid blue; */
	overflow: hidden;
	font-size: 0;
	white-space: nowrap;
	overflow-x: scroll;
	padding-left: 0px;
    margin-left: 40px;
    margin-right: 40px;
    padding-bottom: 30px;
    
}

.nav ul::-webkit-scrollbar {
    width: 8px;  /* 스크롤바의 너비 */
    height:5px;
}

.nav ul::-webkit-scrollbar-thumb {
    height: 30%; /* 스크롤바의 길이 */
    width:2%;
    background: rgb(23, 31, 69);/* 스크롤바의 색상 */
    border-radius: 10px;
}

.nav ul::-webkit-scrollbar-track {
    background: white; /*스크롤바 뒷 배경 색상*/
}
.nav ul li {
	display: inline-block;
	margin: 0px;
	width: 258px;
	text-align: center;
	margin: 0px 20px 0px 0px;
	/* border: 1px solid green; */
}

.nav ul li a {
	display: block;
	font-size: 15px;
}

/* 카드요소 꾸미기  */
.card {
	width: 100%;
	border: none;
	position:relative;
}

.card-body {
	text-align: left;
	padding: 0px;
}

.card-body>h5 {
	font-weight: 700;
}

.card-body>p {
	font-size: 12px;
	font-weight: 500;
}

.card-text {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	font-size: 13px;
}

.icon {
	font-size: 0px !important;
	position: absolute !important;
	top: 8px !important;
	right: 9px !important;
	z-index: 2 !important;
	color: red !important;
	position:absolute !important;
}

.card-img-top:hover {
	opacity: .8;
}
.card-img-top{
    height: 200px;
    object-fit: cover;
    cursor:pointer;
}

</style>
</head>
<body>
	<jsp:include page="mypage.jsp"/>
	
	<div class="recentContent">
		<div>
			<div class="nav">
		       	<ul id="listWrap" class="rc scrollBar">
		        	
		        </ul>
			</div>
		</div>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
</body>

<script>
	let uno = ${loginUser.userNo};
	let element = document.getElementById("listWrap");
	/* console.log(uno); */
	$(function(){
		element.innerHTML = "";
		$.ajax({
			url: "<%=request.getContextPath()%>/member/mybookmarklist",
			method: "get",
			data: {uno},
			success: function(result){
				/* console.log("성공");
				console.log(result); */
				
				element.innerHTML = "";
				if(result.length>0){
					for(let i=0; i<result.length; i++){
						let sellNo = result[i].sellNo;
						// ajax로 sellDetail에서 정보 가져오기
						$.ajax({
							url: "<%= request.getContextPath() %>/sell/sellList2",
							method: "get",
							data: {sellNo},
							success: function(result){
								
								if(result.length > 0){
									let sellAddress = result[0].sellAddress;
									let sellFloor = result[0].sellFloor;
									let sellName = result[0].sellName;
									let sellPrice = result[0].sellPrice;
									let filePath = result[0].filePath;
									let sellNo = result[0].sellNo;
									
									let url = "";
									if(filePath != null){
										url = "<%= request.getContextPath() %>/resources/sellupfiles/"+filePath;
									}else{
										url = 'https://ifh.cc/g/dtv18m.png';	
									}
									element.innerHTML += '<li id="'+sellNo+'"><div style="position: relative;" calss="card" >'
													  + '<div calss="icon" style="position: absolute;color: red;left: 90%;top: 4px;"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg></div>'
													  + '<img id="'+sellNo+'" class="card-img-top" src="'+url+'">'
													  + '<div class="card-body" style="padding: 0px"><h5 class="card-title">'+sellPrice+'(단위:만원)</h5>'
													  + '<p class="card-text">'+sellName+', '+sellFloor+'</p>'
													  + '<p class="card-text">'+sellAddress+'</p>'+'</div></div>';
								} else{
								/* 	element = document.getElementById("listWrap");
									element.innerHTML += "<div class='emptyContent'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='currentColor' class='bi bi-x-circle' viewBox='0 0 16 16'><path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path d='M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z'/></svg><p>찜한매물이 없습니다.</p></div>"; */
								}
							
								  
							},
							error: function(result){
								console.log("에러");
							}
						})
					}
				}else{
					$(".recentContent").html("<div class='emptyContent' style='margin-top:100px;'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='currentColor' class='bi bi-x-circle' viewBox='0 0 16 16'><path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path d='M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z'/></svg><p>찜한매물이 없습니다.</p></div>");
					
				}
				
			},
			error: function(result){
				console.log("실패");
			}
			
		});
	})
	
	$(document).on('click', '.card-img-top', function(e){
		let sno = $(this).attr("id");
		
		e.preventDefault();
		location.href="<%= request.getContextPath() %>/sell/detail/"+sno;
	});
	
	
	
	
	/* 찜목록 내부 스크롤 마우스 휠 */
	/* function row_scroll(){
        $(".nav ul").on('mousewheel', function(e){
            var wheelDelta = e.originalEvent.wheelDelta;
            
            if(wheelDelta > 0){
                $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

            } else{
                $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
            }
        });
    }

    row_scroll(); */

</script>


</html>