/**
 * 
 */ 

 

		
 // 매물 찜 알림 함수
 function sendMessage1(hu, hc, uno, time, title){
		console.log("이벤트메세지2");
 		// 메세지 입력시 필요한 데이터를 js객체로 생성 
 		 const houseMessage = {
 					"hsUrl" : hu,
		 			"houseCode" : hc,
		 			"userNo" : uno,
		 			"startDateTime" : time,
		 			"title" : title
 		};
 		
 		
 		houseSock.send( JSON.stringify(houseMessage));
 	
 }
 
  // 신고 알림 함수
 function sendMessage2(reportContent,reportDate,refRuno,reportStatus,reportResult,reportType){
		console.log("이벤트메세지3");
 		
 		// 메세지 입력시 필요한 데이터를 js객체로 생성 
 		 const reportMessage = {
 					"reportContent" : reportContent,
		 			"reportDate" : reportDate,
		 			"refRuno" : refRuno,
		 			"reportStatus" : reportStatus,
		 			"reportResult" : reportResult,
		 			"reportType" : reportType
 		};
 		
 		
 		houseSock.send( JSON.stringify(reportMessage));
 	
 }



		
function addEventMessage(){
	console.log("이벤트메세지");

 // 웹소켓 핸들러에서 sendMessage라는 함수가 호출되었을때를 캐치하는 이벤트 핸들러 
 houseSock.onmessage = function(e){

 	// 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체 
 	// e.data : 전달된 메세지가 담겨있음 (JSON객체) ==> message.getPayload()
 	
 	// 전달받은 메세지를 JS객체로 변환 
 	const houseMessage = JSON.parse(e.data); // JSON-> JS Object
 	console.log(houseMessage);
 	
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
 	
 	// 내용
 	
 
 	
 	// 내가 쓴 채팅 : span -> p 
 	// 남이 쓴 채팅 : p -> span 
 
 	 
 	 	tr1.append(td1, td2,td3);
 	 	
 	
 	
 	// 채팅창
 	const display = document.getElementsByClassName("noticeThead")[0];
 	
 	// 채팅창에 채팅 추가 
 	display.append(tr1); 
 	
 	// 채팅창 제일 밑으로 내리는 코드 추가
 	display.scrollTop = display.scrollHeight;
 	// scrollTop : 스크롤 이동시켜주는 속성
 	// scrollHeight : 스크롤 되는 요소의 전체 높이 
 	createNotice();
 	 	
 	}
 	

 	
 }
 function createNotice(){
 
 const div1 = document.createElement("div");
 		div1.classList.add("notice1");
 		div1.innerHTML= "새로운 알림이 도착했습니다.";
 		const header1 = document.getElementsByClassName("header")[0];
 		header1.append(div1);
 		   $( '.notice1' ).fadeOut( 3000, 'swing' );
 
 };
function clickLink(url){
	location.href = url;
};
 
 
 function addEventMessage2(refUno){
	console.log("이벤트메세지");
	
 // 웹소켓 핸들러에서 sendMessage라는 함수가 호출되었을때를 캐치하는 이벤트 핸들러 
 houseSock.onmessage = function(e){
 	

 	// 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체 
 	// e.data : 전달된 메세지가 담겨있음 (JSON객체) ==> message.getPayload()
 	
 	// 전달받은 메세지를 JS객체로 변환 
 	const reportMessage = JSON.parse(e.data); // JSON-> JS Object
 
 	console.log(reportMessage);
 	
 	const tr1 = document.createElement("tr");
 	const td1 = document.createElement("td");
 	td1.classList.add("title");
 	const td2 = document.createElement("td");
 	td2.classList.add("content");
 	const td3 = document.createElement("td");
 	td3.classList.add("time");
 	
  	console.log(reportMessage.refRuno);
  	console.log(refUno);
 	
 	// 내용
 	
 	
 	// 내가 쓴 채팅 : span -> p 
 	// 남이 쓴 채팅 : p -> span 
 	if(refUno == reportMessage.refRuno &&  reportMessage.reportType==1 ){
 	 	td1.innerHTML = "허위매물 신고"
 	 	
 	 	if( reportMessage.reportResult=="승인되었습니다." ){
 	 			td2.innerHTML = "신고하신 허위매물이 "+reportMessage.reportResult;
 	
 	 	}else{
 	 		td2.innerHTML = "신고하신 허위매물이 "+reportMessage.reportResult;
 		
 	 	}
 		td3.innerHTML = reportMessage.reportDate;
 	 	tr1.append(td1, td2,td3);
 	 }	else if (refUno == reportMessage.refTuno &&  reportMessage.reportType==2 ){
 	 	td1.innerHTML = "회원 신고"
 	 	
 	 	if( reportMessage.reportResult=="승인되었습니다." ){
 	 			td2.innerHTML = "신고하신 회원 신고가 "+reportMessage.reportResult;
 	
 	 	}else{
 	 		td2.innerHTML = "신고하신 회원 신고가 "+reportMessage.reportResult;
 		
 	 	}
 		td3.innerHTML = reportMessage.reportDate;
 	 	tr1.append(td1, td2,td3);
 	 	}
 	
 	
 	// 채팅창
 	const display = document.getElementsByClassName("noticeThead")[0];
 	
 	// 채팅창에 채팅 추가 
 	display.append(tr1); 
 	
 	// 채팅창 제일 밑으로 내리는 코드 추가
 	display.scrollTop = display.scrollHeight;
 	// scrollTop : 스크롤 이동시켜주는 속성
 	// scrollHeight : 스크롤 되는 요소의 전체 높이 
 	
		createNotice();
 	}
 	

 }
 
 
 
 function insertNotice(){
 	
 	
 };
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 