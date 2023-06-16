<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<style>
.recentContent{
	height: 450px;
}
.recentContent>div {
	display: flex;
	min-height: 400px;
	padding: 50px 10px 150px;
	width: 1110px;
	margin: 0px auto;
	padding-right: 50px;
    padding-top: 20px;
	flex-direction: row;
	
}
.imgStyle{
	border: 1px solid lightgray;
	object-fit: contain;
	width: 300px;
	height: 200px;
	border-radius: 5px 5px 2px 2px;
}
.imgStyle:hover{
	border: 1px solid lightgray;
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
	background: black; /* 스크롤바의 색상 */
	border-radius: 5px;
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
	console.log(uno);
	$(function(){
		$.ajax({
			url: "<%= request.getContextPath() %>/member/mybookmarklist",
			method: "get",
			data: {uno},
			success: function(result){
				console.log("성공");
				console.log(result);
				
				if(result.length>0){
				
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

								let url = ""; 
								const element = document.getElementById("listWrap");
								if(filePath != null){
									url = "<%= request.getContextPath() %>/resources/sellupfiles/"+filePath;
								}else{
									url = 'https://ifh.cc/g/dtv18m.png';	
								}
								element.innerHTML += '<div id="'+sellNo+'" class="infoWrap" style="display: inline-block;">'
												  + '<div style="overflow: hidden;">'
												  	+'<img class="imgStyle goDet" src="'+url+'">'
												  + '</div>'
												  + '<div class="divStWrap goDet"><div class="divStyle" style="font-size:20px; font-weight: 500; margin-top: 10px;">'+sellPrice+'억</div>'
												  + '<div class="divStyle" style="font-size:14px;">'+sellName+', '+sellFloor+'</div>'
												  + '<div class="divStyle">'+sellAddress+'</div>'+'</div></div>';
						
							  
						},
						error: function(result){
							console.log("에러");
						}
					})
				}
				}else{
					let element = document.getElementById("listWrap");
					element.innerHTML += '<p style="font-weight:500; color: gray;">찜한 매물이 없습니다.</p>';
					
				}
				
			},
			error: function(result){
				console.log("실패");
			}
			
		});
	})
	
	$(document).on('click', '.infoWrap', function(e){
		let sno = $(this).attr("id");
		
		e.preventDefault();
		location.href="<%= request.getContextPath() %>/sell/detail/"+sno;
	});

</script>

</html>