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
	    justify-content: flex-end;
	    border : 1px solid red;
	}
	
	.sell_no{
	    border: 1px solid lightgray;
	    width: 20%;
	    height: 10%;
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
	}
	.sell_last{
		border : 1px solid blue;
	    display: flex;
	    flex-direction: column;
	}
	.sell_address, .seller_address{
	    font-size: 1rem;
	    color: #6E7C7C;
	}
	.sell_like{
	    width: 30%;
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
	.content{
	    width: 70%;
	}
	.content3{
	    margin-top : 80px;
	    height: 15rem;
	}
	.price_name, .info_name, .arround_name, .option_name, .othier_info{
	    font-size: 1.5rem;
	    font-weight: 600;
	}
	.price, .info, .arround, .option{
	    width: 90%;
	}
	.content4{
	    height: 30rem;
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
	
	
	</style>
</head>
<body>
	<jsp:include page="../../views/common/header.jsp" />

 <div class="content1 margin content">
        <div class="sell_title">
	            <div class="sell_no radius">
	                <span>매물번호 : ${sda.sellSno} </span>
	            </div>
	            <div class="sell_name">
	                <p>${sda.sellName }</p>
	            </div>
	    </div>
        <div class="sell_last">
        	<div class="address">
            	<div class="sell_address">매물주소 : ${sda.sellAddress}</div>
            	<div class="seller_address">중개사소재지 : ${sda.brokerAdd }</div>
            </div>
            <div class="sell_like">
             <div class="radius" id="sellLike">
                 <img id="like_img" src="https://ifh.cc/g/8v70Mm.png" width="25px">
                 <span>찜하기</span>
             </div>
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