/**
 * 
 */ 

 

		
 // 매물 찜 알림 함수
 function sendMessage1(hu, hc, uno, time, title){
		console.log("이벤트메세지2");
 		 const houseMessage = {
 					"hsUrl" : hu,
		 			"houseCode" : hc,
		 			"userNo" : uno,
		 			"startDateTime" : new Date(),
		 			"title" : title
 		};
 		
 		
 		houseSock.send( JSON.stringify(houseMessage));
 	
 }
 
  // 신고 알림 함수
 function sendMessage2(reportContent,reportDate,refRuno,reportStatus,reportResult,reportType){
		console.log("이벤트메세지3");
 		
 		 const reportMessage = {
 					"reportContent" : reportContent,
		 			"reportDate" : new Date(),
		 			"refRuno" : refRuno,
		 			"reportStatus" : reportStatus,
		 			"reportResult" : reportResult,
		 			"reportType" : reportType
 		};
 		
 		
 		houseSock.send( JSON.stringify(reportMessage));
 	
 }
  // 이벤트 알림 함수
 function sendMessage3(couponContent,couponDate,couponTitle,couponUserNo){
		console.log("이벤트메세지5");
 		
 		 const eventMessage = {
 					"couponContent" : couponContent,
		 			"couponDate" : new Date(),
		 			"couponTitle" : couponTitle,
		 			"userNo" : couponUserNo
 		};
 		
 		
 		houseSock.send( JSON.stringify(eventMessage));
 	
 }
 
   // 공인중개사 매물 매칭 알림 함수
 function sendMessage4(refUno,refRuno,dealType){
		console.log("이벤트메세지6");
 		
 		 const requestMessage = {
		 			"dealType" : dealType,
 					"refUno" : refUno,
		 			"refRuno" : refRuno
 		};
 		
 		
 		houseSock.send( JSON.stringify(requestMessage));
 	
 }

   // 공인중개사 상담 매칭 알림 함수
 function sendMessage5(refUno,refRuno,dealType){
		console.log("이벤트메세지6");
 		
 		 const counsleMessage = {
		 			"dealType" : dealType,
 					"refUno" : refUno,
		 			"refRuno" : refRuno
 		};
 		
 		
 		houseSock.send( JSON.stringify(requestMessage));
 	
 }
		
function addEventMessage(refUno){
	console.log("이벤트메세지");

 houseSock.onmessage = function(e){

 	const houseMessage = JSON.parse(e.data); 
 	console.log(houseMessage);
 	
 
 	
 	if(refUno == houseMessage.userNo && houseMessage.couponTitle == null){
 		const tr1 = document.createElement("tr");
 	tr1.setAttribute("onClick", "clickLink('"+houseMessage.hsUrl+"')");
 	tr1.classList.add("link");
 	const td1 = document.createElement("td");
 	td1.classList.add("title");
 	const td2 = document.createElement("td");
 	td2.classList.add("content");
 	const td3 = document.createElement("td");
 	td3.classList.add("time");
 		td1.innerHTML = houseMessage.title +" 분양 정보";
 		td2.innerHTML = "관심 분양에 등록했습니다."
 		td3.innerHTML = houseMessage.startDateTime;
 	
 		tr1.append(td1, td2,td3);
 		const display = document.getElementsByClassName("noticeThead")[0];
 	
 	display.append(tr1); 
 	
 	display.scrollTop = display.scrollHeight;
 	 }
 
 	
 	 	
 	}
 	

 	
 }

function clickLink(url){
	window.open('about:blank').location.href = url;
};
 
 
    function addEventMessage2(refUno) {
        console.log("이벤트메세지");

        houseSock.onmessage = function (e) {

            const reportMessage = JSON.parse(e.data); // JSON-> JS Object

            console.log(reportMessage);



            if (refUno == reportMessage.refRuno ) {
                const tr1 = document.createElement("tr");
                 tr1.classList.add("manage");
                const td1 = document.createElement("td");
                td1.classList.add("title");
                const td2 = document.createElement("td");
                td2.classList.add("content");
                const td3 = document.createElement("td");
                td3.classList.add("time");

                if (reportMessage.reportType == 1) {
                    td1.innerHTML = "허위매물 신고"

                    
                        td2.innerHTML = "신고하신 허위매물이 " + reportMessage.reportResult;

                 
                    td3.innerHTML = reportMessage.reportDate;
                    tr1.append(td1, td2, td3);
                } else {
                    td1.innerHTML = "회원 신고"

                 
                        td2.innerHTML = "신고하신 회원 신고가 " + reportMessage.reportResult;

                    td3.innerHTML = reportMessage.reportDate;
                    tr1.append(td1, td2, td3);
                }


                const display = document.getElementsByClassName("noticeThead")[0];

                display.append(tr1);

                display.scrollTop = display.scrollHeight;

            }

        }


    }
 
 function addEventMessage3(refUno){
	console.log("어드민이벤트");
	
 houseSock2.onmessage = function(e){
 	
 	const eventMessage = JSON.parse(e.data); // JSON-> JS Object
	if(refUno == eventMessage.userNo && eventMessage.title == null){
 
 	console.log(eventMessage);
 	
 	const tr1 = document.createElement("tr");
 	 tr1.classList.add("manage");
 	const td1 = document.createElement("td");
 	td1.classList.add("title");
 	const td2 = document.createElement("td");
 	td2.classList.add("content");
 	const td3 = document.createElement("td");
 	td3.classList.add("time");
 	
 	
 	
 	 	td1.innerHTML = eventMessage.couponTitle;
 	 	td2.innerHTML = eventMessage.couponContent;
 		td3.innerHTML = eventMessage.couponDate;
 	 	tr1.append(td1, td2,td3);
 	 	
 	
 	const display = document.getElementsByClassName("noticeThead")[0];
 	
 	display.append(tr1); 
 	
 	display.scrollTop = display.scrollHeight;
 	
		
		
 	}
 	}

 }
 
 function addEventMessage4(refUno){
	console.log("이벤트메세지");

 houseSock3.onmessage = function(e){

 	const requestMessage = JSON.parse(e.data); 
 	
 
 	
 	if(refUno == requestMessage.refUno){
 		const tr1 = document.createElement("tr");
 	tr1.classList.add("manage");
 	const td1 = document.createElement("td");
 	td1.classList.add("title");
 	const td2 = document.createElement("td");
 	td2.classList.add("content");
 	const td3 = document.createElement("td");
 	td3.classList.add("time");
 		td1.innerHTML = "매물 매칭";
 		td2.innerHTML = requestMessage.dealType+" 타입의 매물이 공인중개사와 매칭되었습니다.";
 		td3.innerHTML = currentTime();
 	
 		tr1.append(td1, td2,td3);
 		const display = document.getElementsByClassName("noticeThead")[0];
 	
 	display.append(tr1); 
 	
 	display.scrollTop = display.scrollHeight;
 	 }
 
 	
 	 	
 	}
 	

 	
 }
 
 function addEventMessage5(refUno){
	console.log("이벤트메세지8");

 houseSock4.onmessage = function(e){

 	const counsleMessage = JSON.parse(e.data); 
 	
 
 	
 	if(counsleMessage.counsle.content != null && refUno == counsleMessage.refUno){
 		const tr1 = document.createElement("tr");
 	tr1.classList.add("manage");
 	const td1 = document.createElement("td");
 	td1.classList.add("title");
 	const td2 = document.createElement("td");
 	td2.classList.add("content");
 	const td3 = document.createElement("td");
 	td3.classList.add("time");
 		td1.innerHTML = "상담 매칭";
 		td2.innerHTML = "신청하신 상담이 공인중개사와 매칭되었습니다.";
 		td3.innerHTML = currentTime();
 	
 		tr1.append(td1, td2,td3);
 		const display = document.getElementsByClassName("noticeThead")[0];
 	
 	display.append(tr1); 
 	
 	display.scrollTop = display.scrollHeight;
 	 }
 
 	
 	 	
 	}
 	

 	
 }
 
 
 
 function insertSaleNotice(contextPath,hu, uno, time, title){
 	console.log("dd");
 			$.ajax({
					url:contextPath+"/notice/insertSaleNotice",
					data:{noticeUrl : hu, refUno : uno,createDateTime : time, title},
					
					success : function(result){
						
						if(result >= 1){
							console.log("성공");
						}else{
							console.log("실패");
						}
						
					},
			 		error : function(request){
			 			console.log("에러발생");
			 			console.log("에러코드 : "+request.status);
			 			
			 		}
				})
 	
 };
 
  function deleteSaleNotice(contextPath,hu, uno){
 	console.log("dd");
 			$.ajax({
					url:contextPath+"/notice/deleteSaleNotice",
					data:{hu, uno},
					
					success : function(result){
						
						if(result >= 1){
							console.log("성공");
						}else{
							console.log("실패");
						}
						
					},
			 		error : function(request){
			 			console.log("에러발생");
			 			console.log("에러코드 : "+request.status);
			 			
			 		}
				})
 	
 };
 
 
 
  function createNotice(){
		 
		 const div1 = document.createElement("div");
		 const img1 = document.createElement("img");
		 img1.classList.add("alarmImg");
		 img1.setAttribute("src","https://ifh.cc/g/AaFKr9.png");
		 		div1.classList.add("notice1");
		 		div1.append(img1);
		 		div1.innerHTML= "새로운 알림이 도착했습니다.";
		 		const header1 = document.getElementsByClassName("header")[0];
		 		header1.append(div1);
		 		   $( '.notice1' ).fadeOut( 3000, 'swing' );
		 			 
		 };
 
  function insertReportNotice(contextPath,reportContent,reportDate,refRuno, reportResult,reportType ){
 	console.log("dd");
 			$.ajax({
					url:contextPath+"/notice/insertReportNotice",
					data:{noticeContent : reportContent, createDateTime:reportDate,refUno:refRuno, result : reportResult, type :reportType },
					
					success : function(result){
						
						if(result >= 1){
							console.log("성공");
						}else{
							console.log("실패");
						}
						
					},
			 		error : function(request){
			 			console.log("에러발생");
			 			console.log("에러코드 : "+request.status);
			 			
			 		}
				})
 	
 };
 
 function currentTime() {
 	
 	const now = new Date();
 	const time = now.getFullYear() +"년 "
 			   + addZero(now.getMonth() + 1) +"월 "
 			   + addZero(now.getDate()) +"일 " 
 			   + addZero(now.getHours()) + ":"
 			   + addZero(now.getMinutes()) +":"
 			   + addZero(now.getSeconds());
 	return time; 
 }
 
 // 10보다 작은 숫자일경우 앞에 0을 붙여주는 함수 
function addZero(number){
	return number < 10 ? "0"+number :number;
}
 
 
 
 
 
 
 
 
 