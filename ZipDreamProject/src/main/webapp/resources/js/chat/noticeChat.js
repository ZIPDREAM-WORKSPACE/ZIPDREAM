/**
 * 
 */ 

 

		
 // 채팅 보내기 함수
 function sendMessage1(hu, hc, uno, time){
		console.log("이벤트메세지2");
 		
 		// 메세지 입력시 필요한 데이터를 js객체로 생성 
 		 const houseMessage = {
 					"hsUrl" : hu,
		 			"houseCode" : hc,
		 			"userNo" : uno,
		 			"startDateTime" : time
 		};
 		
 		// JSON.parse(문자열) : JSON -> JS Object
 		// JSON.stringify(객체) : JS Object -> JSON
 		
 		// chattingSock(웹 소켓 객체)를 이용해서 메세지 보내기
 		// chattingSock.send(값) : 웹소켓 핸들러로 값을 보냄 
 		
 		houseSock.send( JSON.stringify(houseMessage));
 		

 	
 }

 function notice(){
 console.log("notice");
  houseSock.onmessage = function(e){
 		const div1 = document.createElement("div");
 			div1.classList.add("notice1");
 		div1.innerHTML= "새로운 알림이 도착했습니다.";
 		const header1 = document.getElementsByClassName("header")[0];
 		header1.append(div1);
 		div1.setAttribute("display","block");
 		}
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
 	td1.classList.add("num");
 	const td2 = document.createElement("td");
 	td2.classList.add("title");
 	const td3 = document.createElement("td");
 	td3.classList.add("content");
 	
 	td1.innerHTML = houseMessage.houseCode;
 	td2.innerHTML = houseMessage.hsUrl;
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
 	

 	}
 	

 }
 
function clickLink(url){
	location.href = url;
};
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 