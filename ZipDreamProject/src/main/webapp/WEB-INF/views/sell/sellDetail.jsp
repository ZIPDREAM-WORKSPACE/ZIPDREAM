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
	width: 90%;
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
	width: 10%;
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

.contect, .deleteSell {
	width: 160px;
	margin-right: 50px;
	background-color: #0A2647;
	color: white;
}
.sellerImg, .aprtImg{
	display: flex;
	margin-top : 10px;
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
	    justify-content: center;
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
	height: 30rem;
	overflow: auto;
	margin-top: -5px;
	box-shadow: 0 4px 4px -4px lightgray; 
}
  .content10::-webkit-scrollbar {
    width: 10px;
  }
  .content10::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  .content10::-webkit-scrollbar-track {
    background-color: lightgray;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
.content11{
	height : 10rem;
}

.box, .content11 {
	margin-top: 20px;
}

.lastBox {
	
	border: 1px solid gray;
	width: 95%;
	height: 15rem;
	display: flex;
}
.Boardbox{
	margin-top : 20px;
}
.boardBox {
	padding-top : 20px;
	border-right: 1px solid gray;
	width: 55%;
	height: 15rem;
}

.writer {
	margin: 30px 0px 10px 30px;
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
	margin-top : 15px;
	border: 1px solid gray;
	margin-left: 15px;
	width: 95%;
	height: 70%;
	padding: 10px 10px;
}
.rBox{
	display:flex;
	justify-content: space-between;
    align-items: center;
    border-bottom: 0.3px solid gray;
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
	height: 61.5%;
}

#reply {
	
	margin-top: 10px;
	margin :  10px 0px 1px 0px;
	padding-left :  10px;
}

.inputReply {
	height: 15%;
	display: flex;
}

#inputReply, #insertReplyBtn {
	height: 35px;
}
#inputReply{
    text-overflow : clip;
	overflow : hidden;
	padding : 3px;
}
#deleteBoard{
	font-size :  0.3rem;
	height : 30px;
}
#insertReplyBtn{
	width : 50px;
	font-size : 0.8rem;
}
.deleteImg, .reportImg{
	vertical-align: baseline;
	margin-left : 10px;
}
.boardWriter{
	display : flex;
	justify-content: center;
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
.block{
	height : 20rem;
}
</style>
</head>
<body>

	<jsp:include page="../../views/common/header.jsp" />

	<script>
		/* 디테일뷰 이동시 로그인된 사용자인 경우 해당 매물의 디테일 정보를 localstorage에 저장하기*/
		function saveRecentRoom(sellNo){
			/* userNo를 키값으로 사용  */
			const userNo = "${loginUser.userNo}";
			/* 현재 로그인된 사용자의 회원번호(키)로 localStorage 조회  */
			let recentRooms = localStorage.getItem(userNo);
			
			/* 로컬스토리지에 값이 있다면 배열 추가 */
			if(recentRooms){
				recentRooms = JSON.parse(recentRooms); //로컬스토리지는 String타입이므로 무조건 json으로 형변환해서 꺼내오기
				const index = $.inArray(sellNo,recentRooms);
				
				/* 현재 인덱스가 0이면 1로 바꾸기 */
				if(index > -1){
					recentRooms.splice(index,1);
				}
				
				recentRooms.unshift(sellNo);
				if(recentRooms.length > 5){ // 5개 이상이면 첫번째 배열값 삭제
					recentRooms.pop();
				}
			}else{
				recentRooms = [sellNo];
			}
			
			localStorage.setItem(userNo,JSON.stringify(recentRooms));
		}
	
		$(function(){
			/* 현재 조회한 매물번호를 담아서 함수로보내기 */
			const sellNo = '${sd.sellNo}';
		 	saveRecentRoom(sellNo);

			
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
            	<div class="aprtImg">
        			<img src="https://ifh.cc/g/DkBby6.png" width="35">
             		<div class="sell_address">매물주소 :${sd.sellAddress}</div>
            	</div>
                <%-- <div class="sell_address">매물주소 : ${sd.sellAddress}
                </div> --%>
                <c:if test="${sd.refUno != loginUser.userNo }">
                <div class="sell_like">
                    <div class="radius" id="sellLike" onclick="insertUserSelect();">
                        <img id="like_img" src="${isUserSelect == 0 ? 'https://ifh.cc/g/8v70Mm.png' : 'https://ifh.cc/g/Wa4bRl.png'}" width="25px">
                        <span>찜하기</span>
                    </div>
                </div>
                </c:if>
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
            <div class="sellerImg">
            		<img src="https://ifh.cc/g/OZoZzR.png" width="25" height="25">
            		<div class="seller_address">중개사소재지 :  ${seller.address }</div>
            	</div>
            
            <%-- <div class="seller_address">
                소재지 : ${seller.address }
            </div> --%>
            <div class="seller_contect">
            	<c:if test="${sd.refUno == loginUser.userNo}">
            		<input type="button"  class="deleteSell radius" onclick="deleteSell();" value="매물삭제하기">
            	</c:if>
            	<c:if test="${sd.refUno != loginUser.userNo}">
	                <input type="button"  class="contect radius" value="공인중개사 연락하기">
            	
            	</c:if>
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
                            	<img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[0].changeName}" id="titleImg" width="600" height="600">
                            	</td>
                        	</tr>
 							<%-- <c:forEach var="i" begin="1" end="${(fn:length(sd.imgList)-1) < 2 ? fn:length(sd.imgList)-1 : fn:length(sd.imgList)-2}"> --%>
			 						<tr>
			 							<td>
			 								<c:if test="${!empty sd.imgList[1].changeName }">
			 									<img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[1].changeName}" id="contentImg1" width="300" height="300">
			 								</c:if>
			 								<c:if test="${empty sd.imgList[1].changeName }">
			 									<img id="contentImg1" width="300" height="300">
			 								</c:if>
			 							</td>
			 							<td>
			 								<c:if test="${!empty sd.imgList[2].changeName }">
			 									<img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[2].changeName}" id="contentImg1" width="300" height="300">
			 								</c:if>
			 								<c:if test="${empty sd.imgList[2].changeName }">
			 									<img id="contentImg1" width="300" height="300">
			 								</c:if>
			 							</td>
			 							<td>
			 								<c:if test="${!empty sd.imgList[3].changeName }">
			 									<img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[3].changeName}" id="contentImg1" width="300" height="300">
			 								</c:if>
			 								<c:if test="${empty sd.imgList[3].changeName }">
			 									<img id="contentImg1" width="300" height="300">
			 								</c:if>
			 							</td>
			 							<%-- 
			 							<td><img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[1].changeName}" id="contentImg1" width="300" height="300"></td>
                               			<td><img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[2].changeName}" id="contentImg2" width="300" height="300"></td>
                                		<td><img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[3].changeName}" id="contentImg3" width="300" height="300"></td> --%>
			                        </tr>
			                        <tr>
			                        	<td>
			 								<c:if test="${!empty sd.imgList[4].changeName }">
			 									<img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[4].changeName}" id="contentImg1" width="300" height="300">
			 								</c:if>
			 								<c:if test="${empty sd.imgList[4].changeName }">
			 									<img id="contentImg1" width="300" height="300">
			 								</c:if>
			 							</td>
			 							<td>
			 								<c:if test="${!empty sd.imgList[5].changeName }">
			 									<img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[5].changeName}" id="contentImg1" width="300" height="300">
			 								</c:if>
			 								<c:if test="${empty sd.imgList[5].changeName }">
			 									<img id="contentImg1" width="300" height="300">
			 								</c:if>
			 							</td>
			 							<td>
			 								<c:if test="${!empty sd.imgList[6].changeName }">
			 									<img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[6].changeName}" id="contentImg1" width="300" height="300">
			 								</c:if>
			 								<c:if test="${empty sd.imgList[6].changeName }">
			 									<img id="contentImg1" width="300" height="300">
			 								</c:if>
			 							</td>
			                        	<%-- <td><img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[4].changeName}" id="contentImg1" width="300" height="300"></td>
                               			<td><img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[5].changeName}" id="contentImg2" width="300" height="300"></td>
                                		<td><img src="<%=request.getContextPath()%>/resources/sellupfiles/${sd.imgList[6].changeName}" id="contentImg3" width="300" height="300"></td> --%>
			                        </tr>
		                  <%-- </c:forEach> --%>	
 						</c:if>	
 						<c:if test="${empty sd.imgList}" >
 							<tr><td>등록된 이미지가 없습니다.</td></tr>
 						</c:if>
                        
                    </table>
                </div>
<!--                 <div class="picture_two" style="display: none;">
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
                </div> -->
            </div>
        <!--     <img class="right arrow" src="https://ifh.cc/g/JLqn6q.png" width="50"> -->
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
	
	<c:if test="${sd.refUno != loginUser.userNo }">
	    <div class="content9 content margin">
	        <input type="button"  class="contect radius " value="공인중개사 연락하기">
	        <input type="button" class="notify radius last_btn" value="허위매물 신고하기">
	    </div>
	</c:if>
	<c:if test="${sd.refUno == loginUser.userNo }">
		<div class="content9 content margin">
			<input type="button"  class="deleteSell radius" onclick="deleteSell();" value="매물삭제하기">
	    </div>
	</c:if>
	
	<div class="content10_name content margin">
		<img src="https://ifh.cc/g/KN4Qnw.png" width="50px"> <span class="talk">[담소나누기]</span>
		<hr class="hr">
	</div>
	
	<div class="content10 content board margin">
		<hr>
	
	</div>
		<div class="content content11 margin" id="writer">
				<img src="https://ifh.cc/g/HHdrA0.png" width="40px"> <span
					class="talkWriter">[게시글 작성하기]</span>
					<hr class="hr">
				<div class="boardWriter ">
					<textarea rows="3" cols="150" style="resize: none;"
						id="board_Content"></textarea>
					<button onclick="insertboard();" class="btn btn-outline-primary">작성</button>
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
						<button type="button" class="btn btn-success reportInsertBtn">등록하기</button>
						<button type="button" class="btn btn-primary"
	                        onclick="$('#reportInsertModal').modal('hide');">닫기</button>
      				</div>
				</div>
			</div>
		</div>   
	<div class="block"></div>
   
    <script src="<%=request.getContextPath()%>/resources/js/sell/sellDetail.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/chat/noticeChat.js"></script>
<jsp:include page="../../views/common/footer.jsp" />
</body>
<script>
/* 	const loremIpsum = document.getElementById("lorem-ipsum")
let houseSock = new SockJS("<%=request.getContextPath()%>/notice"); 
	const loremIpsum = document.getElementById("lorem-ipsum")
	fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
	    .then(response => response.text())
	    .then(result => loremIpsum.innerHTML = result) */
	
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
	    	$(".reportInsertBtn").attr("onclick","insertReport(2,${seller.userNo})");
	    	
			$("#reportInsertModal .modal-title").text("허위매물 신고");
			
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
				let url="https://ifh.cc/g/26CZDZ.png";
				let url2="https://ifh.cc/g/s78355.png";
				let url3="https://ifh.cc/g/zv71S7.png";
				for(let board of result){
					html += "<div class='Boardbox'>"+"<div class='lastBox margin'>"+
								"<div class='boardBox'>"+
								  "<div class='boardHead'>"+
									"<span class='writer'>"+board.userName+"</span>";
									if(board.refUno == ${loginUser.userNo}){
										html +="<img src='"+url+"' width='20' height='20' class='deleteImg' onclick='deleteBoard("+board.detailBoardNo+");'>";
									}else{
										html += "<img src='"+url2+"' width='20' height='20' class='reportImg' onclick='$(\".reportInsertBtn\").attr(\"onclick\",\"insertReport(1,"+ board.refUno +")\");$(\"#reportInsertModal .modal-title\").text(\"사용자 신고\");$(\"#reportInsertModal\").modal(\"show\");'>";
									}
									html +="</div>"+
									"<div id='boardContent'>"+
									"<span>"+board.content+"</span>"+
								"</div>"+"</div>"+
								"<div class='replyBox'>"+
									"<div class='replyName'>"+
										"<p class='reply' onchange='' data-boardNo='"+board.detailBoardNo+"'>"+"한줄댓글"+"</p>"+
										"<hr class='hr2'>"+
									"</div>"+
									"<div class='replyContent'>"+
									"</div>"+
									"<div class='inputReply'>"+
		        					"<textarea rows='1' cols='61' id='inputReply' style='resize: none;'placeholder='50자 내로 작성해주세요' maxlength='50'>"+"</textarea>"+
		        					"<input type='hidden' id='refBno' name='refBno' value='"+board.detailBoardNo+"'>"+
		        					"<button onclick='insertReply("+board.detailBoardNo+");replyList("+board.detailBoardNo+")' id='insertReplyBtn' class='btn btn-outline-primary'>"+"작성"+"</button>"+
		        				"</div>"+"</div>"+"</div>"
				}  
				
				$(".content10").html(html);
				for(let i=0; i<result.length; i++){
					let list =replyList(result[i].detailBoardNo);
						let rel = "";
						let url="https://ifh.cc/g/26CZDZ.png";
						let url2="https://ifh.cc/g/s78355.png";
					for(let j=0; j<list.length; j++){
						rel+="<div class='rBox'>";
						rel += "<p id='reply'>"+list[j].userName+" : "+list[j].replyContent+"</p>";
						if(${loginUser.userNo} == list[j].replyRefUno){
							rel+="<img src='"+url+"' width='18' height='15' class='deleteReply' onclick='deleteReply("+list[j].replyNo+");'>";
						}else{
							rel+="<img src='"+url2+"' width='15' height='15' class='deleteReply'  onclick='$(\".reportInsertBtn\").attr(\"onclick\",\"insertReport(1,"+ list[j].replyRefUno +")\");$(\"#reportInsertModal .modal-title\").text(\"사용자 신고\");$(\"#reportInsertModal\").modal(\"show\");'>";
						}
						rel += "</div>";
					}
						$(".replyContent").eq(i).html(rel);
				}
			},
			error : function(result){
				console.log("리스트조회 실패");
			}
		})
	}
	
	
	
	
	let detailBoardNo ="";
	function insertReply(refBno){
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
					
					replyList(detailBoardNo);
					location.reload();
				}else{
					console.log("댓글작성 실패");
				}
			},
			complete : function(){
				$("#inputReply").val("");
			}
		})
	}  
	
	function replyList(detailBoardNo){
		
		let replyList ="";
		$.ajax({
			url : "<%=request.getContextPath()%>/reply/replyList",
			data : {detailBoardNo},
			type : "POST",
			dataType : "json",
			async:false,
			success : function(data){
				console.log(data);
				console.log("댓글불러오기 성공");
				replyList = data;
			},
			error : function(){
				console.log("댓글불러오기 실패");
			}
		});
		return replyList;
	}
	
	function deleteBoard(refBno){
		console.log(refBno);
		detailBoardNo  = refBno;
		$.ajax({
			url : "<%=request.getContextPath()%>/board/deleteBoard",
			data : {detailBoardNo},
			type: "post",
			success : function(result){
				swal("삭제 완료", "등록된 게시글을 삭제하였습니다.", "success");
			},
			complete : function(){
				boardList();
			}
		})
	}
	

	
	/* 신고 등록 함수 */
	function insertReport(type,refTuno) {
		let reportContent = $(".reportContent").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/sell/report",
			data : {
					refTuno : refTuno, 
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
		});
	}

	function insertCounsle(counsleMethod) {
		$.ajax({
			url : "<%=request.getContextPath()%>/sell/counsle",
			data : {
					counsleMethod : counsleMethod,
					counsleContent :  $(".applyContent").val(),
					refTuno : ${seller.userNo},
					refUno : ${loginUser.userNo}, 
					sellNo: ${sd.sellNo}
					},
			type: "post",
			success : function(result){
				if(result >= 1){
					swal("", "상담신청이 완료되었습니다.", "success");	
					 sendMessage7(counsleMethod, ${seller.userNo},${loginUser.userNo});
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
	/* 게시글 삭제하기  */
	function deleteSell(){
		$.ajax({
			url : "<%=request.getContextPath()%>/sell/deleteSell",
			data : {sellNo : '${sd.sellNo}', userNo : '${sd.refUno}'},
			type : "post",
			success : function(data){
				console.log("게시글 삭제 완료");
				swal("삭제 완료", "등록된 매물을 삭제하였습니다.", "success");
				move();
			},
			error : function(){
				console.log("게시글 삭제 실패");
				swal("삭제 완료", "매물삭제를 실패하였습니다. 다시 시도해주세요", "error");
			}
		})
	}
	function move(){
		location.href='<%=request.getContextPath()%>/agent/list';
	};
	
	let refRno ="";
	function deleteReply(refRno){
		refRno = refRno;
		$.ajax({
			url : "<%=request.getContextPath()%>/reply/deleteReply",
			data : {refRno, replyRefUno : ${loginUser.userNo} },
			type :"post",
			success : function(result){
				console.log("댓글 삭제 완료");
				swal("삭제 완료", "등록된 댓글을 삭제하였습니다.", "success");
			},
			error : function(){
				swal("삭제 완료", "댓글삭제를 실패하였습니다..", "error");
			},
			complete : function(){
				location.reload();
			}
		})
	}
	
</script>
</html>