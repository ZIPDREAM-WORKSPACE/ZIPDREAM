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
	height: 450px;
}
.recentContent>div {
	display: flex;
	min-height: 400px;
	padding: 50px 10px 150px;
	/* width: 1200px; */
	width: 1110px;
	/* height: 100%; */
	margin: 0px auto;
	/* padding-left: 50px; */
	padding-right: 50px;
    padding-top: 20px;
	flex-direction: row;
	
}
.imgStyle{
	object-fit: cover;
	width: 300px;
	height: 200px;
	border-radius: 5px 5px 0px 0px;
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
#listWrap{
	margin-left: 400px;
}

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
	background: #171F45; /* 스크롤바의 색상 */
	border-radius: 5px;
	/* border: 10px solid #171F45; */
}
/* .scrollBar::-webkit-scrollbar-track{
	background-color: rgba(0,0,0,0); /* 스크롤바 뒷 배경을 투명 처리한다 */
}  */

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
	console.log(uno);
	$(function(){
		$.ajax({
			url: "<%= request.getContextPath() %>/member/mybookmarklist",
			method: "get",
			data: {uno},
			success: function(result){
				console.log("성공");
				console.log(result);
				
				for(let i=0; i<result.length; i++){
					let sellNo = result[i].sellNo;
					// ajax로 sellDetail에서 정보 가져오기
					$.ajax({
						url: "<%= request.getContextPath() %>/sell/sellList2",
						method: "get",
						data: {sellNo},
						success: function(result){
							console.log(result);
							
							let sellAddress = result[0].sellAddress;
							let sellFloor = result[0].sellFloor;
							let sellName = result[0].sellName;
							let sellPrice = result[0].sellPrice;
							let filePath = result[0].filePath;
							let sellNo = result[0].sellNo;
							console.log(result[0]);
							
								const element = document.getElementById("listWrap");
								element.innerHTML += '<div id="'+sellNo+'" class="infoWrap" style="display: inline-block;">'
												  + '<div style="overflow: hidden;"><img class="imgStyle goDet" src="<%= request.getContextPath() %>/resources/sellupfiles/'+filePath+'"></div>'
												  + '<div class="divStWrap goDet"><div class="divStyle" style="font-size:20px; font-weight: 500; margin-top: 10px;">'+sellPrice+'억</div>'
												  + '<div class="divStyle" style="font-size:14px;">'+sellName+', '+sellFloor+'</div>'
												  + '<div class="divStyle">'+sellAddress+'</div>'+'</div></div>';
						
							  
						},
						error: function(result){
							console.log("에러");
						}
					})
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