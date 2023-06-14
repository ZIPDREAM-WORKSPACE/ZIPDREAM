<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.sliderinfor {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	margin-bottom: 20px;
}

.sliderinfor>p {
	color: rgb(174, 174, 174);
	font-size: 14px;
	font-weight: 400;
	line-height: 20px;
}

.card-title {
	font-weight: 700;
}

.card-text {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	font-size: 13px;
	margin-bottom: 0px;
}

.paging {
	display: flex;
	flex-direction: column;
	width: 1200px;
	margin: 0px auto;
	align-items: center;
}
.card{
   cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="mypage.jsp"/>
	
	<script>
		$(function(){
			var userNo = "${loginUser.userNo}"
			var recentRoom = JSON.parse(localStorage.getItem(userNo));
			var sellNo = recentRoom.sellNo;
			const now = new Date();
			var html ="";
			console.log(recentRoom);
			
			if(recentRoom != null){
				if(now.getTime() > recentRoom.expire){
					window.localStorage.clear();
					location.reload();
				}else{
					$.ajax({
						url:"<%=request.getContextPath()%>/mypage/recentRoomList",
						method:"get",
						data:{sellNo},
						success:function(result){
							console.log(result);
						},
						error:function(result){
							console.log("에러발생");
						}
					});
						
				}
			}else{
				html = "<div class='emptyContent'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='currentColor' class='bi bi-x-circle' viewBox='0 0 16 16'><path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path d='M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z'/></svg><p>최근 본 방이 존재하지 않습니다.</p></div>";
			}
			
			$('.rc').append(html);

			
		});
	</script>
	
	 <div class="recentContent">
        <div class="rc">
        </div>
    </div>
    <!-- <div class="paging">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
        </nav>
    </div> -->
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>