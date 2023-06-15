<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.zipdream.sales.model.vo.Calender"%>
<c:set var="calenderList" value="${calenderList }" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<title>ZIPDREAM</title>
<style>
* {
	margin: 0;
	padding: 0;
	/* border: 1px solid black; */
	font-family: 'Noto Sans KR', sans-serif;
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

.sellHouseContentWrap {
	width: 100%;
	flex-grow: 1;
	/* background-color: rgba(91, 100, 121, 0.9); */
}

.sellHouseContet {
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
}

.sellHouseContet>div {
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
}

.calenderWrap {
	width: 1200px;
	display: flex;
	align-items: center;
	flex-direction: row;
	margin: 0 auto;
}

#calendar {
	padding: 40px 25px;
}

.schedule {
	width: 800px;
	height: 500px;
	border: 1px solid rgb(206 206 206/ 19%);
	box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 6px 0px;
	background-color: rgb(255, 255, 255);
	padding: 40px 25px;
	margin-top: 85px;
	margin-bottom: 20px;
	overflow-y: scroll;
	padding-top: 10px;
}

/* 스크롤바전체부분 */
.schedule::-webkit-scrollbar {
	width: 10px;
}
/* 스크롤바막대 */
.schedule::-webkit-scrollbar-thumb {
	background-color: #2C3E50;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}
/*스크롤바 여백  */
.schedule::-webkit-scrollbar-track {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

.schedule>ul {
	margin-top: 15px;
	overflow: hidden;
}

.schedule>ul>li {
	display: flex;
	align-items: flex-start;
	width: 100%;
	height: 56px;
	padding: 17px 0px 17px 24px;
	padding-left: 5px;
	border-bottom: 1px solid rgb(231, 231, 231);
}

.scheduleName {
	display: inline;
	color: rgb(228, 90, 100);
	margin-right: 10px;
}

.announceName {
	display: inline;
	color: #007bff;
	margin-right: 10px;
}

.closeName {
	display: inline;
	color: #6c757;
	margin-right: 10px;
}

.schedule>ul>li>a {
	color: rgb(101, 101, 101);
	font-size: 15px;
	font-weight: 400;
	white-space: nowrap;
	display: inline-block;
	line-height: 22px;
	vertical-align: middle;
	outline: none;
	overflow: hidden;
	text-overflow: ellipsis;
}

.fc {
	width: 100%;
	color: black;
}

#calendar a {
	color: black;
	text-decoration: none;
}

.fc-daygrid-event-harness-abs a {
	color: rgb(228, 90, 100);
}

.fc-daygrid-day-frame {
	cursor: pointerd;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
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
            <h1 class="sellHouseTitle">분양일정</h1>
        </div>
        <div class="sellHouseContentWrap">
            <div>
                <div class="sellHouseContent">
                    <div class="calenderWrap">
                    	<!--캘린더 라이브러리를 이용한 풀캘린더가 들어갈 자리  -->
                        <div id='calendar'></div>
                        
                        <!-- 캘린더 날짜 선택시 상세 정보 넣기  -->
                        <div class="schedule"></div>
                    </div>
                </div>
            </div>

        </div>

    </div>



    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                headerToolbar: { // 헤더에 표시할 툴 바
                    start: 'today',
                    center: 'title',
                    end: 'prev next'
                },
                firstDay:1,
                titleFormat: function (date) {
                    return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
                },
                //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
                selectable: true, 
                nowIndicator: true, // 현재 시간 마크
                locale: 'ko', // 한국어 설정
                dayMaxEvents: true,
                select: function(info) {
                    var calenderStart = info.startStr;
                    
                    $.ajax({
                    	url:"<%= request.getContextPath()%>/sales/select",
                    	method:"get",
                    	data:{calenderStart},
                    	success:function(result){
                    		infoList(result);
                    	},
                    	error:function(){
                    		console.log("에러발생");
                    	}
                    });
                    
                  },

               	events:[
               		<%List<Calender> calenderList = (List<Calender>) request.getAttribute("calenderList");%>
               		<%if(calenderList != null) {%>
               		<%for (Calender vo : calenderList) {%>
	               		{
	               			title:'<%= vo.getCalenderTitle()%>',
	               			start:'<%= vo.getCalenderStart()%>',
	            			<%if(vo.getCalenderTitle().equals("발표")){%>
	            				color: '#007bff'
	            			<%}else if(vo.getCalenderTitle().equals("접수")){%>
	            				color: 'rgb(228, 90, 100)'
	            			<%}else {%>
	            				color: '#6c757d'
	            			<% } %>
	               		},
               			<%}
           			}%>
               	]
            });

            
            calendar.render();
        });
        
       
        function infoList(result){
    		var html = "";
    		if(result.length != 0){
    			html = "<ul>";
    			for(var i = 0; i<result.length; i++){
    				if(result[i].calenderTitle == "접수"){
        				html += "<li><p class='scheduleName'>"+ result[i].calenderTitle +"</p>";
    				}else if(result[i].calenderTitle == "발표"){
    					html += "<li><p class='announceName'>"+ result[i].calenderTitle +"</p>";
    				}else if(result[i].calenderTitle == "계약"){
    					html += "<li><p class='closeName'>"+ result[i].calenderTitle +"</p>";
    				}
    				html += "<a target='_blank' href='"+ result[i].url+"'>"+result[i].calenderMemo + "</a></li>";
    			
    			}
    			html += "</ul>";
    		}else{
    			html = "<ul style='color:rgb(101, 101, 101);'><li style='border:none;'>해당 날짜에 분양일정이 없습니다.</.li></ul>"
    		}
    		
    		$(".schedule").html(html);
			        	
        };
        
        $(function(){
        	var today = new Date();

        	var year = today.getFullYear();
        	var month = ('0' + (today.getMonth() + 1)).slice(-2);
        	var day = ('0' + today.getDate()).slice(-2);
        	var calenderStart = year + '-' + month  + '-' + day;
        	
        	$.ajax({
            	url:"<%= request.getContextPath()%>/sales/select",
            	method:"get",
            	data:{calenderStart},
            	success:function(result){
            		
            		infoList(result);
            	},
            	error:function(){
            		console.log("에러발생");
            	}
            });

        });

    </script>
	
	
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>