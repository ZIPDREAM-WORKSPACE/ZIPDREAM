<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#sellLike {
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
		width:160px;
		margin-right:50px;
	    background-color: #0A2647;
	    color: white;
	}
	/*허위매물신고*/
	.notify{
 	    width: 150px;
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
	.content6, .content7, .content8{
		margin-top:80px;
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
	.infogroup{
		margin-left: 100px;
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
	.content9{
		margin-top: 50px;
		text-align: center;
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
	#secondImg{
		border: 1px solid blue;
	}
	</style>
</head>
<body>
	<jsp:include page="../../views/common/header.jsp" />

 <div class="content1 margin">
        <div class="sell_title">
            <div class="sell_no radius">
                <span>매물번호 : ${sda.sellSno} </span>
            </div>
            <div class="sell_name">
                <p>${sda.sellName }</p>
            </div>
            <div class="sell_last">
                <div class="sell_address">매물주소 : ${sda.sellAddress}
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
            
            <div class="seller_address">
                중개사소재지 : ${sda.brokerAdd }
            </div>
            
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
                        <td>${sda.sellPrice}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="content4 margin content">
        <p class="info_name">[상세정보]</p>
        <hr class="hr">
		        
        <div class="info margin">
            <table class="table">
                <tbody>
                    <tr>
                        <th>건물이름</th>
                        <td>${sda.sellName}</td>
                    </tr>
                    <tr>
                        <th>전용 면적</th>
                        <td>${sda.sellPrivateArea}</td>
                    </tr>
                    <tr>
                        <th>해당 층</th>
                        <td>${sda.sellFloor}</td>
                    </tr>
                    <tr>
                        <th>계약년/월/일</th>
                        <td>${sda.ymd}</td>
                    </tr>
                    <tr>
                        <th>건축년도</th>
                        <td>${sda.sellApprovalDatetime}</td>
                    </tr>
                    <tr>
                        <th>해제여부</th>
                        <td>${sda.realYn}</td>
                    </tr>
                     <tr>
                        <th>해제사유발생일</th>
                        <td>${sda.realYnDate}</td>
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
     
    </div>

    <div class="content9 content margin">
       <!--  <input type="button"  class="contect radius " value="공인중개사 연락하기">
        <input type="button" class="notify radius last_btn" value="허위매물 신고하기"> -->
    </div>
    
    <script src="<%=request.getContextPath()%>/resources/js/sell/sellDetail.js"></script>
    
    <script>
    	/* 디테일뷰 이동시 로그인된 사용자인 경우 해당 매물의 디테일 정보를 localstorage에 저장하기*/
    	$(function(){
    		
    		var userNo = '${loginUser.userNo}';
    		var sellPrice = '${sda.sellPrice}';
    		var sellAddress = '${sda.sellAddress}';
    		var detail = '${sda.sellName}' +", " + '${sda.sellFloor}' +"층";
    		console.log(userNo);
    		
    		const obj = {
    				userNo : userNo,
    				sellPrice : sellPrice,
    				sellAddress : sellAddress,
    				detail : detail
			}
    	
    		const objString = JSON.stringify(obj);
    		
    		if(userNo != ''){
    			window.localStorage.setItem('recentRoom', objString);
    		}
    		
    		
    	});
    
    
    </script>
    
    
    
</body>
</html>