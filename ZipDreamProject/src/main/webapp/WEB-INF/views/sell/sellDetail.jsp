<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.zipdream.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	margin-top: 500px;
	border-bottom: 4px solid #6E7C7C;
	width: 80%;
	height: 15rem;
	display: flex;
	justify-content: center;
	align-items: center;
}

.hr {
	border: 2px solid #6E7C7C;
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
	width: 20%;
	height: 10%;
	margin-top: 20px;
}

.sell_no>span {
	font-size: 0.5rem;
	margin-left: 5px;
	vertical-align: text-top;
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

.sell_like {
	width: 12%;
}

#sellLike {
	border: 1px solid black;
	width:6rem;
	height: 2.3rem;
}

#sellLike>span {
	font-size: 0.8rem;
}

#like_img {
	vertical-align: bottom;
	margin: 5px 0px 0px 14px;
}

.line {
	border: 1px solid #6E7C7C;
	height: 80%;
}
/*공인중개사 연락하기*/
.seller {
	width: 30%;
	height: 70%;
	margin-left: 60px;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
}

.seller_title {
	font-size: 2rem;
	font-weight: 500;
}

.contect {
	width: 160px;
	margin-right: 50px;
	background-color: #0A2647;
	color: white;
}
/*허위매물신고*/
.notify {
	width: 150px;
	background-color: #2C74B3;
	color: white;
}

/*사진*/
.content2 {
	margin-top: 50px;
	height: 40rem;
}

#picture {
	display: flex;
	align-items: center;
}

.content {
	width: 70%;
}

.content3 {
	width: 70%;
	height: 20rem;
}

.price_name, .info_name, .arround_name, .option_name, .othier_info,
	.talk, .talkWriter {
	font-size: 1.5rem;
	font-weight: 600;
}

.price, .info, .arround, .option {
	width: 90%;
}

.content4 {
	height: 80rem;
}

.info_pic {
	height: 30rem;
	width: 70%;
}

.content5 {
	margin-top: 120px;
	height: 15rem;
}

.table>tbody>tr>th {
	width: 15%;
}

.content6, .content7, .content8, .content10 {
	margin-top: 80px;
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

.button:hover {
	background-color: #0A2647;
	color: white;
	font-weight: 900;
}

.infogroup {
	margin-left: 100px;
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
	margin-top: 50px;
	text-align: center;
}

.content10_name {
	margin-top: 80px;
}

.content10 {
	border: 1px solid black;
	height: 40rem;
	overflow: auto;
	margin-top: -5px;
}

.box {
	margin-top: 20px;
}

.lastBox {
	border: 1px solid gray;
	width: 90%;
	height: 15rem;
	display: flex;
}

.boardBox {
	margin-top: 10px;
	border-right: 1px solid gray;
	width: 55%;
	height: 15rem;
}

.writer {
	margin: 20px 0px 10px 30px;
	font-size: 1.5rem;
}

.reply {
	margin: 10px 0px 0px 30px;
	font-size: 1.3rem;
}

.hr2 {
	border: 0.5px solid #6E7C7C;
}

#boardContent {
	border: 1px solid gray;
	margin-left: 15px;
	width: 95%;
	height: 60%;
}

.replyBox {
	/* 	border: 1px solid blue; */
	height: 100%;
	width: 45%;
}

.replyName {
	height: 20%;
}

.replyContent {
	overflow: auto;
	height: 55%;
}

#reply {
	border-bottom: 0.3px solid gray;
	margin-top: 10px;
}

.inputReply {
	height: 20%;
	display: flex;
}

#inputReply {
	height: 35px;
}

/* modal css */

.modalContent {
	display:flex;
	align-items:center;
	justify-content:center;
	gap:30px;
}

.modalBody {
	max-width: 600px;
}

.modalFooter {
	margin-top: 30px;
}

.modalFooter>.btn {
	width:150px;
}

.modalFooter>.btn-success {
	margin-left: 30px;
}
</style>
</head>
<body>

	<jsp:include page="../../views/common/header.jsp" />

	<script>
		/* 디테일뷰 이동시 로그인된 사용자인 경우 해당 매물의 디테일 정보를 localstorage에 저장하기*/
		$(function(){
			/* 로그인한 유저 정보 가져오기  */
			var userNo = '${loginUser.userNo}';
			/* 로그인한 유저의 회원번호로 저장된 localstorage 배열 가져오기  */
			var recentRoom = JSON.parse(localStorage.getItem(userNo));
			/* 현재 조회한 매물번호 */
			var sellNo = '${sd.sellNo}';
			const arr = [];
			
			console.log(recentRoom);
			
			/* console.log(userNo + "의 최근본 : " + sellNo); */
			
			/* 객체로 매물번호와 만료기한 저장 */
			/* const obj = {
					sellNo : sellNo,
					expire: Date.now() + (1000 * 60 * 60 * 24)
			}
			
			const objString = "";
			if(recentRoom != null){
				recentRoom.push(obj);
				objString = JSON.stringify(recentRoom);
			}else{
				arr.push(obj);
				objString = JSON.stringify(arr);
			}
			
			
			if(userNo != ''){
				window.localStorage.setItem(userNo, objString);
			}  */
			
		});
	
	</script>


	<div class="content1 margin">
        <div class="sell_title">
            <div class="sell_no radius">
                <span>매물번호 : ${sd.sellNo} </span>
            </div>
            <div class="sell_name">
                <p>${sd.sellName }</p>
            </div>
            <div class="sell_last">
                <div class="sell_address">매물주소 : ${sd.sellAddress}
                </div>
                <div class="sell_like">
                    <div class="radius" id="sellLike" onclick="insertUserSelect();">
                        <img id="like_img" src="${isUserSelect == 0 ? 'https://ifh.cc/g/8v70Mm.png' : 'https://ifh.cc/g/Wa4bRl.png'}" width="25px">
                        <span>찜하기</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="line"></div>
        <div class="seller">
            <div class="seller_title">
                ${seller.office }
            </div>
            <div class="seller_name">
                대표  : ${seller.userName }
            </div>
            <div class="seller_address">
                소재지 : ${seller.address }
            </div>
            <div class="seller_contect">
                <input type="button"  class="contect radius" value="공인중개사 연락하기">
            </div>
        </div>
    </div>

    <div class="content2 margin picture content">
        <div id="picture">
            <img class="left arrow" src="https://ifh.cc/g/3FMvAh.png" width="50px" style="display: none;">
            <div>
                <div class="picture_one margin">
                    <table>
 						<c:if test="${!empty sd.imgList}"> 
 							<tr>
                            	<td colspan="3" rowspan="3" align="center">
                            	<img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[0].changeName}" id="titleImg" width="400" height="600">
                            	</td>
                        	</tr>
 							<c:forEach var="i" begin="1" end="${(fn:length(sd.imgList)-1) < 2 ? fn:length(sd.imgList)-1 : fn:length(sd.imgList)-2}">
			 						<tr>
			                            <td><img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[i].changeName}" id="contentImg1" width="300" height="300"></td>
			                            <!-- <td><img src="https://ifh.cc/g/hzl9HR.jpg" id="contentImg2" width="300" height="300"></td>
			                            <td><img src="https://ifh.cc/g/mT64PY.jpg" id="contentImg3" width="300" height="300"></td> -->
			                        </tr>
		                  	</c:forEach>	
 						</c:if>	
 						<c:if test="${empty sd.imgList}" >
 							<tr><td>등록된 이미지가 없습니다.</td></tr>
 						</c:if>
                        
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
                        <th>매매가</th>
                        <td>${sd.sellPrice}</td>
                    </tr>
                    <tr>
                        <th>관리비</th>
                        <td>${sd.sellMaintenance}</td>
                    </tr>
                    <tr>
                        <th>주차</th>
                        <td>${sd.sellParking}</td>
                    </tr>
                    <tr>
                        <th>단기임대</th>
                        <td>${sd.sellShortterm}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="content4 margin content">
        <p class="info_name">[상세정보]</p>
        <hr class="hr">
		        <div class="info_pic margin">
		        <c:if test="${!empty sd.imgList }">
		        	<c:forEach begin="${fn:length(sd.imgList)-1}" var="i" end="${fn:length(sd.imgList)-1}">
		        		<img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[i].changeName}" id="secondImg" width="900" height="500">
		        	</c:forEach>
		        </c:if>
		        </div>
        <div class="info margin">
            <table class="table">
                <tbody>
                    <tr>
                        <th>건물이름</th>
                        <td>${sd.sellName}</td>
                    </tr>
                    <tr>
                        <th>방종류</th>
                        <td>${sd.sellType }</td>
                    </tr>
                    <tr>
                        <th>전용/공급면적</th>
                        <td>${sd.sellPrivateArea}/${sd.sellProvideArea }</td>
                    </tr>
                    <tr>
                        <th>해당층/건물층</th>
                        <td>${sd.sellFloor} /${sd.sellAllFloor }</td>
                    </tr>
                    <tr>
                        <th>방수/욕실수</th>
                        <td>${sd.sellRoomCount } /${sd.sellToiletCount }</td>
                    </tr>
                    <tr>
                        <th>방향</th>
                        <td>${sd.sellWay }</td>
                    </tr>
                    <tr>
                        <th>해당 면적 세대수</th>
                        <td>${sd.sellHousehold }</td>
                    </tr>
                    <tr>
                        <th>현관타입</th>
                        <td>${sd.sellEntrance }</td>
                    </tr>
                    <tr>
                        <th>입주가능일</th>
                        <td>${sd.sellMoveDatetime }</td>
                    </tr>
                    <tr>
                        <th>건축물용도</th>
                        <td>${sd.sellBuldtype }</td>
                    </tr>
                    <tr>
                        <th>승강시설</th>
                        <td>${sd.sellInstallation }</td>
                    </tr>
                    <tr>
                        <th>냉/난방시설</th>
                        <td>${sd.sellAircondition }/${sd.sellHeating }</td>
                    </tr>
                    <tr>
                        <th>세대주차대수</th>
                        <td>${sd.parkingCount }</td>
                    </tr>
                    <tr>
                        <th>사용승인일</th>
                        <td>${sd.sellApprovalDatetime }</td>
                    </tr>
                    <tr>
                        <th>최초등록일</th>
                        <td>${sd.sellEnrollDatetime }</td>
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
                        <th>건물이름</th>
                        <td>${sd.complexApplyDatetime }</td>
                    </tr>
                    <tr>
                        <th>방종류</th>
                        <td>${sd.wingCount }</td>
                    </tr>
                    <tr>
                        <th>총 세대 수</th>
                        <td>${sd.householdCount }</td>
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
                        <td>${sd.option }</td>
                    </tr>
                    <tr>
                        <th>보안시설</th>
                        <td>${sd.security }</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="content7 margin content">
        <p class="option_name">[실매매가]</p>
        <hr class="hr">
    </div>

    <div class="content8 margin content">
        <img src="https://ifh.cc/g/RorFkp.png" width="50px">
        <span class="othier_info">[주변정보]</span>
        <hr class="hr">
        <div class="btn-group">
            <button class="market button">
                <img src="https://ifh.cc/g/XXq5Xh.png" width="34px">
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
                            <th>이마트</th>
                            <td>서울특별시 여기저기저기정로이괴외괴왹</td>
                        </tr>
                        <tr>
                            <th>홈플러스</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                        <tr>
                            <th>롯데마트</th>
                            <td>에어컨, 냉장고, TV 등등...................</td>
                        </tr>
                        <tr>
                            <th>노브랜드</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                        <tr>
                            <th>지에스마트</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        
            <div class="hospital_info info margin">
                <table class="table info_table">
                    <tbody>
                        <tr>
                            <th>치과</th>
                            <td>서울특별시 여기저기저기정로이괴외괴왹</td>
                        </tr>
                        <tr>
                            <th>피부과</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                        <tr>
                            <th>정형외과</th>
                            <td>에어컨, 냉장고, TV 등등...................</td>
                        </tr>
                        <tr>
                            <th>이비인후과</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                        <tr>
                            <th>내과</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        
            <div class="subway_info info margin">
                <table class="table info_table">
                    <tbody>
                        <tr>
                            <th>역삼역</th>
                            <td>서울특별시 여기저기저기정로이괴외괴왹</td>
                        </tr>
                        <tr>
                            <th>강남역</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                        <tr>
                            <th>선릉역</th>
                            <td>에어컨, 냉장고, TV 등등...................</td>
                        </tr>
                        <tr>
                            <th>잠실역</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                        <tr>
                            <th>신논현역</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        
            <div class="school_info info margin">
                <table class="table info_table">
                    <tbody>
                        <tr>
                            <th>여기초등학교</th>
                            <td>서울특별시 여기저기저기정로이괴외괴왹</td>
                        </tr>
                        <tr>
                            <th>저기초등학교</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                        <tr>
                            <th>여기중학교</th>
                            <td>에어컨, 냉장고, TV 등등...................</td>
                        </tr>
                        <tr>
                            <th>여기고등학교</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                        <tr>
                            <th>저기유치원</th>
                            <td>이것저것...모두다....</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="content9 content margin">
        <input type="button"  class="contect radius " value="공인중개사 연락하기">
        <input type="button" class="notify radius last_btn" value="허위매물 신고하기">
    </div>
	
	<div class="content10_name content margin">
		<img src="https://ifh.cc/g/KN4Qnw.png" width="50px"> <span class="talk">[담소나누기]</span>
		<hr class="hr">
	</div>
	<div class="content10 content board margin">
		<!-- <div class="lastBox margin">
			<div class="boardBox">
				<p class="writer">임*훈님</p>
				<div id="boardContent">
					<span>안녕하세요 여기집 좋아요 많이많이 사세요</span>
				</div>
			</div>
			<div class="replyBox">
				<div class="replyName">
					<p class="reply">한줄댓글</p>
					<hr class="hr2">
				</div>
				<div class="replyContent">
					<p id="reply">김*진 : 굉굉광광이쥠봐보바뫄뫔</p>
					<p id="reply">장*은 : 우르로캌이ㅏ러니ㅏㅇ린ㅇㄹ</p>
					<p id="reply">김*진 : 굉굉광광이쥠봐보바뫄뫔</p>
					<p id="reply">장*은 : 우르로캌이ㅏ러니ㅏㅇ린ㅇㄹ</p>
				</div>
				<div class="inputReply">
	        		<textarea rows="1" cols="53" id="inputReply" style="resize: none;"></textarea>
	        		<button type="submit">작성</button>
	        	</div> 
			</div>

		</div> -->
		<hr>
	</div>
	
	<div class="content content11 margin" id="writer">
			<img src="https://ifh.cc/g/HHdrA0.png" width="40px"> <span
				class="talkWriter">[게시글 작성하기]</span>
			<div class="boardWriter ">
				<textarea rows="3" cols="150" style="resize: none;"
					id="board_Content"></textarea>
				<button onclick="insertboard();">작성</button>
			</div>
	</div>
    
    <!-- 모달창 -->
	<div class="modal fade" id="modal" tabindex="-1"
		aria-labelledby="reportInsertModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">공인중개사에게 연락하기</h5>
					<button type="button" class="btn-close"
						onclick="$('#modal').modal('hide');" aria-label="Close"
						style="border: none; background: white; font-size: 20px;">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" align="center">
					<div class="modal-window">
						<div class="modalbox">
							<div class="modalHead">
								<div class="head1">
									<img src="https://ifh.cc/g/Hyz5zg.png" width="40px"> 
									<span id="modalname">공인중개사에게 연락하기</span>
								</div>
								<span>공인중개사와 만남을 통해 안전하게 계약을 진행할 수 있습니다.</span>
							</div>
							<hr>
							<div class="modalContent">
								<img class="rig" src="https://ifh.cc/g/6BoQCw.jpg" width="150px"
									style="border-radius: 50%;">
								<div class="modalBody" align="left" style="border:1px solid black;">
									<p id="seller_name">${seller.office }</p>
									<p id="seller_address">소재지 : ${seller.address }</p>
									<p id="seller_number">이름 : ${seller.userName }</p>
									<p id="seller_phone">연락처 : ${seller.phone }</p>
								</div>
							</div>
							<hr>
							<div class="modalApply">
								<textarea class="applyContent" cols="70" rows="5"
									style="resize: none;" placeholder="상담을 희망하는 시간과 날짜를 적어주세요"></textarea>
							</div>
							<div class="modalFooter">
								<a class="btn btn-lg btn-primary" onclick="insertCounsle(2)">비대면 신청</a> 
								<a class="btn btn-lg btn-success" onclick="insertCounsle(1)">대면 신청</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 
 		 <div class="modalLast" style="display: none;">
						      	<div class="x">
						          <img class="modalX" src="https://ifh.cc/g/7lzZoV.png" width="30">
						        </div>
						        <div class="modalHead">
						            <div class="head1">
						                <img src="https://ifh.cc/g/Hyz5zg.png" width="40px">
						                <span id="modalname">신청완료</span>
						            </div>
						            <span>공인중개사의 연락을 기다려주세요*^^*</span>
						        </div>
						      </div> -->
		<!-- 신고 모달 창 -->
	   <div class="modal fade" id="reportInsertModal" tabindex="-1" aria-labelledby="reportInsertModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">허위매물 신고</h5>
						<button type="button" class="btn-close" onclick="$('#reportInsertModal').modal('hide');"
							aria-label="Close"
							style="border: none; background: white; font-size: 20px;">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" align="center">
						<h3>신고 내용 작성</h3>
						<textarea rows="3" cols="80" class="reportContent" placeholder="내용을 작성해주세요."></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="insertReport(2)" class="btn btn-success">등록하기</button>
						<button type="button" class="btn btn-primary"
	                        onclick="$('#reportInsertModal').modal('hide');">닫기</button>
      				</div>
				</div>
			</div>
		</div>   

   
    <script src="<%=request.getContextPath()%>/resources/js/sell/sellDetail.js"></script>
</body>
<script>
	const loremIpsum = document.getElementById("lorem-ipsum")
	fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
	    .then(response => response.text())
	    .then(result => loremIpsum.innerHTML = result)
	
	$(function(){
	    $(".contect").click(function(){
	        /* $(".modal-overlay").show();
	        $(".modalbox").show(); */
	    	$("#modal").modal("show");
	    })
	    $(".modalX").click(function(){
    	  $(".modal-overlay").hide();
	      $(".modalbox").hide();
	    })
	    $(".untact").click(function(){
	    	$(".modalbox").hide();
	    	$(".modalLast").show();
	    })
	    $(".notify").click(function(){
	    	$("#reportInsertModal").modal("show");
	    })
	})
	$(function(){
		boardList();
		
	})
	
 	function insertboard(){
		$.ajax({
			url : "<%=request.getContextPath()%>/board/insert",
			data : {
				refSno : '${sd.sellNo}',
				content : $("#board_Content").val(),
				refUno : '${loginUser.userNo}'
			},
			type : "POST",
			success : function(result){
				if(result == "1"){
					console.log("게시판 작성 성공");
					
				}else{
					console.log("게시판 작성 실패");
				}
				boardList();
			},
			complete : function(){
				$("#board_Content").val("");
			} 
		})
	}
	
	function boardList(){
		$.ajax({
			url : "<%=request.getContextPath()%>/board/list",
			data : {refSno : '${sd.sellNo}'},
			dataType : 'json',
			success : function(result){
				console.log(result);
				let html = "";
				for(let board of result){
					html += "<div class='Boardbox'>"+"<div class='lastBox margin'>"+
								"<div class='boardBox'>"+
									"<span class='writer'>"+board.userName+"</span>"+
									"<button onclick='deleteBoard("+board.detailBoardNo+");'>"+"삭제"+"</button>"+
									"<div id='boardContent'>"+
									"<span>"+board.content+"</span>"+
								"</div>"+"</div>"+
								"<div class='replyBox'>"+
									"<div class='replyName'>"+
										"<p class='reply'>"+"한줄댓글"+"</p>"+
										"<hr class='hr2'>"+
									"</div>"+
									"<div class='replyContent'>"+
									"</div>"+
									"<div class='inputReply'>"+
		        					"<textarea rows='1' cols='53' id='inputReply' style='resize: none;''>"+"</textarea>"+
		        					"<input type='hidden' id='refBno' name='refBno' value='"+board.detailBoardNo+"'>"+
		        					"<button onclick='insertReply("+board.detailBoardNo+");'>"+"작성"+"</button>"+
		        				"</div>"+"</div>"+"</div>"
				}
				$(".content10").html(html);
			},
			error : function(result){
				console.log("리스트조회 실패");
			}
		})
	}
	
	let detailBoardNo ="";
	function insertReply(refBno){
		console.log(refBno);
		detailBoardNo  = refBno;
		$.ajax({
			url : "<%=request.getContextPath()%>/reply/replyInsert",
			data : {
				detailBoardNo,
				replyRefUno : '${loginUser.userNo}',
				replyContent : $("#inputReply").val()
			},
			type : "POST",
			success : function(result){
				if(result ==1){
					console.log("댓글작성 성공");
				}else{
					console.log("댓글작성 실패");
				}
			},
			complete : function(){
				$("#inputReply").val("");
			}
		})
	}  
	
	function deleteBoard(refBno){
		detailBoardNo  = refBno;
		$.ajax({
			url : "<%=request.getContextPath()%>/board/deleteBoard/"+detailBoardNo,
			data : {detailBoardNo},
			type: "post",
			success : function(result){
				alert("게시글이 삭제되었습니다.");
			}
		})
	}
	

	
	/* 신고 등록 함수 */
	function insertReport(type) {
		<%-- let reportContent = $(".reportContent").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/sell/report",
			data : {
					refTuno : ${seller.userNo}, 
					refRuno : ${loginUser.userNo},
					reportContent : reportContent,
					reportType: type
					},
			type: "post",
			success : function(result){
				if(result >= 1){
					swal("", "신고가 등록되었습니다.", "success");					
				}else {
					swal("", "신고 등록 실패.", "error");
				}
			}
		}); --%>
	}

	function insertCounsle(counsleMethod) {
		$.ajax({
			url : "<%=request.getContextPath()%>/sell/counsle",
			data : {
					counsleMethod : counsleMethod,
					counsleContent :  $(".applyContent").val(),
					refTuno : ${loginUser.userNo},
					refUno : ${seller.userNo}, 
					sellNo: ${sd.sellNo}
					},
			type: "post",
			success : function(result){
				if(result >= 1){
					swal("", "상담신청이 완료되었습니다.", "success");					
				}else {
					swal("", "상담신청 등록 실패.", "error");
				}
				$("#modal").modal("hide");
			}
		});
	}
	
	function insertUserSelect(){
		let h = $("#like_img");
		console.log(h.attr("src"));
		if('${loginUser}' != ''){
            if(h.attr("src") == "https://ifh.cc/g/Wa4bRl.png"){
                h.attr("src","https://ifh.cc/g/8v70Mm.png");
                /* 찜하기 취소하기 */
                $.ajax({
                    url: "<%=request.getContextPath()%>/sell/userselect",
                    data : {
        				userNo : ${loginUser.userNo},
        				sellNo : ${sd.sellNo},
        				type : 1
        			},
        			type : "GET",
        			success : function(result){
        				if(result >= 1){
        					swal("", "찜하기 취소 성공", "success");					
        				}else {
        					swal("", "찜하기 실패.", "error");
        				}
        			}
                
                });
                
                swal("", "분양일정 알림을 취소했습니다.", "warning");
            }else{
            	h.attr("src","https://ifh.cc/g/Wa4bRl.png");
                /* 찜하기 등록하기 */
                $.ajax({
                    url: "<%=request.getContextPath()%>/sell/userselect",
                    data : {
        				userNo : ${loginUser.userNo},
        				sellNo : ${sd.sellNo},
        				type: 2
        			},
        			type : "GET",
        			success : function(result){
        				if(result >= 1){
        					swal("", "찜하기 성공", "success");					
        				}else {
        					swal("", "찜하기 실패.", "error");
        				}
        			}
            
                });
                swal("", "관심 분양단지로 등록되었습니다.", "success");
            };
            
        }else{
            swal("", "로그인 후 이용하실 수 있습니다.", "error");
        } 
		
	}
</script>
</html>