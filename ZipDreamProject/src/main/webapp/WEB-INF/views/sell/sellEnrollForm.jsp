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
		font-size: 1rem;
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
	
	.content2 {
		height: 40rem;
		margin-top: 50px;
	}
	
	.picture_one, .picture_two {
		display: inline-block;
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
	
	.price_name, .info_name, .arround_name, .option_name, .othier_info {
		font-size: 1.5rem;
		font-weight: 600;
	}
	
	.price, .info, .arround, .option {
		width: 90%;
	}
	
	.content4 {
		height: 90rem;
	}
	
	.info_pic {
		border: 1px solid red;
		height: 30rem;
		width: 70%;
	}
	
	.content5 {
		height: 15rem;
	}
	
	.table>tbody>tr>th {
		width: 15%;
	}
	
	/*주변정보*/
	.btn-group {
		display: flex;
		justify-content: center;
	}
	
	.button {
		width: 200px;
		height: 3rem;
		border: 1px solid gray;
		border-radius: 20px;
		background-color: white;
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
	}
	
	span {
		font-size: 1.5rem;
		margin-left: 15px;
	}
	
	.button:hover {
		background-color: #0A2647;
		color: white;
		font-weight: 900;
	}
	
	.info {
		margin-top: 20px;
	}
	
	.info_table>tbody>tr>th {
		width: 10%;
	}
	
	.hospital_info, .school_info, .subway_info {
		display: none;
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
</style>
</head>
<body>
	<jsp:include page="../../views/common/header.jsp" />
	 <form action="<%=request.getContextPath()%>/sell/insert" entype="multipart/form-data" method="post">
        <div class="content1 margin">
            <div class="sell_title">
                <div class="sell_no radius">
                    <span>매물번호 : 12345678910</span>
                </div>
                <div class="sell_name">
                    <p><input type="text" name="sellName" size="20" placeholder="매물명을 입력해주세요" required ></p>
                </div>
                <div class="sell_last">
                    <div class="sell_address">매물주소 : <input type="text" name="sellAddress" placeholder="매물주소를 입력해주세요" size="80" required>
                    </div>
                </div>
            </div>
            <div class="line"></div>
            <div class="seller">
                <div class="seller_title">
                    내돈내산공인중개사
                </div>
                <div class="seller_name">
                    대표  : 김예진
                </div>
                <div class="seller_address">
                    소재지 : 서울특별시 어쩔저쩔 ㅇ
                </div>
            </div>
        </div>
        <div class="content2 margin picture content">
            <div id="picture">
                <img class="left arrow" src="https://ifh.cc/g/3FMvAh.png" width="50px" style="display: none;">
                <div id="file-area" style="display:none;">
                    <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);" required>
                    <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);" >
                    <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);" >
                    <input type="file" id="file4" name="file4" onchange="loadImg(this, 4);" >
                    <input type="file" id="file5" name="file5" onchange="loadImg(this, 5);" >
                    <input type="file" id="file6" name="file6" onchange="loadImg(this, 6);" >
                    <input type="file" id="file7" name="file7" onchange="loadImg(this, 7);" >
                    <input type="file" id="file8" name="file8" onchange="loadImg(this, 8);" >
                    <input type="file" id="file9" name="file9" onchange="loadImg(this, 9);" >
                    <input type="file" id="file10" name="file10" onchange="loadImg(this, 10);" >
                    <input type="file" id="file11" name="file11" onchange="loadImg(this, 11);" >
                    <input type="file" id="file12" name="file12" onchange="loadImg(this, 12);" >
                    <input type="file" id="file13" name="file13" onchange="loadImg(this, 13);" >
                    <input type="file" id="file14" name="file14" onchange="loadImg(this, 14);" >
                </div>
                <div>
                    
                    <div class="picture_one margin">
                        <table>
                            <tr>
                                <td colspan="3" rowspan="3" align="center"> <!-- 미리보기 -->
                                <img id="titleImg" width="400" height="600">
                                </td>
                            </tr>
                            <tr>
                                <td><img id="contentImg1" width="300" height="300"></td>
                                <td><img id="contentImg2" width="300" height="300"></td>
                                <td><img id="contentImg3" width="300" height="300"></td>
                            </tr>
                            <tr>
                                <td><img id="contentImg4" width="300" height="300"></td>
                                <td><img id="contentImg5" width="300" height="300"></td>
                                <td><img id="contentImg6" width="300" height="300"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="picture_two" style="display: none;">
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
                    </div>
                </div>
                <img class="right arrow" src="https://ifh.cc/g/JLqn6q.png" width="50">
            </div>
        </div>

        <div class="content3 margin content">
            <p class="price_name">[가격정보]</p>
            <hr class="hr">
            <div class="price margin">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>월세</th>
                            <td><input type="text" name="sellPrice" required size="100"></td>
                        </tr>
                        <tr>
                            <th>관리비</th>
                            <td><input type="text" name="sellMaintenance" required size="100"></td>
                        </tr>
                        <tr>
                            <th>주차</th>
                            <td><input type="text" name="sellParking" required size="100"></td>
                        </tr>
                        <tr>
                            <th>단기임대</th>
                            <td><input type="text" name="shirtterm" required size="100"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="content4 margin content">
            <p class="info_name">[상세정보]</p>
            <hr class="hr">
            <div class="info_pic margin"></div>
            <div class="info margin">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>건물이름</th>
                            <td><input type="text"  name="sellName" required size="100"></td>
                        </tr>
                        <tr>
                            <th>방종류</th>
                            <td><input type="text" name="sellType" required size="100"></td>
                        </tr>
                        <tr>
                            <th>전용/공급면적</th>
                            <td><input type="text" name="sellPrivateArea" required size="45">/<input type="text" name="sellProvideArea" required size="45"></td>
                        </tr>
                        <tr>
                            <th>해당층/건물층</th>
                            <td><input type="text" name="sellFloor" required size="45">/<input type="text" name="sellAllFloor" required size="45"></td>
                        </tr>
                        <tr>
                            <th>방수/욕실수</th>
                            <td><input type="text" name="sellRoomCount" required size="45">/<input type="text" name="sellToletCount" required size="45"></td>
                        </tr>
                        <tr>
                            <th>방향</th>
                            <td><input type="text" name="sellWay" required size="100"></td>
                        </tr>
                        <tr>
                            <th>해당 면적 세대수</th>
                            <td><input type="text" name="sellHousehold" required size="100"></td>
                        </tr>
                        <tr>
                            <th>현관타입</th>
                            <td><input type="text" name="sellEntrance" required size="100"></td>
                        </tr>
                        <tr>
                            <th>입주가능일</th>
                            <td><input type="text" name="sellMoveDate" required size="100"></td>
                        </tr>
                        <tr>
                            <th>건축물용도</th>
                            <td><input type="text" name="sellBuldtype" required size="100"></td>
                        </tr>
                        <tr>
                            <th>승강시설</th>
                            <td><input type="text" name=sellInstallation"" required size="100"></td>
                        </tr>
                        <tr>
                            <th>냉/난방시설</th>
                            <td><input type="text" name="sellAircondition" required size="45">/<input type="text" name="sellHeating" required size="45">></td>
                        </tr>
                        <tr>
                            <th>주차시설</th>
                            <td><input type="text" required size="100"></td>
                        </tr>
                        <tr>
                            <th>세대주차대수</th>
                            <td><input type="text" name="parkingCount"required size="100"></td>
                        </tr>
                        <tr>
                            <th>사용승인일</th>
                            <td><input type="text" name="sellApprovalDate" required size="100"></td>
                        </tr>
                        <tr>
                            <th>최초등록일</th>
                            <td><input type="text" name="sellEnrollDate" required size="100"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="content5 margin content">
            <p class="arround_name">[단지정보]</p>
            <hr class="hr">
            <div class="arround margin">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>단지사용승인일</th>
                            <td><input type="text" name="complexApplyDate" required size="100"></td>
                        </tr>
                        <tr>
                            <th>총 동 수</th>
                            <td><input type="text" name="wingCount" required size="100"></td>
                        </tr>
                        <tr>
                            <th>총 세대 수</th>
                            <td><input type="text" name="housholdCount" required size="100"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="content6 margin content">
            <p class="option_name">[옵션정보]</p>
            <hr class="hr">
            <div class="option margin">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>기본옵션</th>
                            <td><input type="text" name="option" required size="100"></td>
                        </tr>
                        <tr>
                            <th>보안시설</th>
                            <td><input type="text" name="security" required size="100"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="content7 margin content">
            <p class="option_name">[실매매가]</p>
        </div>

        <div class="content8 margin content">
            <img src="https://ifh.cc/g/RorFkp.png" width="50px">
            <span class="othier_info">[주변정보]</span>
            <hr class="hr">
            <div class="btn-group margin">
                <button class="market button">
                    <img src="https://ifh.cc/g/sOFp8v.png" width="34px">
                    <span>편의시설</span>
                </button>
                <button class="subway button">
                    <img src="https://ifh.cc/g/bfoaJM.png" width="40px">
                    <span>대중교통</span>
                </button>
                <button class="hospital button">
                    <img src="https://ifh.cc/g/r0Ta4O.png" width="40px">
                    <span>병원시설</span>
                </button>
                <button class="school button">
                    <img src="https://ifh.cc/g/27sfFC.png" width="40px" height="35px">
                    <span>학교정보</span>
                </button>
            </div>
            <div class="infogroup">
                <div class="market_info info margin">
                    <table class="table info_table">
                        <tbody>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            
                <div class="hospital_info info margin">
                    <table class="table info_table">
                        <tbody>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            
                <div class="subway_info info margin">
                    <table class="table info_table">
                        <tbody>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            
                <div class="school_info info margin">
                    <table class="table info_table">
                        <tbody>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                            <tr>
                                <th><input type="text" required size="20"></th>
                                <td><input type="text" required size="100"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="content9 content margin">
            <button type="submit" class="submit last_btn">등록하기</button>
            <input type="button" class="cansle last_btn" value="뒤로가기">
        </div>
    </form>
    
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

		$("[id^=contentImg]").each(function(index, item) {
			$(item).click(function() {
				$("#file" + (index + 2)).click();
			})

		})

	})

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
				case 5:$("#contentImg3").attr("src", url);break;
				case 6:$("#contentImg3").attr("src", url);break;
				case 7:$("#contentImg3").attr("src", url);break;
				case 8:$("#contentImg3").attr("src", url);break;
				case 9:$("#contentImg3").attr("src", url);break;
				case 10:$("#contentImg3").attr("src", url);break;
				case 11:$("#contentImg3").attr("src", url);break;
				case 12:$("#contentImg3").attr("src", url);break;
				case 13:$("#contentImg3").attr("src", url);break;
				case 14:$("#contentImg3").attr("src", url);break;
				}
			}
		} else {
			switch (num) {
			case 1:$("#titleImg").attr("src", url);break;
			case 2:$("#contentImg1").attr("src", url);break;
			case 3:$("#contentImg2").attr("src", url);break;
			case 4:$("#contentImg3").attr("src", url);break;
			case 5:$("#contentImg3").attr("src", url);break;
			case 6:$("#contentImg3").attr("src", url);break;
			case 7:$("#contentImg3").attr("src", url);break;
			case 8:$("#contentImg3").attr("src", url);break;
			case 9:$("#contentImg3").attr("src", url);break;
			case 10:$("#contentImg3").attr("src", url);break;
			case 11:$("#contentImg3").attr("src", url);break;
			case 12:$("#contentImg3").attr("src", url);break;
			case 13:$("#contentImg3").attr("src", url);break;
			case 14:$("#contentImg3").attr("src", url);break;
			}
		}
	}

	$(function() {
		$(".right").click(function() {
			$(".picture_two").show();
			$(".picture_one").hide();
			$(".left").show();
			$(".right").hide();
		})
		$(".left").click(function() {
			$(".picture_one").show();
			$(".picture_two").hide();
			$(".right").show();
			$(".left").hide();
		})
	})
</script>
</html>