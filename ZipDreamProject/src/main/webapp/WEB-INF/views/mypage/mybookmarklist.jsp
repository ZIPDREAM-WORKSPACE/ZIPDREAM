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
	
</style>
</head>
<body>
	<jsp:include page="mypage.jsp"/>
	
	<div class="recentContent">
        <div class="rc">
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
						data: {"sellNo", sellNo},
						success: function(result){
							console.log(result);
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
</script>

</html>