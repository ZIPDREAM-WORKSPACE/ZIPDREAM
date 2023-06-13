<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<style>
div{
	border: 1px solid red; 
}
.recentContent {
	width: 100%;
	/* height: 300px; */
}

.recentContent>div {
	display: flex;
	flex-direction: column;
	min-height: 400px;
	padding: 50px 10px 150px;
	width: 1200px;
	/* height: 100%; */
	margin: 0px auto;
	padding-left: 50px;
	padding-right: 50px;
    padding-top: 20px;
}
.imgStyle{
	width: 300px;
	height: 200px;
	border-radius: 5px 5px 0px 0px;
}
.divStyle{
	width: 300px;
	padding: 10px;
}
.divStWrap{
	width: 300px;
	height: 200px;
	border: 1px solid lightgray;
}

.imgStyle, .divStWrap:hover{
	cursor: pointer;
}

</style>
</head>
<body>
	<jsp:include page="mypage.jsp"/>
	
	<div class="recentContent">
        <div id="listWrap" class="rc">
        	
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
								element.innerHTML += '<div id="'+sellNo+'" class="infoWrap">'
												  + '<img class="imgStyle goDet" src="<%= request.getContextPath() %>/resources/sellupfiles/'+filePath+'">'
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
		let sno = $(".infoWrap").attr("id");
		
		e.preventDefault();
		location.href="<%= request.getContextPath() %>/sell/detail/"+sno;
	});

</script>

</html>