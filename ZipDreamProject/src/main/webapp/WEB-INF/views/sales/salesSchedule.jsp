<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- alert창 꾸미기  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>ZIPDREAM</title>
<style>
* {
	margin: 0;
	padding: 0;
	vertical-align: middle;
}

.sellHouseNavWrap {
	flex: 0 0 auto;
	width: 100%;
	height: 60px;
	z-index: 1;
}

.sellHouseNavi {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
	min-width: 1200px;
	height: 60px;
	background-color: rgb(255, 255, 255);
	box-shadow: rgba(0, 0, 0, 0.2) 0px 3px 1px -2px;
}

.sellHouseNavi>li {
	list-style: none;
	height: 14px;
	padding: 0px 20px;
}

.sellHouseNavi>li>a {
	color: rgb(34, 34, 34);
	font-size: 14px;
	font-weight: 200;
	line-height: 20px;
	outline: none;
	text-decoration: none;
}

.sellHouseNavi>li>a:hover {
	color: #326CF9;
}

.sellHouseTitleWrap {
	display: flex;
	width: 100%;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	height: 100px;
	position: relative;
	box-shadow: rgba(0, 0, 0, 0.2) 0px 3px 1px -2px;
}

.sellHouseTitle {
	color: rgb(34, 34, 34);
	font-size: 33px;
	font-weight: 400;
	line-height: 49px;
}

.sellHouseCalendar {
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
}

.calendar {
	text-align: center;
}

.calendar-yearmonth {
	display: inline-block;
	font-size: 30px;
	font-weight: 300;
	line-height: 45px;
	vertical-align: middle;
	margin: 40px 50px;
}

.calendar-header img {
	width: 30px;
	height: 30px;
	cursor: pointer;
}

.calendar-header {
	vertical-align: middle;
}

#calendar {
	display: flex;
	margin: 0;
	padding: 0px;
    background-color: rgb(242, 244, 248);
	height: 80px;
	text-align: center;
	align-items: center;
    padding-left: 20px;
}

#calendar>table>thead th {
	padding-right: 50px;
}

#calendar>table>tbody td {
	padding-right: 50px;
}

.calendar-day {
	cursor: pointer;
}

.sellHouseListWrap {
	margin-top: 40px;
	margin: 0px auto;
	padding: 0px 10px;
	width: 1200px;
	display: flex;
	justify-content: center;
}

.sellHouseListTable {
	width: 100%;
}

.sellHouseTable {
	width: 100%;
	margin-top: 13px;
	border-top: 1px solid rgb(34, 34, 34);
	border-bottom: 1px solid rgb(231, 231, 231);
	border-collapse: collapse;
	border-spacing: 0px;
}

.sellHouseTable>thead {
	margin: 0px;
	font: inherit;
}

.sellHouseTable>thead th {
	color: rgb(101, 101, 101);
	font-size: 14px;
	font-weight: 400;
	height: 52px;
	line-height: 52px;
	text-align: center;
	background-color: rgb(248, 248, 248);
}

.sellHouseTable>tbody tr {
	border-bottom: 1px solid rgb(231, 231, 231);
}

.sellHouseTable>tbody td {
	font-size: 14px;
	font-weight: 400;
	height: 120px;
	vertical-align: middle;
	text-align: center;
	color: rgb(101, 101, 101);
}

.tagAccept {
	font-size: 13px;
	font-weight: 400;
	width: 62px;
	height: 24px;
	margin: 0px auto;
	line-height: 24px;
	border-radius: 2px;
	color: #E45A64;
	border: 1px solid #E45A64;
}

.tagPublish {
	font-size: 13px;
	font-weight: 400;
	width: 62px;
	height: 24px;
	margin: 0px auto;
	line-height: 24px;
	border-radius: 2px;
	color: rgb(34, 34, 34);
	border: 1px solid rgb(34, 34, 34);;
}

.appInfo {
	display: flex;
	flex-grow: 1px;
	flex-direction: column;
	justify-content: center;
	text-align: left;
}

.appInfo>p {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 100%;
	height: 20px;
	line-height: 20px;
}

.appInfoTitle {
	font-weight: 700;
}

.sellHousealarm {
	width: 25px;
	cursor: pointer;
}

.tagExpected {
	color: #326CF9;
	font-size: 13px;
	font-weight: 400;
	width: 62px;
	height: 24px;
	margin: 0px auto;
	line-height: 24px;
	border-radius: 2px;
	border: 1px solid #326CF9;
}

.calendar-day.today {
	color: #326CF9;
	font-weight: bold;
}

.appInfoTitle>a {
	color: rgb(101, 101, 101);
	font-weight: 600;
}

.appInfoTitle>a:hover {
	color: rgb(101, 101, 101);
	text-decoration: none;
}

.not {
	color: rgb(255, 255, 255);
	font-size: 13px;
	font-weight: 400;
	width: 62px;
	height: 24px;
	margin: 0px auto;
	line-height: 24px;
	border-radius: 2px;
	background-color: rgb(35, 50, 110);
}
.slectCover{
    flex-grow: 0;
    flex-shrink: 1;
    display: flex;
    margin-right: 8px;
    border: 1px solid rgb(223, 223, 223);
    border-radius: 2px;
    background: url(https://ifh.cc/g/vmK28o.png) right 9px center / 10px no-repeat rgb(255, 255, 255);
    position: relative;
}

.bType{
    width: 100%;
    max-width: 215px;
    padding: 0px 28px 0px 10px;
    height: 36px;
    text-align: left;
    border: 0px;
    background-color: transparent;
}

.bType:active, .bType:focus{
	outline:none;
}

.bType>p{
    color: rgb(76, 76, 76);
    font-size: 13px;
    font-weight: 400;
    white-space: nowrap;
    overflow: hidden;
    width: 100%;
    height: 36px;
    line-height: 36px;
    text-overflow: ellipsis;
}
.stepBox{
    width: 250px;
    height: 280px;
    padding: 20px 0px 20px 30px;
    border-radius: 2px;
    box-shadow: rgba(0, 0, 0, 0.25) 0px 15px 18px -10px;
    border: 1px solid rgb(158, 158, 158);
    background-color: rgb(255, 255, 255);
    position: absolute;
    top: calc(100% + 5px);
    left: 0px;
    display:none;
}
.stepBox>h1{
	color: rgb(34, 34, 34);
    font-size: 18px;
    font-weight: 400;
    height: 27px;
    line-height: 27px;
    margin-top: 10px;
    margin-bottom: 4px;
    text-align: left;
}
.stepBox>p{
	color: rgb(134, 134, 134);
    font-size: 13px;
    font-weight: 400;
    margin-bottom: 20px;
}
.stepBox ul{
	display: flex;
    flex-wrap: wrap;
    width: 100%;
    list-style: none;
}
.stepBox ul>li{
    width: 100%;
    height: 35px;
    line-height: 35px;
    white-space: nowrap;
    text-align: left;
    cursor: pointer;
    margin: 0px;
    padding: 0px;
    border: 0px;
    vertical-align: baseline;
}
.stepLabel{
    display: flex;
    align-items: center;
}
.stepLabel>input {
    cursor: pointer;
    margin: 0px;
    border: 0px;
    border-radius: 0px;
    width: 20px;
    height: 20px;
}
.stepLabel>p{
    color: rgb(76, 76, 76);
    font-size: 15px;
    font-weight: 400;
    padding-left: 10px;
    user-select: none;
    cursor: pointer;
    margin-bottom:0;
}
.bType:focus{
	outline:none;
    width: 100%;
    max-width: 215px;
    padding: 0px 28px 0px 10px;
    height: 36px;
    text-align: left;
    border: 0px;
    background-color: transparent;

}
.loader {
    z-index: 1;
    width: 150px;
    height: 150px;
   	margin:0 auto;
   	margin-bottom:100px;
    border: 16px solid #f3f3f3;
    border-radius: 50%;
    border-top: 16px solid #326CF9;
    width: 120px;
    height: 120px;
    -webkit-animation: spin 2s linear infinite;
    animation: spin 2s linear infinite;
}


@-webkit-keyframes spin {
    0% { -webkit-transform: rotate(0deg); }
    100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
} 
#noneList{
	margin: 0 auto;
	width: 100%;
	width: 1200px;
	text-align: center;
	font-size: 24px;
    color: rgb(174, 174, 174);
	display:none;
   	padding-bottom: 80px;
   	margin-top: 30px;
    margin-bottom: 30px;
	border-bottom: 1px solid rgb(174, 174, 174);
}

}
#noneList svg{
    margin-bottom: 20px;
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	
	<script>
	let houseSock = new SockJS("<%=request.getContextPath()%>/notice"); 
		mysaleList = [];
		myhouseList = [];
		$(function(){
			
			var yearmonth = document.getElementById("yearmonth").innerText;
			var length = (yearmonth.length) - 1;
			var month = yearmonth.substring(5, length);
			
			applyschedule(month);
			
			 if('${loginUser}' != ''){
				 
				 $.ajax({
					url:"<%=request.getContextPath()%>/sales/selectMySale",
					method:"get",
					data:{userNo : '${loginUser.userNo}'},
					dataType:"text",
					async: false,
					success:function(result){
					    mysaleList = result.replace("[","").replace("]","").split(",");
						
						console.log(mysaleList);
					},
					error:function(){
						console.log("에러발생");
					}
					
				 })
				 
			 };
			
			
		});
		
		
		function applyschedule(month){
			
			
			$.ajax({
				url:"<%=request.getContextPath()%>/sales/apiData",
				method:"get",
				data:{month},
				dataType:"text",
				contentTYpe :"text.plain; charset:UTF-8",
				success:function(result){
					data = JSON.parse(result).data;
					resultHtml(data,month);
					
				},
				error:function(){
					console.log("에러발생");
				}
			})
			
		};
		

		
		function resultHtml(data,month){
			let today = new Date();
			let year = today.getFullYear();
			let M = (today.getMonth())+1;
			
			if(M < 10){
				M = "0" + M;
			}
			
			let realMonth = "" + year + M;
			if(month < 10){
				month = "0" + month;
			}
			
			let toDay = ""+year+month;
		

			var aptList = [];
			for(var i = 0; i<data.length; i++){
				
				let d = data[i].RCEPT_BGNDE.replace(/-/g, '');
				
				
				if(d >= toDay){
					aptList.push(data[i]);
				}
			}
			
			if(aptList.length == 0){
				console.log("분양정보 없음");
				$("#noneList").css("display", "block");
			}else{
				$("#noneList").css("display", "none");
			}
			
			
			var html = "<tbody id='mytbody'>"
			$.each(aptList, function(key, value){

				var houseCode = value.HOUSE_MANAGE_NO;
				myhouseList.push(houseCode);
				var startDateTime = value.RCEPT_BGNDE;
				var appDday = new Date(value.RCEPT_BGNDE);
				startDateTime = startDateTime.replace(/-/g, '');
				var hsUrl = value.PBLANC_URL;
				
				let appyear = appDday.getFullYear();
				let appmonth = (appDday.getMonth())+1;
				let appdate = appDday.getDate();

			
				if((appDday.getMonth())+1 < 10){
					appmonth = "0" + appmonth;
				}
				
				let appday = ""+appyear+appmonth;
				
				
			
			
				html += "<tr>";
				if(value.RCEPT_BGNDE != null){
					if((appday-realMonth) == 0){
						if(appdate - (today.getDate()) == 0){
							html += "<td><p class='tagAccept'>접수중</p></td>";							
						} else if(appdate - (today.getDate()) > 0){
							html += "<td><p class='tagExpected'>접수예정</p></td>";
						}else if(appdate - (today.getDate()) < 0){
							html += "<td><p class='tagPublish'>접수마감</p></td>";
						}
						
					}else if((appday-realMonth) > 0){
						html += "<td><p class='tagExpected '>접수예정</p></td>";
					}else if((appday-realMonth) < 0){

						html += "<td><p class='tagPublish'>접수마감</p></td>";
					}
				} else{
					html += "<td><p class='not'>분양예정</p></td>";
				}
				html += "<td><p>" + value.HOUSE_SECD_NM + "</p></td>";
				html += "<td><p>"+value.HOUSE_DTL_SECD_NM + "</p></td>";
				html += "<td><div class='appInfo'><p class='appInfoTitle'><a target='_blank' href='"+value.PBLANC_URL+"'>"+ value.HOUSE_NM + "</a></p>";
				html += "<p class='appLocation'>" + value.HSSPLY_ADRES + "</p>";
				

				if(value.RCEPT_BGNDE != null){
					html += "<p class='appDday'>청약접수일 : "+ value.RCEPT_BGNDE +"</p></div></td>";	

				}else{
					html += "<p class='appDday'>청약접수일 : 미정 </p></div></td>";
				}
				/* 추가 정보(가격,세대수,면적) 불러오기위해 함수 실행 */
				var info = aptInfo(houseCode);
				
				html += "<td><p>" + info[0] + "</p></td>";
				html += "<td><p>" + info[1] + "세대</p></td>";
				html += "<td><p>" + info[2] + "m²</p></td>";
				
				let src = "https://ifh.cc/g/hqaYN5.png";
	            
				for(let i = 0; i < mysaleList.length; i++){
	               if(houseCode == Number(mysaleList[i])){
	                  src = "https://ifh.cc/g/bNnQCj.png";
	               }
	            }
	            
	            html += "<td id='" + houseCode+ "'><img class='sellHousealarm' onclick='mySale("+houseCode+","+startDateTime+",\""+hsUrl+"\",\""+value.HOUSE_NM+"\");' src='" + src + "'></td></tr>";
			});
			
			html += "</tbody>"
		
			$(".sellHouseTable").append(html);
			
		}
		
		/* 아파트 가격,세대수,면적 불러오는 API 데이터 받아오기  */
		function aptInfo(houseCode){
			var aptPrice;
			var aptSuply;
			var aptAr;
			var aptInfo = new Array();
			
			
			$.ajax({
				url:"<%=request.getContextPath()%>/sales/houseInfo",
				method:"get",
				async: false,
				data:{houseCode},
				contentType:"text.plain; charset:UTF-8",
				success:function(result){
					aptPrice = result.data[0].LTTOT_TOP_AMOUNT;
					aptSuply = result.data[0].SUPLY_HSHLDCO;
					aptAr = (result.data[0].SUPLY_AR).substr(0,(result.data[0].SUPLY_AR).indexOf("."));

					
					aptInfo = [aptPrice, aptSuply, aptAr];
				},
			
				error:function(){
					cosole.log("에러발생");
				}
			});
			
			return aptInfo;
		}
		
		$(function(){
			
			for(var i = 0; i<$(".houseCode").length; i++){
				console.log($(".houseCode")[i]);
			}
			
			
		});
		
		/* 분양정보 찜하기 */
		function mySale(houseCode, startDateTime, hsUrl,title){
			
				var hu = hsUrl;
				var hc = houseCode;
				var time = startDateTime;
				var uno = '${loginUser.userNo}';
				
	            var h = document.getElementById(houseCode).firstChild;
	            
	           /*  console.log("클릭"+mysaleList); */
	            var userNo = '${loginUser.userNo}';
	            
	           /*  console.log("보낸거" + houseCode + "" + startDateTime); */
	            
	            if('${loginUser}' != ''){
	                if(h.src == "https://ifh.cc/g/bNnQCj.png"){
	                    h.src = "https://ifh.cc/g/hqaYN5.png";
	                    /* 찜하기 취소하기 */
	                    $.ajax({
	                        url: "<%=request.getContextPath()%>/sales/deletemySaleHouse",
	                        method:"get",
	                        data:{startDateTime,userNo,houseCode,hsUrl},
	                        success:function(result){
	                            console.log(result);
	                            deleteSaleNotice("<%=request.getContextPath()%>",hu, uno);
	                        },
	                        error:function(){
	                            console.log("에러발생");
	                        }
	                    
	                    });
	                    
	                    swal("", "분양일정 알림을 취소했습니다.", "warning");
	                }else{
	                    h.src = "https://ifh.cc/g/bNnQCj.png";
	                   /* 찜하기 등록하기 */
	                    $.ajax({
	                        url: "<%=request.getContextPath()%>/sales/mySaleHouse",
	                        method:"post",
	                        data:{startDateTime,userNo,houseCode,hsUrl},
	                        success:function(result){
	                        
	                        
	                        	console.log(houseSock);
	                        	sendMessage1(hu, hc, uno, time, title);
	                            /* console.log(result); */
	                          
	                            
	                        },
	                        error:function(){
	                            console.log("에러발생");
	                        }
	                
	                    });
	                    swal("", "관심 분양단지로 등록되었습니다.", "success");
	                };
	                
	            }else{
	                swal("", "로그인 후 이용하실 수 있습니다.", "error");
	            } 
	        };
	  

	
	</script>


	<div class="sellHouseContentWrap">
		<div class="sellHouseNavWrap">
			<ul class="sellHouseNavi">
				<li><a href="<%=request.getContextPath()%>/sales/schedule">청약정보</a></li>
				<li><a>|</a></li>
				<li><a href="<%=request.getContextPath()%>/sales/guide">분양가이드</a></li>
				<li><a>|</a></li>
                <li><a href="<%=request.getContextPath()%>/sales/calender">분양일정</a></li>
			</ul>
		</div>
		<div class="sellHouseTitleWrap">
			<h1 class="sellHouseTitle">청약정보</h1>
		</div>
		<div style="margin-bottom: 100px;">
			<div class="sellHouseCalendar">
				<div class="calendar month">
					<div class="calendar-header">
					<!-- calendar-prev 클릭시 이전달로 이동 -->

						<span class="calendar-prev">
							<img src="https://ifh.cc/g/sjwW64.png">
						</span> 
						<span class="calendar-yearmonth" id="yearmonth"> 
							<!-- 여기는 오늘이 있는 연도와 월 표시-->

						</span>

						<!-- calendar-next 클릭시 다음달로 이동 -->

						<span class="calendar-next">
							<img src="https://ifh.cc/g/F1V8zo.png">
						</span>
							
					</div>
				</div>
			</div>
			<div class="sellHouseListWrap">
				<div class="sellHouseListTable">
					<table class="sellHouseTable">
						<thead>
							<tr>
								<th>단계</th>
								<th>건물유형</th>
								<th>공급유형</th>
								<th style="width: 200px; text-align: left;">단지명/위치</th>
								<th>분양가(단위:만원)</th>
								<th>세대수</th>
								<th>전용면적</th>
								<th>찜하기</th>
							</tr>
						</thead>

				</table>
				</div>

			</div>
		</div>
		

		<!-- ajax 통신 중 보여질 로딩 화면 -->
		<div>
	 		<div class="loader"></div>
		</div>
		
		<!-- 조회된 리스트가 없을때 보여지게-->
		<div id="noneList">
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  				<path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
			</svg>
			<div>분양정보가 없습니다.</div>
		</div>

	</div>



	<script>
	
		<!--연도와 월 구하기 -->
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() +1;
		$(".calendar-yearmonth").html(year + "년" + month + "월");
		
		var yearmonth = document.getElementById("yearmonth").innerText;
		var length = (yearmonth.length) - 1;
		var currentMonth = Number(yearmonth.substring(5, length));


		
		 // 이전 달로 이동하는 함수
        function goToPreviousMonth() {
	       	if(currentMonth == 1) {
	                return;
         	} 
			 
  			currentMonth -= 1;
        	
			 
        	$(".calendar-yearmonth").html(year + "년" + currentMonth + "월");    
			
			var tbody = document.getElementById("mytbody");
			tbody.remove();
        	
        	applyschedule(currentMonth);
		
        }

        // 다음 달로 이동하는 함수
        function goToNextMonth() {
        	
        	if(currentMonth == 12) {
                return;
            }
        	
        	currentMonth += 1;
        	
        	
        	$(".calendar-yearmonth").html(year + "년" + currentMonth + "월");
        	
        	var tbody = document.getElementById("mytbody");
			tbody.remove();
        	
        	applyschedule(currentMonth);
        }
	
		// 페이지 로드 시 
	    window.addEventListener("load", function () {
	        var prevButton = document.querySelector(".calendar-prev");
	        var nextButton = document.querySelector(".calendar-next");
	
	      
	    	if (yearmonth === "2023년1월"){
	    		prevButton.disabled = true;
	    	}else{
		        // calendar-prev 클릭 시 이전 주로 이동
		        prevButton.addEventListener("click", goToPreviousMonth);
	    		
	    	}
			
	        if(yearmonth === "2023년12월"){
	        	nextButton.disabled = true;
	        }else{
		        // calendar-next 클릭 시 다음 주로 이동
		        nextButton.addEventListener("click", goToNextMonth);
	        	
	        }
	        
	    });
		

		//ajax통신시작
		$(document).ajaxStart(function(){
			//로딩 중 화면 보이기
			$('.loader').css("display", "block");
		});
		
		//ajax통신종료
		$(document).ajaxStop(function(){
			//로딩 중 화면 숨기기
			$('.loader').css("display", "none");
		});
	

       
   	 		
	</script>
	

		<script src="<%=request.getContextPath()%>/resources/js/chat/noticeChat.js"></script>
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>