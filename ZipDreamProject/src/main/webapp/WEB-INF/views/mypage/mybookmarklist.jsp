<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<style>
div{
	/* border: 1px solid red;  */
}
.recentContent{
	width: 100%;
	height: 450px;
}
.recentContent>div {
	display: flex;
	min-height: 400px;
	padding: 50px 10px 150px;
	width: 1200px;
	/* width: 1110px; */
	/* height: 100%; */
	margin: 0px auto;
	/* padding-left: 50px; */
	padding-right: 50px;
    padding-top: 20px;
	flex-direction: row;
	
}
.imgStyle{
	border: 1px solid lightgray;
	object-fit: cover;
	width: 300px;
	height: 200px;
	border-radius: 5px 5px 2px 2px;
}
.imgStyle:hover{
	
	transform: scale(1.4);
	transition: all 0.5s linear;
}
.divStyle{
	width: 300px;
	padding: 10px;
}
.divStWrap{
	width: 300px;
	height: 200px;
	border: 1px solid lightgray;
	border-top: 1px solid white;
	box-shadow: 0px 15px 5px -2px gray;
}

.imgStyle, .divStWrap:hover{
	cursor: pointer;
}
.infoWrap{
	width: 300px;
	height: 400px;
	margin-right: 30px;
	margin-left: 30px;
}
/* #listWrap{
	width: 100%;
} */

.scrollBar {
	width: 1110px;
    height: 200px;
	overflow-x:scroll;
	overflow-y: hidden;
	margin-top: 10px;
}

.scrollBar::-webkit-scrollbar {
	 width:1110px ;  /* 스크롤바의 너비 */
}

.scrollBar::-webkit-scrollbar-thumb {
	width:10%;
	height:10%;
	background: black; /* 스크롤바의 색상 */
	border-radius: 5px;
}
.emptyContent {
	display:flex;
	flex: 0 0 auto;
	padding: 100px 0px 50px;
    flex-direction: column;
    align-items: center;
    color: rgb(174, 174, 174);
}
.emptyContent>svg{
	margin-bottom:20px;
}

.emptyContent>p {
	color: rgb(174, 174, 174);
	font-size: 16px;
	font-weight: 400;
	line-height: 24px;
	text-align: center;
}

</style>
</head>
<body>
	<jsp:include page="mypage.jsp"/>
	
	<div class="recentContent">
        <div id="listWrap" class="rc scrollBar">
        	
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
</body>

<script>
	let uno = ${loginUser.userNo};
	/* console.log(uno); */
	$(function(){
		$.ajax({
			url: "<%= request.getContextPath() %>/member/mybookmarklist",
			method: "get",
			data: {uno},
			success: function(result){
				/* console.log("성공");
				console.log(result); */
				
				let element = document.getElementById("listWrap");
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
								/* console.log("내가 찜한: "+result.length); */
								
								if(result.length > 0){
									let sellAddress = result[0].sellAddress;
									let sellFloor = result[0].sellFloor;
									let sellName = result[0].sellName;
									let sellPrice = result[0].sellPrice;
									let filePath = result[0].filePath;
									let sellNo = result[0].sellNo;
									/* console.log(result[0]); */
									element.innerHTML += '<div id="'+sellNo+'" class="infoWrap" style="display: inline-block;">'
													  + '<div style="overflow: hidden;"><img class="imgStyle goDet" src="<%= request.getContextPath() %>/resources/sellupfiles/'+filePath+'"></div>'
													  + '<div class="divStWrap goDet"><div class="divStyle" style="font-size:20px; font-weight: 500; margin-top: 10px;">'+sellPrice+'억</div>'
													  + '<div class="divStyle" style="font-size:14px;">'+sellName+', '+sellFloor+'</div>'
													  + '<div class="divStyle">'+sellAddress+'</div>'+'</div></div>';
								} else{
									element = document.getElementById("listWrap");
									element.innerHTML += "<div class='emptyContent'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='currentColor' class='bi bi-x-circle' viewBox='0 0 16 16'><path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path d='M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z'/></svg><p>찜한매물이 없습니다.</p></div>";
								}
							
								  
							},
							error: function(result){
								console.log("에러");
							}
						})
					}
				}else{
					element.innerHTML += "<div class='emptyContent'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='currentColor' class='bi bi-x-circle' viewBox='0 0 16 16'><path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path d='M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z'/></svg><p>찜한매물이 없습니다.</p></div>";
					
				}
				
			},
			error: function(result){
				console.log("실패");
			}
			
		})
	})
	
	$(document).on('click', '.infoWrap', function(e){
		let sno = $(this).attr("id");
		
		e.preventDefault();
		location.href="<%= request.getContextPath() %>/sell/detail/"+sno;
	});

</script>

</html>