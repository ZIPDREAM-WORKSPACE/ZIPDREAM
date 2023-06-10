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
	height: 450px;
}

.recentContent>div {
	display: flex;
	flex-direction: column;
	min-height: 400px;
	padding: 50px 10px 150px;
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding-left: 50px;
	padding-right: 50px;
}

.emptyContent {
	flex: 0 0 auto;
	padding: 100px 0px 50px;
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
			var recentRoom = JSON.parse(localStorage.getItem("recentRoom"));
			
			console.log(recentRoom);
		});
	</script>
	
	 <div class="recentContent">
        <div class="rc">
   			<!-- 최근본방이 존재하지 않을때  -->
            <!-- <div class="emptyContent">
                <p>최근 본 방이 존재하지 않습니다.</p>
            </div> -->
            <!-- 최근본방이 존재할 경우 -->
            <div class="recentRoomList">
                <div class="sliderinfor">
                    <p>최근 본 방은 최대 20개까지 저장됩니다.</p>
                </div>
                <div class="row row-cols-1 row-cols-md-4 g-4">
                    <div class="col">
                      <div class="card h-100">
                        <img src="https://ifh.cc/g/aoGQoK.jpg" class="card-img-top">
                        <div class="card-body">
                          <h5 class="card-title">전세 1억4천</h5>
                          <p class="card-text">7층, 14.02m², 관리비 8만</p>
                          <p class="card-text">서울특별시 성북구 동선동4가 140</p>
                        </div>
                      </div>
                    </div>
                    <div class="col">
                      <div class="card h-100">
                        <img src="https://ifh.cc/g/DpfhcO.jpg" class="card-img-top">
                        <div class="card-body">
                          <h5 class="card-title">월세 200/125</h5>
                          <p class="card-text">7층, 14.02m², 관리비 8만</p>
                          <p class="card-text">서울특별시 성북구 동선동4가 140</p>
                        </div>
                      </div>
                    </div>
                    <div class="col">
                      <div class="card h-100">
                        <img src="https://ifh.cc/g/9GmptT.jpg" class="card-img-top">
                        <div class="card-body">
                          <h5 class="card-title">전세 4억5천</h5>
                          <p class="card-text">7층, 14.02m², 관리비 8만</p>
                          <p class="card-text">서울특별시 성북구 동선동4가 140</p>
                        </div>
                      </div>
                    </div>
                    <div class="col">
                        <div class="card h-100">
                          <img src="https://ifh.cc/g/DpfhcO.jpg" class="card-img-top">
                          <div class="card-body">
                            <h5 class="card-title">월세 200/125</h5>
                            <p class="card-text">7층, 14.02m², 관리비 8만</p>
                            <p class="card-text">서울특별시 성북구 동선동4가 140</p>
                          </div>
                        </div>
                      </div>
                  </div>
               
            </div>
        </div>
    </div>
    <div class="paging">
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
    </div>
	
	<jsp:include page="../common/footer.jsp" />

	<!-- <script>
	$('.post-wrapper').slick({
		  infinite: true,
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  autoplay: false,
		  arrows : true,
		  dots : true,
		  prevArrow: $('#prevArrow'), // 좌 (이전) 화살표만 변경 (선택자 혹은 $(element))
		  nextArrow: $('#nextArrow')
		  /* autoplaySpeed: 2000, */
		});
	
	$(".slick-dots").css("bottom", "-70px");
	
	</script> -->
</body>
</html>