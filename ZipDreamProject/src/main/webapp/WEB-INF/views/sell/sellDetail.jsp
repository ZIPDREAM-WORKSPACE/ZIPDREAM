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
	.content1{
		margin-top : 500px;
	    border-bottom: 4px solid #6E7C7C;
	    width: 80%;
	    height: 15rem;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	.hr{
		border:2px solid  #6E7C7C;
	}
	.margin{
	    margin: 0 auto;
	}
	.radius{
	    border-radius: 30px;
	}
	.sell_title{
	    width: 50%;
	    height: 90%;
	    display: flex;
	    flex-direction: column;
	    justify-content: space-around;
	}
	
	.sell_no{
	    border: 1px solid lightgray;
	    width: 20%;
	    height: 10%;
	    margin-top: 20px;
	}
	.sell_no>span{
	    font-size: 0.5rem;
	    margin-left: 5px;
	    vertical-align: text-top;
	}
	.sell_name>p{
	    font-size: 4rem;
	    font-weight: 700;
	    color: #0A2647;
	    margin: 0px;
	}
	.sell_last{
	    display: flex;
	    justify-content: flex-start;
	}
	.sell_address, .seller_address{
	    width: 70%;
	    font-size: 1rem;
	    color: #6E7C7C;
	}
	.sell_like{
	    width: 12%;
	}
	#sellLike , .notify{
	    border: 1px solid black;
	    height: 2.3rem;
	}
	#sellLike>span{
	    font-size: 0.8rem;
	}
	#like_img{
	    vertical-align: bottom;
	    margin: 5px 0px 0px 14px;
	}
	.line{
	    border: 1px solid #6E7C7C;
	    height: 80%;
	}
	/*공인중개사 연락하기*/
	.seller{
	    width: 30%;
	    height: 70%;
	    margin-left: 60px;
	    display: flex;
	    flex-direction: column;
	    justify-content: space-evenly;
	}
	.seller_title{
	    font-size: 2rem;
	    font-weight: 500;
	}
	.contect{
	    background-color: #0A2647;
	    color: white;
	}
	/*허위매물신고*/
	.notify{
	    width: 15%;
	    background-color: #2C74B3;
	    color: white;
	}
	
	/*사진*/
	.content2{
		margin-top:50px;
	    height: 40rem;
	}
    #picture{
          display: flex;
          align-items: center;
    }
	.content{
	    width: 70%;
	}
	.content3{
	    width: 70%;
	    height: 20rem;
	}
	.price_name, .info_name, .arround_name, .option_name, .othier_info{
	    font-size: 1.5rem;
	    font-weight: 600;
	}
	.price, .info, .arround, .option{
	    width: 90%;
	}
	
	.content4{
	    height: 80rem;
	}
	.info_pic{
	    border: 1px solid red;
	    height: 30rem;
	    width: 70%;
	}
	.content5{
		margin-top: 120px;	
	    height: 15rem;
	}
	.table>tbody>tr>th{
	    width: 15%;
	}
	
	/*주변정보*/
	.btn-group{
	    display: flex;
	    justify-content: center;
	}
	.button{
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
	
	.button:hover{
	    background-color: #0A2647;
	    color: white;
	    font-weight: 900;
	}
	.info{
	    margin-top: 20px;
	}
	.info_table>tbody>tr>th{
	    width: 10%;
	}
	.hospital_info, .school_info, .subway_info{
	    display: none;
	}
	.last_btn{
	    width: 25%;
	}
	/*모달창*/
	#modal.modal-overlay {
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    left: 0;
	    top: 0;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    justify-content: center;
	    background: rgba(255, 255, 255, 0.25);
	    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	    backdrop-filter: blur(1.5px);
	    -webkit-backdrop-filter: blur(1.5px);
	    border-radius: 10px;
	    border: 1px solid rgba(255, 255, 255, 0.18);
	}
	#modal .modal-window {
	    /* background: rgba( 69, 139, 197, 0.70 ); */            backdrop-filter: blur( 13.5px );
	    -webkit-backdrop-filter: blur( 13.5px );
	    border-radius: 10px;
	    width: 700px;
	    position: relative;
	    top: -100px;
	    padding: 10px;
	}
	#modal .title {
	    padding-left: 10px;
	    display: inline;
	    text-shadow: 1px 1px 2px gray;
	    color: white;
	    
	}
	#modal .title h2 {
	    display: inline;
	}
	#modal .close-area {
	    display: inline;
	    float: right;
	    padding-right: 10px;
	    cursor: pointer;
	    text-shadow: 1px 1px 2px gray;
	    color: white;
	}
	
	#modal .content {
	    margin-top: 20px;
	    padding: 0px 10px;
	    text-shadow: 1px 1px 2px gray;
	    color: white;
	}
	/*모달 css*/
	.seller_contect_modal, .seller_contect_modal2, .finish_apply{
	    border: 1px solid  black;
	    width: 80%;
	    margin: 0 auto;
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    background-color: #abafc5;
	}
	.seller_contect_modal{
	    height: 40rem;
	}
	.radius{
	    border-radius: 30px;
	}
	.modal_header1{
	    height: 8%;
	}
	.modal_header1>span{
	    font-size: 2rem;
	    font-weight: 900;
	}
	.modal_header2{
	    margin-top: 20px;
	    font-size: 0.8rem;
	    line-height: 10px;
	    height: 10%;
	    text-align: center;
	    border-bottom: 2px solid gray;
	}
	.modal_body{
	    height: 50%;
	    text-align: center;
	    font-weight: 900;
	}
	#seller_name{
	    font-size: 1.7rem;
	
	}
	.modal_footer{
	    margin-top: 50px;
	    height: 5%;
	}
	
	/*두번째 모달창*/
	.seller_contect_modal2{
	    height: 35rem;
	}
	.modal_body2{
	    height: 40%;
	}
	.apply{
	    border: 1px solid black ;
	    background-color: white;
	    height: 2rem;
	}
	.meet, .close{
	    margin-right: 50px;
	}
	textarea{
	    padding: 10px 10px;
	}
	
	/*신청완료*/
	.finish_apply{
	    height: 25rem;
	}
	.body3{
	    height: 8%;
	}
	.head3{
	    margin-top: 20px;
	}
	.footer3{
	    margin-top: 60px;
	}
	</style>
</head>
<body>
	<jsp:include page="../../views/common/header.jsp" />

 <div class="content1 margin">
        <div class="sell_title">
            <div class="sell_no radius">
                <span>매물번호 : 12345678910</span>
            </div>
            <div class="sell_name">
                <p>시그니엘</p>
            </div>
            <div class="sell_last">
                <div class="sell_address">매물주소 : 서울특별시 ㅇㅁㄹ니아  ㅓㄹ미ㅏ어라ㅣ멍ㄴㄹㄴ아머러
                </div>
                <div class="sell_like">
                    <div class="radius" id="sellLike">
                        <img id="like_img" src="https://ifh.cc/g/8v70Mm.png" width="25px">
                        <span>찜하기</span>
                    </div>
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
                        <tr>
                            <td colspan="3" rowspan="3" align="center"> <!-- 미리보기 -->
                            <img src="https://ifh.cc/g/mljrgR.jpg" id="titleImg" width="400" height="600">
                            </td>
                        </tr>
                        <tr>
                            <td><img src="https://ifh.cc/g/JMBjyc.jpg" id="contentImg1" width="300" height="300"></td>
                            <td><img src="https://ifh.cc/g/hzl9HR.jpg" id="contentImg2" width="300" height="300"></td>
                            <td><img src="https://ifh.cc/g/mT64PY.jpg" id="contentImg3" width="300" height="300"></td>
                        </tr>
                        <tr>
                            <td><img src="https://ifh.cc/g/g0KNkj.jpg" id="contentImg4" width="300" height="300"></td>
                            <td><img src="https://ifh.cc/g/OQMamL.jpg" id="contentImg5" width="300" height="300"></td>
                            <td><img src="https://ifh.cc/g/JMBjyc.jpg" id="contentImg6" width="300" height="300"></td>
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
                        <td>얼마엄ㄴㅇㄹ/ㅇ럼ㅇㄹ민아ㅓㄻㄴㅇ</td>
                    </tr>
                    <tr>
                        <th>관리비</th>
                        <td>얼마얾ㅇㄹ만얾ㅇ럼ㄴ이ㅏ럼니ㅏㅇ러미ㅏㄴ얼미ㅏㄴ어람ㄴ어리ㅏㅓ망러ㅣ망</td>
                    </tr>
                    <tr>
                        <th>주차</th>
                        <td>가능해 안가능해!!</td>
                    </tr>
                    <tr>
                        <th>단기임대</th>
                        <td>가능해 안가능해!!!!!!</td>
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
                        <td>무슨 아파트</td>
                    </tr>
                    <tr>
                        <th>방종류</th>
                        <td>아파트야뭐야</td>
                    </tr>
                    <tr>
                        <th>전용/공급면적</th>
                        <td>얼마나/해줄건데</td>
                    </tr>
                    <tr>
                        <th>해당층/건물층</th>
                        <td>몇층짜리고 /몇층이야</td>
                    </tr>
                    <tr>
                        <th>방수/욕실수</th>
                        <td>방몇개 /욕실몇개</td>
                    </tr>
                    <tr>
                        <th>방향</th>
                        <td>남동</td>
                    </tr>
                    <tr>
                        <th>해당 면적 세대수</th>
                        <td>9세대</td>
                    </tr>
                    <tr>
                        <th>현관타입</th>
                        <td>계단식</td>
                    </tr>
                    <tr>
                        <th>입주가능일</th>
                        <td>즉시가능(2023.05.19)</td>
                    </tr>
                    <tr>
                        <th>건축물용도</th>
                        <td>공동주택</td>
                    </tr>
                    <tr>
                        <th>승강시설</th>
                        <td>엘리베이터</td>
                    </tr>
                    <tr>
                        <th>냉/난방시설</th>
                        <td>개별냉방/개별난방(도시가스)</td>
                    </tr>
                    <tr>
                        <th>주차시설</th>
                        <td>공공주차시설</td>
                    </tr>
                    <tr>
                        <th>세대주차대수</th>
                        <td>1.16대</td>
                    </tr>
                    <tr>
                        <th>사용승인일</th>
                        <td>20174.0529</td>
                    </tr>
                    <tr>
                        <th>최초등록일</th>
                        <td>2023.04.24</td>
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
                        <td>무슨 아파트</td>
                    </tr>
                    <tr>
                        <th>방종류</th>
                        <td>아파트야뭐야</td>
                    </tr>
                    <tr>
                        <th>전용/공급면적</th>
                        <td>얼마나/해줄건데</td>
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
                        <td>에어컨, 냉장고, TV 등등...................</td>
                    </tr>
                    <tr>
                        <th>보안시설</th>
                        <td>이것저것...모두다....</td>
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
    
    <!-- 모달창 -->
    <div id="modal" class="modal-overlay" style="display: none;">
        <div class="modal-window">
            <div class="seller_contect_modal radius" style="display: none;">
                <div class="modal_header1">
                    <img src="https://ifh.cc/g/Hyz5zg.png" width="40px" style="vertical-align: bottom;">
                    <span>공인중개사에게 연락하기</span>
                </div>
                <div class="modal_header2">
                    <p>이 매물은 공인중개사가 등록한 중개매물입니다.</p>
                    <p>공인중개사와 만남을 통해 안전하게 계약을 진행할 수 있으며, 법정중개보수가 발생합니다.</p>
                </div>
                <hr>
                <div class="modal_body">
                    <img src="resuorces/imgs/fnvl.jpg" width="200px" style="border-radius: 50%;">
                    <p id="seller_name">내돈내산공인중개사</p>
                    <p id="seller_address">소재지 : 서울특별시 강남구 테헤란로 14길 6 남도빌딩 2층</p>
                    <p id="seller_number">중개등록번호 : 12345-677-123123</p>
                    <p id="seller_phone">연락처 : 010-1234-5678</p>
                </div>
                <div class="modal_footer">
                    <input type="button" class="close_apply" value="닫기">
                    <input type="button" class="apply" value="신청하기">
                </div>
            </div>
            
            <div class="seller_contect_modal2 radius" style="display: none;">
                <div class="modal_header1">
                    <img src="https://ifh.cc/g/Hyz5zg.png" width="40px">
                    <span>공인중개사 상담 신청하기</span>
                </div>
                <div class="modal_header2">
                    <p>공인중개사와 대면&비대면으로 상담을 신청할 수 있습니다.</p>
                    <p>희망시간을 작성해주시면 공인중개사가 확인 후 상담일정을 조율해드릴 예정입니다.</p>
                </div>
                <hr>
                <div class="modal_body2">
                    <textarea rows="10" cols="60" style="resize: none;" placeholder="상담을 희망하는 날짜와 시간대를 입력해주세요. 공인중개사가 확인 후 일정 조율을 진행합니다."></textarea>
                </div>
                <div class="modal_footer">
                    <input type="button" class="meet apply" value="대면상담">
                    <input type="button" class="untact apply" value="비대면상담">
                </div>
            </div>
        
            <div class="finish_apply radius" style="display: none;">
                <div class="modal_header1">
                    <span>신청이 완료되었습니다.</span>
                </div>
                <div class="modal_header2 head3">
                    <p>공인중개사가 직접 연락드릴예정이오니 연락들 기다려 주세요 *^^*</p>
                </div>
                <hr>
                <div class="modal_body body3">
                    <p> 공인중개사 : 내집마련공인중개사</p>
                    <p> 연락처 : 010-1234-5678</p>
                </div>
                <div class="modal_footer footer3">
                    <input type="button" class="close_apply" value="닫기">
                </div>
            </div>
        </div>
    </div>
<script>
    $(function(){
        $(".market").on("click", function(){
            $(".market_info").show();
            $(".subway_info").hide();
            $(".school_info").hide();
            $(".hospital_info").hide();
        })
        $(".subway").on("click", function(){
            $(".market_info").hide();
            $(".subway_info").show();
            $(".school_info").hide();
            $(".hospital_info").hide();
        })
        $(".hospital").on("click", function(){
            $(".market_info").hide();
            $(".subway_info").hide();
            $(".school_info").hide();
            $(".hospital_info").show();
        })
        $(".school").on("click", function(){
            $(".market_info").hide();
            $(".subway_info").hide();
            $(".school_info").show();
            $(".hospital_info").hide();
        })
    })
    
    $(function(){
        $(".contect").on("click",function(){
            $(".modal-overlay").show();
            $(".seller_contect_modal").show();
        })
        $(".apply").on("click",function(){
            $(".seller_contect_modal").hide();
            $(".seller_contect_modal2").show();
        })
        $(".meet, .untact").on("click",function(){
            $(".seller_contect_modal").hide();
            $(".seller_contect_modal2").hide();
            $(".finish_apply").show();
        })
        $(".close_apply").on("click",function(){
            $(".seller_contect_modal").hide();
            $(".seller_contect_modal2").hide();
            $(".finish_apply").hide();
            $(".modal-overlay").hide();
        })
    })
    
    $(function() {
		$(".right").on("click",function() {
			$(".picture_two").show();
			$(".picture_one").hide();
			$(".left").show();
			$(".right").hide();
		})
		$(".left").on("click",function() {
			$(".picture_one").show();
			$(".picture_two").hide();
			$(".right").show();
			$(".left").hide();
		})
</script>
</body>
</html>