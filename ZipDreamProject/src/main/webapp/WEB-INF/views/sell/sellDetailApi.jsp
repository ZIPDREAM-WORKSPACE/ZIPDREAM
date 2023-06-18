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
	}
	
	.sell_no{
	    border: 1px solid lightgray;
	    width: 250px;
	    height: 13%;
	    text-align: center;
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
	    display: flex;
	    flex-direction: column;
	}
	.sell_address, .seller_address{
	    font-size: 1.1rem;
	    color: #6E7C7C;
	}
	.line{
	    border: 1px solid #6E7C7C;
	    height: 80%;
	}
	.content{
	    width: 70%;
	}
	.content2{
		margin-top:50px;
		text-align:center;
		display: -webkit-box;
	}
	#p{
		font-size: 1rem;
		font-weight: 600;
	}
	.content3{
	    margin-top : 30px;
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
		margin-top : 150px;
	    height: 30rem;
	}
	.content5{
		margin-top: 430px;	
	    height: 15rem;
	}
	.table>tbody>tr>th {
		width: 15%;
	}
	.content6, .content8{
		margin-top:100px;
	}
	/*주변정보*/
	.other-group, .con2Text1, .con2Text2{
	    display: flex;
	    justify-content: center;
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
	.aprtImg, .sellerImg{
		display: flex;
		margin-top : 10px;
	}
	.address{
		margin-top : 120px;
	}
	.block{
		height : 15rem;
	}
	</style>
</head>
<body>
	<jsp:include page="../../views/common/header.jsp" />

 <div class="content1 margin content">
        <div class="sell_title">
	            <div class="sell_no radius">
	                매물번호 : ${sda.sellSno} 
	            </div>
	            <div class="sell_name">
	                <p>${sda.sellName }</p>
	            </div>
	    </div>
        <div class="sell_last">
        	<div class="address">
        		<div class="aprtImg">
        			<img src="https://ifh.cc/g/DkBby6.png" width="35">
             		<div class="sell_address">매물주소 : ${sda.sellAddress}</div>
            	</div>
            	<div class="sellerImg">
            		<img src="https://ifh.cc/g/OZoZzR.png" width="35">
            		<div class="seller_address">중개사소재지 : ${sda.brokerAdd }</div>
            	</div>
            </div>
        </div>
    </div>
	
	<div class="content2 margin content">
		<div class="margin">
			<div class="con2Text1 ">
				<img src="https://ifh.cc/g/LZwHml.png" width="25" height="25">
				<p id="p">해당자료는 국토교통부에서 제공하는 아파트매매 실거래 자료를 기반으로 한 매물의 정보입니다.</p>
			</div>
			<div class="con2Text2">
				<img src="https://ifh.cc/g/LZwHml.png" width="25" height="25">
				<p id="p">본 서비스에서 제공하는 정보는 법적인 효력이 없으므로 참고용으로만 활용해주시길 바랍니다.</p>
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
                    <tr>
                    	<th>관리방식</th>
                    	<th>${sda2.management}</th>
                    </tr>
                    <tr>
                    	<th>주차</th>
                    	<td>가능</td>
                    </tr>
                    <tr>
                    	<th>단기임대</th>
                    	<td>불가능</td>
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
                        <th>아파트 명</th>
                        <td>${sda.sellName}</td>
                    </tr>
                    <tr>
                    	<th>건물종류</th>
                    	<td>${sda2.kaptType}</td>
                    </tr>
                    <tr>
                        <th>전용 면적</th>
                        <td>${sda.sellPrivateArea}</td>
                    </tr>
                    <tr>
                        <th>해당 층/전체 층</th>
                        <td>${sda.sellFloor}층/ ${sda2.kaptAllFloor}층</td>
                    </tr>
                    <tr>
                    	<th>현관타입</th>
                    	<td>${sda2.kaptEntrance }</td>
                   	</tr>
                    <tr>
                        <th>계약년/월/일</th>
                        <td>${sda.ymd}</td>
                    </tr>
                    <tr>
                    	<th>가입일</th>
                    	<td>${sda2.kaptEnrollDate}</td>
                    </tr>
                    <tr>
                        <th>건축년도</th>
                        <td>${sda.sellApprovalDatetime}년</td>
                    </tr>
                    <tr>
                    	<th>시공사</th>
                    	<td>${sda2.kaptBuildCompany}</td>
                    </tr>
                    <tr>
                    	<th>건물구조</th>
                    	<td>${sda2.buildStructure }</td>
                    </tr>
                    <tr>
                    	<th>승강시설 수</th>
                    	<th>${sda2.liftCount }대</th>
                    </tr>
                    <tr>
                    	<th>총 주차대 수</th>
                    	<td>${sda2.kaptParkingCount }대</td>
                    </tr>
                    <tr>
                    	<th>난방시설</th>
                    	<td>${sda2.kaptHeating}</td>
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
	 <div class="content5 margin content">
        <p class="arround_name">[단지정보]</p>
        <hr class="hr">
        <div class="arround margin">
            <table class="table">
                <tbody>
                    <tr>
                        <th>단지사용 승인일</th>
                        <td>${sda2.kaptApprovalDate}</td>
                    </tr>
                    <tr>
                        <th>총 동수</th>
                        <td>${sda2.kaptWingCount}개 동</td>
                    </tr>
                    <tr>
                        <th>총 세대 수</th>
                        <td>${sda2.kaptHousehold }세대</td>
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
                        <th>관리사무소 주소</th>
                        <td>${sda2.kaptSecurityAddress }</td>
                    </tr>
                    <tr>
                        <th>보안시설</th>
                        <td>cctv(${sda2.cctvCount}대), 경비원 수(${securityCount}명), 관리업체(${sda2.securityCompany})</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="content8 margin content">
        <img src="https://ifh.cc/g/RorFkp.png" width="50px">
        <span class="othier_info">[주변정보]</span>
        <hr class="hr">
        <div class="other-group">
            <button class="market button" style="background-color: #0A2647; color:white; font-weight: 600;">
                <img src="https://ifh.cc/g/zF1Glv.png" width="34px">
                <span>편의시설</span>
            </button>
            <button class="subway button">
                <img src="https://ifh.cc/g/bfoaJM.png" width="40px">
                <span>대중교통</span>
            </button>
            <button class="hospital button">
                <img src="https://ifh.cc/g/JstgyK.png" width="40px">
                <span>부대시설</span>
            </button>
            <button class="school button">
                <img src="https://ifh.cc/g/GhhJRs.png" width="40px" height="35px">
                <span>학교정보</span>
            </button>
        </div>
        <div class="infogroup">
            <div class="market_info info margin">
                <table class="table info_table">
                    <tbody class="market_tbody">
                    </tbody> 
                </table>
            </div>
        
            <div class="hospital_info info margin">
                <table class="table info_table">
                    <tbody class="other_tbody">
                    </tbody>
                </table>
            </div>
        
            <div class="subway_info info margin">
                <table class="table info_table">
                    <tbody class="subway_tbody">
                    </tbody>
                </table>
            </div>
        
            <div class="school_info info margin">
                <table class="table info_table">
                    <tbody class="school_tbody">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="block"></div>
   <jsp:include page="../../views/common/footer.jsp" />
    
    <script>
    	
    	$(function(){
    	
    		addApiList();
    	})
    	
    	function addApiList(){
    		$.ajax({
    			url : "<%=request.getContextPath()%>/sell/addApi",
    			method : "get",
    			data : {kaptCode : '${sda2.kaptCode}'},
    			dataType : "json",
    			success : function(result){
    				console.log("api접근성공");
    				
    				let result0 = JSON.parse(result[0]);
    				console.log(result0);
    				console.log(result0.kaptdWtimebus);
    				console.log(result0.subwayLine);
    				console.log(result0.subwayStation);
    				console.log(result0.kaptdWtimesub);
    				
    				/* 편의시설 */
    				let convenientFacility = result0.convenientFacility;
    				let conarr = convenientFacility.split(" ");
    				let con = "";
    				for(let i=0; i<conarr.length; i++){
    					con += "<tr>"+"<th>"+(i+1)+"</th>"+
    							"<td>"+conarr[i]+"</td>"+"</tr>"
    				}
    				$(".market_tbody").html(con);
    				/* 교육시설 */
    				let educationFacility = result0.educationFacility;
    				let eduArr = educationFacility.split(" ");
    				let edu = "";
    				for(let i=0; i<eduArr.length; i++){
    					edu +=  "<tr>"+"<th>"+(i+1)+"</th>"+
								"<td>"+eduArr[i]+"</td>"+"</tr>"
    				}
    				$(".school_tbody").html(edu);
    				
    				/* 교통시설 */
    				let subwayStation = result0.subwayStation;
    				let subwayTime = result0.kaptdWtimesub;
    				let subArr = subwayStation.split(",");
    				let sub = "";
    				for(let i=0; i<subArr.length; i++){
    					sub += "<tr>"+"<th>"+(i+1)+"<th>"+"<td>"+subArr[i]+" -> "+subwayTime+"</td>"+"</tr>"
    				}
    				$(".subway_tbody").html(sub);
    				
    				/* 부대시설 */
    				let welfareFacility = result0.welfareFacility;
    				let welArr = welfareFacility.split(" ");
    				let wel = "";
    				for(let i=0; i<welArr.length; i++){
    					wel +=  "<tr>"+"<th>"+(i+1)+"</th>"+
						"<td>"+welArr[i].replace(",","")+"</td>"+"</tr>"
    				}
    				$(".other_tbody").html(wel);
    				
    			}, error : function(){
    				console.log("api접근 실패")
    			}
    		})

    	}
  
    	$(function(){
    	    $(".market").on("click", function(){
    	    	$(".market").css({"background-color":"#0A2647", "color":"white", "font-weight":"600"});
    	    	$(".market>img").attr("src","https://ifh.cc/g/zF1Glv.png");
    	    	$(".subway").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".subway>img").attr("src","https://ifh.cc/g/bfoaJM.png");
    	    	$(".school").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".school>img").attr("src","https://ifh.cc/g/GhhJRs.png");
    	    	$(".hospital").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".hospital>img").attr("src","https://ifh.cc/g/JstgyK.png");
    	        $(".market_info").show();
    	        $(".subway_info").hide();
    	        $(".school_info").hide();
    	        $(".hospital_info").hide();
    	    })
    	    $(".subway").on("click", function(){
    	    	$(".subway").css({"background-color":"#0A2647", "color":"white", "font-weight":"600"});
    	    	$(".subway>img").attr("src","https://ifh.cc/g/zPGjOm.png");
    	    	$(".market").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".market>img").attr("src","https://ifh.cc/g/XXq5Xh.png");
    	    	$(".hospital").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".hospital>img").attr("src","https://ifh.cc/g/JstgyK.png");
    	    	$(".school").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".school>img").attr("src","https://ifh.cc/g/GhhJRs.png");
    	        $(".market_info").hide();
    	        $(".subway_info").show();
    	        $(".school_info").hide();
    	        $(".hospital_info").hide();
    	    })
    	    $(".hospital").on("click", function(){
    	    	$(".hospital").css({"background-color":"#0A2647", "color":"white", "font-weight":"600"});
    	    	$(".hospital>img").attr("src","https://ifh.cc/g/LXjmpD.png");
    	    	$(".subway").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".subway>img").attr("src","https://ifh.cc/g/bfoaJM.png");
    	    	$(".school").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".school>img").attr("src","https://ifh.cc/g/GhhJRs.png");
    	    	$(".market").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".market").attr("src","https://ifh.cc/g/XXq5Xh.png");
    	        $(".market_info").hide();
    	        $(".subway_info").hide();
    	        $(".school_info").hide();
    	        $(".hospital_info").show();
    	    })
    	    $(".school").on("click", function(){
    	    	$(".school").css({"background-color":"#0A2647", "color":"white", "font-weight":"600"});
    	    	$(".school>img").attr("src","https://ifh.cc/g/SfJJgf.png");
    	    	$(".hospital").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".hospital>img").attr("src","https://ifh.cc/g/JstgyK.png");
    	    	$(".market").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".market>img").attr("src","https://ifh.cc/g/XXq5Xh.png");
    	    	$(".subway").css({"background-color":"white", "color":"black", "font-weight":"300"});
    	    	$(".subway>img").attr("src","https://ifh.cc/g/bfoaJM.png");
    	        $(".market_info").hide();
    	        $(".subway_info").hide();
    	        $(".school_info").show();
    	        $(".hospital_info").hide();
    	    })
    	})
    	
    	

    

    </script>
    
    
    
</body>
</html>