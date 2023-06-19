<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- CSS only -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 <!-- JavaScript Bundle with Popper -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
	.content1 {
		border-bottom: 4px solid #6E7C7C;
		width: 80%;
		height: 15rem;
		display: flex;
		justify-content: space-evenly;
		align-items: center;
	}
	
	.margin {
		margin: 0 auto;
	}
	
	.radius {
		border-radius: 30px;
	}
	
	.sell_title {
		width: 50%;
		height: 90%;
		display: flex;
		flex-direction: column;
		justify-content: space-around;
	}
	
	.sell_no {
		border: 1px solid lightgray;
		width: 13%;
		height: 10%;
		margin-top: 20px;
	}
	
	.sell_no>span {
		font-size: 0.6rem;
		margin-left: 5px;
	}
	
	.sell_name>p {
		font-size: 4rem;
		font-weight: 700;
		color: #0A2647;
		margin: 0px;
	}
	
	.sell_last {
		display: flex;
		justify-content: flex-start;
	}
	
	.sell_address, .seller_address {
		width: 70%;
		font-size: 0.8rem;
		color: #6E7C7C;
	}
	
	#like_img {
		vertical-align: sub;
		margin: 5px 0px 0px 14px;
	}
	
	.line {
		margin-left : 60px;
		border: 1px solid #6E7C7C;
		height: 80%;
	}
	/*공인중개사 연락하기*/
	.seller {
		width: 30%;
		height: 70%;
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;
	}
	
	.seller_title {
		font-size: 2rem;
		font-weight: 500;
	}

	.content2.5{
		margin-top:50px;
		text-align:center;
	}
	
	#p{
		font-size: 1rem;
		font-weight: 600;
	}
	.con2Text1, .con2Text2{
		display: flex;
		justify-content: center;
	} 
	.price_msg{
	display: flex;
	}
	.picture_one, .picture_two {
		display: inline-block;
	}
	.object{
		object-fit : cover;	
	}
	
	#picture {
		display: flex;
		align-items: center;
	}
	
	.content {
		width: 70%;
		margin-top: 50px;
	}
	
	.content3 {
		width: 70%;
		height: 20rem;
	}
	
	.price_name, .info_name, .arround_name, .option_name, .othier_infom, .sale_name{
		font-size: 1.5rem;
		font-weight: 600;
	}
	.price, .info, .arround, .option, .sale {
		width: 90%;
	}
	#secondImg{
		margin-left: 14%;
	}
	.content4 {
		height: 90rem;
	}

	.content5 {
		height: 15rem;
		margin-top : 20px;
	}
	.content6{
		margin-top : 100px;
	}
	.table>tbody>tr>th {
		width: 15%;
	}
	.content9 {
		text-align: center;
	}
	
	.last_btn {
		width: 10%;
		background-color: #2C74B3;
		color: white;
		border: none;
	}
	
	.submit {
		margin-right: 50px;
	}
	.block{
		height:30rem;
	}
</style>
</head>
<body>
	<jsp:include page="../../views/common/header.jsp" />
	
	 <form action="<%=request.getContextPath()%>/sell/sellInsert" enctype="multipart/form-data" method="post">
        <div class="content1 margin">
            <div class="sell_title">
                    <span><input type="hidden" name="sellNo" value="${empty sd.sellNo ? 0 : sd.sellNo}"></span>
                <div class="sell_name">
                    <p><input type="text" name="sellName" size="20" placeholder="매물명을 입력해주세요" required ></p>
                </div>
                <div class="sell_last">
                    <div class="sell_address">매물주소 : <input type="text" name="sellAddress" placeholder="해당 매물의 주소를 입력해주세요" size="100" required>
                     <input type="hidden" size="10" name="refUno" value="${sessionScope.loginUser.userNo }">
                    </div>
                </div>
                 <input type="hidden" size="10" name="refUno" value="${sessionScope.loginUser.userNo }">
            </div>
            <!-- <div class="line"></div> -->
           <%--  <div class="seller">
                <div class="seller_title">
                	 <p>내돈내산공인중개소</p> 
                    <input type="text" size="15" name="sellAgent" value="${sessionScope.loginUser.office }">
                </div>
                <div class="seller_name">
                	<p>김예진</p> 
                   <input type="hidden" size="10" name="refUno" value="${sessionScope.loginUser.userNo }">
                </div>
                <div class="seller_address">
                	 <p>서울특별시 강남구 테헤란로 14길 6 남도빌딩</p> 
                    <input type="text" size="50" name="sellerAddress" value="${sessionScope.loginUser.address }">
                </div>
            </div> --%>
        </div>
        
        <div class="content2.5 margin content">
		<div >
			<div class="con2Text1 ">
				<img src="https://ifh.cc/g/LZwHml.png" width="25" height="25">
				<p id="p">공인중개사님이 직접 매물을 등록할 수 있는 페이지 입니다.</p>
			</div>
			<div class="con2Text2">
				<img src="https://ifh.cc/g/LZwHml.png" width="25" height="25">
				<p id="p">해당 매물이 허위매물로 의심이 되거나 신고가 접수될 경우 검토를 통해 제재를 가할예정입니다.</p>
			</div>
			<div class="con2Text2">
				<img src="https://ifh.cc/g/LZwHml.png" width="25" height="25">
				<p id="p">해당 정보 제공에 대한 책임은 공인중개사에게 있으므로, 정확한 정보를 입력해주시길 바랍니다.</p>
			</div>
			<div class="con2Text2">
				<img src="https://ifh.cc/g/LZwHml.png" width="25" height="25">
				<p id="p">대표사진은 반드시 "1장 이상" 첨부파일로 추가해주셔야 정상적으로 매물이 등록됩니다.</p>
			</div>
		</div>
	</div>
        
        <div class="content2 margin picture content">
            <div id="picture">
               <!--  <img class="left arrow" src="https://ifh.cc/g/3FMvAh.png" width="50px" style="display: none;"> -->
                <div id="file-area" style="display:none;">
                    <input type="file" id="file1" name="imges" accept="images/*" required onchange="loadImg(this, 1);" >
                    <input type="file" id="file2" name="imges" accept="images/*" onchange="loadImg(this, 2);" >
                    <input type="file" id="file3" name="imges" accept="images/*" onchange="loadImg(this, 3);" >
                    <input type="file" id="file4" name="imges" accept="images/*" onchange="loadImg(this, 4);" >
                    <input type="file" id="file5" name="imges" accept="images/*" onchange="loadImg(this, 5);" >
                    <input type="file" id="file6" name="imges" accept="images/*" onchange="loadImg(this, 6);" >
                    <input type="file" id="file7" name="imges" accept="images/*" onchange="loadImg(this, 7);" >
                    <input type="file" id="file8" name="imges" accept="images/*" onchange="loadImg(this, 8);" >
                    <input type="file" id="file9" name="imges" accept="images/*" onchange="loadImg(this, 9);" >
                    <input type="file" id="file10" name="imges" accept="images/*" onchange="loadImg(this, 10);" >
                    <input type="file" id="file11" name="imges" accept="images/*" onchange="loadImg(this, 11);" >
                    <input type="file" id="file12" name="imges" accept="images/*" onchange="loadImg(this, 12);" >
                    <input type="file" id="file13" name="imges" accept="images/*" onchange="loadImg(this, 13);" >
                    <input type="file" id="file14" name="imges" accept="images/*" onchange="loadImg(this, 14);" >
                    <input type="file" id="file15" name="imges" accept="images/*" onchange="loadImg(this, 15);">
                </div>
                <div>
                    
                    <div class="picture_one margin">
                        <table>
                            <tr>
                                <td colspan="3" rowspan="3" align="center"> <!-- 미리보기 -->
                                <img id="titleImg" class="object" width="400" height="600">
                                </td>
                            </tr>
                            <tr>
                                <td><img id="contentImg1 " class="object" width="300" height="300"></td>
                                <td><img id="contentImg2 " class="object" width="300" height="300"></td>
                                <td><img id="contentImg3 " class="object" width="300" height="300"></td>
                            </tr>
                            <tr>
                                <td><img id="contentImg4 " class="object" width="300" height="300"></td>
                                <td><img id="contentImg5 " class="object" width="300" height="300"></td>
                                <td><img id="contentImg6 " class="object" width="300" height="300"></td>
                            </tr>
                        </table>
                    </div>
                  <!--   <div class="picture_two" style="display: none;">
                        <table>
                            <tr>
                                <td><img id="contentImg7" width="300" height="300"></td>
                                <td><img id="contentImg8" width="300" height="300"></td>
                                <td><img id="contentImg9" width="300" height="300"></td>
                                <td><img id="contentImg10" width="300" height="300"></td>
                            </tr>
                            <tr>
                                <td><img id="contentImg11" width="300" height="300"></td>
                                <td><img id="contentImg12" width="300" height="300"></td>
                                <td><img id="contentImg13" width="300" height="300"></td>
                                <td><img id="contentImg14" width="300" height="300"></td>
            
                            </tr>
                        </table>
                    </div>  -->
                </div>
                 <!-- <img class="right arrow" src="https://ifh.cc/g/JLqn6q.png" width="50">  -->
            </div>
        </div>

        <div class="content3 margin content">
            <p class="price_name">[가격정보]</p>
            <div class="price_msg">
				<img src="https://ifh.cc/g/LZwHml.png" width="25" height="25">
				<p id="p">매물에 대한 정보를 필수로 입력해주셔야 하며, 정보가 없을 경우 "-"를 입력해주세요.</p>
            </div>
            <div class="price margin">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>*매매가</th>
                            <td><input type="text" name="sellPrice" required size="100" placeholder="해당 매물의 매매가를 '만단위'로 입력해주세요.(ex. 17억 5000만원 => 175000)"></td>
                        </tr>
                        <tr>
                            <th>*관리비</th>
                            <td><input type="text" name="sellMaintenance"  required size="100" placeholder="해당 매물의 관리비를 입력해주세요. (ex. 10만원, 20만원)"></td>
                        </tr>
                        <tr>
                            <th>*주차</th>
                            <td><input type="text" name="sellParking" required  size="100" placeholder="해당 매물의 주차가능여부를 입력해주세요(정보가 없을 경우 '-'입력)"></td>
                        </tr>
                        <tr>
                            <th>*단기임대</th>
                            <td><input type="text" name="sellShortterm"  required size="100" placeholder="해당 매물의 단기임대가능여부를 입력해주세요.(정보가 없을 경우 '-'입력)"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="content4 margin content">
            <p class="info_name">[상세정보]</p>
             <div class="price_msg">
				<img src="https://ifh.cc/g/LZwHml.png" width="25" height="25">
				<p id="p">매물에 대한 상세정보 입련란입니다.</p>
            </div>
            <div class="margin">
            	<input type="file" class="object" id="secondfile" name="imges" onchange="loadSeconImg(this, 1)" style="display:none;">
            	<img id="secondImg" width="900" height="500">
            </div>
            <div class="info margin">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>건물 종류</th>
                            <td><input type="text" name="sellType"  size="100" placeholder="해당 매물의 건물유형을 입력해주세요."></td>
                        </tr>
                        <tr>
                            <th>전용/공급면적</th>
                            <td><input type="text" name="sellPrivateArea" size="40" placeholder="해당 매물의 전용면적을 숫자만 입력해주세요.">m²/<input type="text" name="sellProvideArea"  size="40" placeholder="해당 매물의 공급면적을 숫자만 입력해주세요.">m²</td>
                        </tr>
                        <tr>
                            <th>해당층/건물층</th>
                            <td><input type="text" name="sellFloor" size="45" placeholder="해당 매물의 층 수를 숫자만 입력해주세요.">층/<input type="text" name="sellAllFloor" size="45" placeholder="해당 매물의 건물 층 수를 입력해주세요.">층</td>
                        </tr>
                        <tr>
                            <th>방수/욕실수</th>
                            <td><input type="text" name="sellRoomCount" size="45" placeholder="해당 매물의 방 개수를 입력해주세요.">개/<input type="text" name="sellToiletCount"  size="45" placeholder="해당 매물의 건물 층 수를 숫자만 입력해주세요.">개</td>
                        </tr>
                        <tr>
                            <th>방향</th>
                            <td><input type="text" name="sellWay"  size="100" placeholder="해당 매물이 향해있는 방향을 입력해주세요."></td>
                        </tr>
                        <tr>
                            <th>해당 면적 세대수</th>
                            <td><input type="text" name="sellHousehold"  size="100" placeholder="해당 매물의 면적 세대수를 입력해주세요.">세대</td>
                        </tr>
                        <tr>
                            <th>현관타입</th>
                            <td><input type="text" name="sellEntrance"  size="100" placeholder="해당 매물의 현관/복도 타입을 입력해주세요."></td>
                        </tr>
                        <tr>
                            <th>입주가능일</th>
                            <td><input type="text" name="sellMoveDatetime"  size="100" placeholder="해당 매물의 입주가능한 일자를 입력해주세요. ex)즉시입주, 2023.06.14.."></td>
                        </tr>
                        <tr>
                            <th>건축물용도</th>
                            <td><input type="text" name="sellBuldtype"  size="100" placeholder="해당 매물의 건축물 용도를 입력해주세요."></td>
                        </tr>
                        <tr>
                            <th>승강시설</th>
                            <td><input type="text" name="sellInstallation"  size="100" placeholder="해당 매물의 승강시설을 입력해주세요."></td>
                        </tr>
                        <tr>
                            <th>냉/난방시설</th>
                            <td><input type="text" name="sellAircondition"  size="45" placeholder="해당 매물의 냉방시설을 입력해주세요.">/<input type="text" name="sellHeating" size="45" placeholder="해당 매물의 난방시설을 입력해주세요."></td>
                        </tr>
                        <tr>
                            <th>세대주차대수</th>
                            <td><input type="text" name="parkingCount" size="100" placeholder="해당 매물의 세대별 주차가능한 수를 입력해주세요.">대</td>
                        </tr>
                        <tr>
                            <th>사용승인일</th>
                            <td><input type="text" name="sellApprovalDatetime"  size="100" placeholder="해당 매물의 사용승인일을 입력해주세요. ex)2023.06.14"></td>
                        </tr>
                        <tr>
                            <th>최초등록일</th>
                            <td><input type="text" name="sellEnrollDatetime"  size="100" placeholder="해당 매물의 최초등록일을 입력해주세요. ex)2023.06.14"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="content5 margin content">
            <p class="arround_name">[단지정보]</p>
             <div class="price_msg">
				<img src="https://ifh.cc/g/LZwHml.png" width="25" height="25">
				<p id="p">해당 매물의 단지정보 입력란입니다.</p>
            </div>
            <div class="arround margin">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>단지사용승인일</th>
                            <td><input type="text" name="complexApplyDatetime"  size="100" placeholder="해당 매물이 속해있는 단지사용승인일을 입력해주세요. ex)2023.06.14"></td>
                        </tr>
                        <tr>
                            <th>총 동 수</th>
                            <td><input type="text" name="wingCount"  size="100" placeholder="해당 매물이 속해있는 단지의 총 동수를 입력해주세요.">동</td>
                        </tr>
                        <tr>
                            <th>총 세대 수</th>
                            <td><input type="text" name="householdCount"  size="100" placeholder="해당 매물이 속해있는 총 세대 수를 입력해주세요.">세대</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="content6 margin content">
            <p class="option_name">[옵션정보]</p>
             <div class="price_msg">
				<img src="https://ifh.cc/g/LZwHml.png" width="25" height="25">
				<p id="p">해당 매물의 옵션 및 보안시설 정보입니다.</p>
            </div>
            <div class="option margin">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>기본옵션</th>
                            <td><input type="text" name="option"  size="100" placeholder="해당 매물에서 기본적으로 제공하고 있는 옵션을 입력해주세요."></td>
                        </tr>
                        <tr>
                            <th>보안시설</th>
                            <td><input type="text" name="security"  size="100" placeholder="해당 매물에서 제공하고 있는 보안시설을 입력해주세요."></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="content9 content margin">
            <button type="submit" class="submit last_btn">등록하기</button>
            <input type="button" class="cansle last_btn" value="뒤로가기">
        </div>
    </form>
    
    <div class="block"></div>
    <jsp:include page="../../views/common/footer.jsp" />
</body>

<script>
	$(function() {
		$(".market").on("click", function() {
			$(".market_info").show();
			$(".subway_info").hide();
			$(".school_info").hide();
			$(".hospital_info").hide();
		})
		$(".subway").on("click", function() {
			$(".market_info").hide();
			$(".subway_info").show();
			$(".school_info").hide();
			$(".hospital_info").hide();
		})
		$(".hospital").on("click", function() {
			$(".market_info").hide();
			$(".subway_info").hide();
			$(".school_info").hide();
			$(".hospital_info").show();
		})
		$(".school").on("click", function() {
			$(".market_info").hide();
			$(".subway_info").hide();
			$(".school_info").show();
			$(".hospital_info").hide();
		})
	})

	$(function() {
		$("#titleImg").click(function() {
			$("#file1").click();
		});
		
		$("#secondImg").click(function(){
			$("#secondfile").click();
		});
		
		$("[id^=contentImg]").each(function(index, item) {
			$(item).click(function() {
				$("#file" + (index + 2)).click();
			})

		})

	})
	
 	function loadSeconImg(inputFile, num){
		if (inputFile.files.length != 0) {
			let reader = new FileReader();

			reader.readAsDataURL(inputFile.files[0]);

			reader.onload = function(e) {

				let url = e.target.result;
				
				switch(num){
				case 1 : $("#secondImg").attr("src",url); break;
			}
		}

		}else{
			switch(num){
			case 1 : $("#secondImg").attr("src",url); break;
		}
	  }
	}
 
	function loadImg(inputFile, num) {
		console.log(inputFile.files.length);
		if (inputFile.files.length != 0) {
			let reader = new FileReader();

			reader.readAsDataURL(inputFile.files[0]);

			reader.onload = function(e) {

				let url = e.target.result;

				switch (num) {
				case 1:$("#titleImg").attr("src", url);break;
				case 2:$("#contentImg1").attr("src", url);break;
				case 3:$("#contentImg2").attr("src", url);break;
				case 4:$("#contentImg3").attr("src", url);break;
				case 5:$("#contentImg4").attr("src", url);break;
				case 6:$("#contentImg5").attr("src", url);break;
				case 7:$("#contentImg6").attr("src", url);break;
				case 8:$("#contentImg7").attr("src", url);break;
				case 9:$("#contentImg8").attr("src", url);break;
				case 10:$("#contentImg9").attr("src", url);break;
				case 11:$("#contentImg10").attr("src", url);break;
				case 12:$("#contentImg11").attr("src", url);break;
				case 13:$("#contentImg12").attr("src", url);break;
				case 14:$("#contentImg13").attr("src", url);break;
				case 15:$("#contentImg14").attr("src", url);break;
				
				}
			}
		} else {
			switch (num) {
			case 1:$("#titleImg").attr("src", url);break;
			case 2:$("#contentImg1").attr("src", url);break;
			case 3:$("#contentImg2").attr("src", url);break;
			case 4:$("#contentImg3").attr("src", url);break;
			case 5:$("#contentImg4").attr("src", url);break;
			case 6:$("#contentImg5").attr("src", url);break;
			case 7:$("#contentImg6").attr("src", url);break;
			case 8:$("#contentImg7").attr("src", url);break;
			case 9:$("#contentImg8").attr("src", url);break;
			case 10:$("#contentImg9").attr("src", url);break;
			case 11:$("#contentImg10").attr("src", url);break;
			case 12:$("#contentImg11").attr("src", url);break;
			case 13:$("#contentImg12").attr("src", url);break;
			case 14:$("#contentImg13").attr("src", url);break;
			case 15:$("#contentImg14").attr("src", url);break;
			case 16:$("#secondImg").attr("src",url); break;
			}
		}
	}


	$(function(){
		$(".cansle").click(function(){
			location.href="<%=request.getContextPath()%>/agent/list";
		})
	})
</script>
</html>