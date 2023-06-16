<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
     div{
        box-sizing: border-box;
        border : 0px solid black;
    } 
    .wrap{
        width:1500px;
        height:1500px;
    }
  
    .wrap>div {
        width: 100%;      
    }
    
    #header{
        height:100%; 
    }
   
    #content{
        height:100%;
         
    }

    .login1{
    	position: absolute;
        box-sizing: border-box;
        position: absolute;
        width: 680px;
        height: 1450px;
        right: 620px;
        margin-top: 20px;
        background: #FFFFFF;
        border: 0.5px solid #A0A0A0;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        padding-left: 4.5%;
    }
   
    #brokerlogin-text{
        font-style: normal;
        font-weight: 270px;
        font-size: 35px;
        display: flex;
        align-items: center;
        text-align: center;
        color: #326CF9;
        margin-left: 90px;
 		margin-top: 15px;
    }

    #confirmPassword{
        position: absolute;
        width: 360px;
        height: 45px;
        top: 535px;
        background: #FFFFFF;
    }


    #brokeraddress{
        position: absolute;
        width: 480px;
        height: 45px;
        top: 140px;
        background: #FFFFFF;
    }
    
    #addr1{
        position: absolute;
	    width: 360px;
	    height: 45px;
	    top: 245px;
	    background: #FFFFFF;
	    
    }

    #addr2{
        position: absolute;
	    width: 300px;
	    height: 45px;
	    top: 245px;
	    left: 270px;
	    background: #FFFFFF;
	    
    }

    #addr3{
        position: absolute;
        width: 360px;
        height: 45px;
        top: 300px;
        background: #FFFFFF;
        
    }

    #adsearch{
        position: absolute;
	    width: 110px;
	    height: 45px;
	    left: 460px;
	    top: 300px;
	    background: #4C69A2;
	    color: white;
	    font-size: 14px;
    }

    .licensebox{
        box-sizing: border-box;
        position: absolute;
        width: 203px;
        height: 250px;
        left: 24px;
        top: 420px;
        background: #FFFFFF;
        border: 1px solid #B9B9B9;
    }
    .licensebox img, .licensebox1-1 img, .licensebox1-2 img{
        width: 100%;
        height:  100%;
        object-fit: cover;
    }

    #license{
        margin-left: -40px;
    }

    .licensebox1-1{
        box-sizing: border-box;
        position: absolute; 
        width: 203px;
        height: 250px;
        left: 75px;
        top: 420px;
        background: #FFFFFF;
        border: 1px solid #B9B9B9;
        margin-left: 165px;
    }

    #license1-1{
        margin-top: -33px;
        margin-left: 187px;
            
    }

    .licensebox1-2{
        box-sizing: border-box;
        position: absolute; 
        width: 203px;
        height: 250px;
        left: 290px;
        top: 420px;
        background: #FFFFFF;
        border: 1px solid #B9B9B9;
        margin-left: 165px;
    }

    #license1-2{
        margin-top: -30px;
        margin-left: 413px;
            
    }

    #id-text{
    	position: absolute;
        width: 150px;
        height: 44px;
        background: #FFFFFF;
    }

    #emailct{
    	position: absolute;
        width: 180px;
        height: 45px;
        left: 250px;
        background: #FFFFFF;
        text-align: center;
        border: 1px solid #ced4da;
        border-radius: 5px;
    }

    #emailcheck{
        position: absolute;
        width: 120px;
        height: 45px;
        left: 450px;
        background-color: #4C69A2;
        color: white;
        font-size: 12px;
        top: 726px;
    }
    
    #emailCheck{
    	position: absolute;
	    width: 120px;
	    height: 45px;
	    left: 450px;
	    background-color: #4C69A2;
	    color: white;
    }

    #id{
        margin-top: -10px;
    }

    #emailchecknumber{
        position: absolute;
       	width: 344px;
       	height: 45px;
       	top: 780px;
       	background: #FFFFFF;
    }

    #ok{
        position: absolute;
        width: 120px;
	    height: 45px;
        left: 450px;
        top: 780px;
        background-color: #4C69A2;
        color: white;
    }
    
    

    #password{
        position: absolute;
        width: 360px;
        height: 45px;
        top: 880px;
        background: #FFFFFF;
         
    }

    #confirmPassword{
        position: absolute;
        width: 360px;
        height: 45px;
        top: 1020px;
        background: #FFFFFF;
         
    }

   

    #name{
        position: absolute;
        width: 360px;
        height: 45px;
        bottom: 275px;
        background: #FFFFFF;
         
    }

    #phone{
        position: absolute;
        width: 360px;
        height: 45px;
        bottom: 165px;
        background: #FFFFFF;
         
    }

    #signupbtn{
        width: 330px;
        height: 48px;
        right: 520px;
        bottom: 100px;
        background: darkblue;
        border: none;
        color: white;
        border-radius: 8px;
        align-items: center;
        margin-left: 100px;
        margin-top: 16px;  
    }

    .real-upload, .real-upload1{
        object-fit: cover;
    }

    li{
        list-style-type: none;
    }
    
    .licenseImg{
    	overflow:hidden;
    }
</style>
<body>
<jsp:include page="../common/header.jsp" />

   <div class="wrap">
        <div class="content" id="content">
            <div class="login1">
                <form id="signApplyform" action="bkinsert" enctype="multipart/form-data" method="post" name="signApplyform" >
                <h3 id="brokerlogin-text">중개사 회원정보 입력</h3> 
                <p style="margin-left:95px;">서비스 이용을 위해 아래내용을 입력해주세요.</p>

                <h4>중개사무소명</h4>             
                <input type="text" id="brokeraddress" class="form-control" name="office" placeholder="사무소명을 입력해주세요."><br><br><br>
                

                <h4>소재지</h4>
                <div class="form-group">                   
				<input class="form-control" style="width: 26%; display: inline;" placeholder="우편번호" name="address" id="addr1" type="text" readonly="readonly" >
				    <button type="button" class="btn btn-default"  id="adsearch" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
				</div>
				<div class="form-group">
				    <input class="form-control"  placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
				</div>
				<div class="form-group">
				    <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
				</div><br><br><br><br><br>

                <h5 id="license">사업자 등록증 등록</h5>

                <input type="file" class="real-upload form-control" accept="images/*"   style="display: none;" name="imges">
                <div class="licensebox" ></div>

                    
         

                  
                <h5 id="license1-1">중개등록증 등록</h5>

                <input type="file" class="real-upload1 form-control" accept="images/*"   style="display: none;" name="imges">
                <div class="licensebox1-1"></div>

                


                <h5 id="license1-2">증명사진 등록</h5>
                <input type="file" class="real-upload3" accept="images/*"   style="display: none;" name="imges">
                <div class="licensebox1-2 licenseImg" ></div> 
                    
                
            
                <br><br><br><br><br><br><br><br><br><br><br><br>
                
                <h4 id="id">아이디</h4>
                <input type="text" id="id-text" style="display: block;" class="userEmail form-control" name="userEmail" required> 
                <select id="emailct" class="userEmail2" name="userEmail2">
                    <option value="선택안함">선택안함</option>
                    <option value="@naver.com">@naver.com</option>
                    <option value="@gmail.com">@gmail.com</option></select>
                    <button type="button" id="emailCheck" class="btn btn-default" name="emailCheck" >중복확인</button><br><br>
                    <button type="button" id="emailcheck" class="btn btn-default" name="emailcheck" style="display:none;">인증번호 전송</button><br><br>
                    
                    <input type="hidden" class="form-control" id="userEmail" name="userId">
                    <input type="text" class="form-control" id="emailchecknumber" name="emailCheckNumber" placeholder="인증번호를 입력해주세요.">
                   <button  type="button" class="btn btn-default" id="ok" >확인</button>
                <br> 
                <h4>비밀번호</h4>
                <input type="password" id="password" class="form-control" name="userPwd" onkeyup="checkPasswordValidity()" placeholder="비밀번호를 입력해주세요." required><br><br>
                <label style="font-size: 13px; color: gray;">※영문자, 숫자, 특수문자(!@#$%^)로 총 8~15자로 입력하세요.</label><br>
                <span id="passwordError" style="color: red; font-size: 13px;" ></span>
                <span id="passwordMessage" style="color: green; font-size: 13px;"></span><br>
                

                <h4>비밀번호 확인</h4>
                <input type="password" id="confirmPassword" class="form-control" name="userPwdCheck"onkeyup="checkPasswordMatch()" placeholder="비밀번호 확인을해주세요." required><br><br>
                <span id="confirmMessage" style="color: red; font-size: 14px;"></span><br>

                <h4>이름</h4>
                <input type="text" id="name" class="form-control" name="userName" placeholder="이름을 입력해주세요."><br><br><br>

                <h4>전화번호</h4>
                <input type="text" id="phone" class="form-control" name="phone" placeholder="전화번호를 입력해주세요."><br><br><br>

                <a href="" ><button type="submit" class="btn btn-default" id="signupbtn">가입하기</button></a>

                </form>
            </div>
            
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--비밀번호 유효성 검사 -->
    <script>
        function checkPasswordValidity() {
      var password = document.getElementById("password").value;
      var passwordError = document.getElementById("passwordError");
      var passwordMessage = document.getElementById("passwordMessage");
      
      var validPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!?@#$%^])[a-zA-Z\d!?@#$%^]{8,15}$/;
      
      if (password.trim() === "") {
        passwordError.textContent = "";
        passwordMessage.textContent = "";
      } else if (validPattern.test(password)) {
        passwordError.textContent = "";
        passwordMessage.textContent = "사용 가능합니다.";
      } else {
        passwordError.textContent = "비밀번호는 영문자, 숫자, 특수문자(!?@#$%^)를 조합하여 8~15자로 입력해야 합니다.";
        passwordMessage.textContent = "";
      }
      
      checkPasswordMatch();
    }
    
    // 비밀번호 확인 검사
    function checkPasswordMatch() {
      var password = document.getElementById("password").value;
      var confirmPassword = document.getElementById("confirmPassword").value;
      var confirmMessage = document.getElementById("confirmMessage");
      
      if (password === confirmPassword && password !== "") {
        confirmMessage.textContent = "확인 완료되었습니다.";
        confirmMessage.style.color = "green";
      } else if (confirmPassword !== "") {
        confirmMessage.textContent = "비밀번호 불일치";
        confirmMessage.style.color = "red";
      } else {
        confirmMessage.textContent = "";
      }
    }

    //중개사 회원가입 첫번쨰 사진
     function getImageFiles1(e) {
        const uploadFiles = [];
        const files = e.currentTarget.files;
            const licensebox = document.querySelector('.licensebox');
            const docFrag = new DocumentFragment();

            if ([...files].length >= 2) {
                alert('이미지는 최대 3개 까지 업로드가 가능합니다.');
                return;
            }

            // 파일 타입 검사
            [...files].forEach(file => {
                if (!file.type.match("image/.*")) {
                alert('이미지 파일만 업로드가 가능합니다.');
                return
                }

                // 파일 갯수 검사
                if ([...files].length < 7) {
                	licensebox.innerHTML = "";
                uploadFiles.push(file);
                const reader = new FileReader();
                reader.onload = (e) => {
                    const preview = createElement(e, file);
                    licensebox.appendChild(preview);
                };
                reader.readAsDataURL(file);
                }
            });
            }

            function createElement(e, file) {
            const li = document.createElement('li');
            const img = document.createElement('img');
            img.setAttribute('src', e.target.result);
            img.setAttribute('data-file', file.name);
            li.appendChild(img);

            return li;
            }

            const realUpload = document.querySelector('.real-upload');
            const upload = document.querySelector('.licensebox');

            upload.addEventListener('click', () => realUpload.click());

            realUpload.addEventListener('change', getImageFiles1);

              
         // 중개사회원가입 두번째 사진
          function getImageFiles2(e) {
            const uploadFiles = [];
            const files = e.currentTarget.files;
                const licensebox1 = document.querySelector('.licensebox1-1');
                const docFrag = new DocumentFragment();

                if ([...files].length >= 2) {
                    alert('이미지는 최대 1개 까지 업로드가 가능합니다.');
                    return;
                }

                // 파일 타입 검사
                [...files].forEach(file => {
                    if (!file.type.match("image/.*")) {
                    alert('이미지 파일만 업로드가 가능합니다.');
                    return
                    }

                    // 파일 갯수 검사
                    if ([...files].length < 7) {
                    	licensebox1.innerHTML = "";
                    uploadFiles.push(file);
                    const reader = new FileReader();
                    reader.onload = (e) => {
                        const preview2 = createElement(e, file);
                        licensebox1.appendChild(preview2);
                    };
                    reader.readAsDataURL(file);
                    }
                });
                }

                function createElement(e, file) {
                const li = document.createElement('li');
                const img = document.createElement('img');
                img.setAttribute('src', e.target.result);
                img.setAttribute('data-file', file.name);
                li.appendChild(img);

                return li;
                }

                const realUpload1 = document.querySelector('.real-upload1');
                const upload1 = document.querySelector('.licensebox1-1');

                upload1.addEventListener('click', () => realUpload1.click());

                realUpload1.addEventListener('change', getImageFiles2);  
                    
            //중개사 회원가입 세번째사진
             function getImageFiles3(e) {
                const uploadFiles = [];
                const files = e.currentTarget.files;
                    const licensebox2 = document.querySelector('.licensebox1-2');
                    const docFrag = new DocumentFragment();

                    if ([...files].length >= 4) {
                        alert('이미지는 최대 3개 까지 업로드가 가능합니다.');
                        return;
                    }

                    // 파일 타입 검사
                    [...files].forEach(file => {
                        if (!file.type.match("image/.*")) {
                        alert('이미지 파일만 업로드가 가능합니다.');
                        return
                        }

                        // 파일 갯수 검사
                        if ([...files].length < 7) {
                        	licensebox2.innerHTML = "";
                        uploadFiles.push(file);
                        const reader = new FileReader();
                        reader.onload = (e) => {
                            const preview = createElement(e, file);
                            licensebox2.appendChild(preview);
                        };
                        reader.readAsDataURL(file);
                        }
                    });
                    }

                    function createElement(e, file) {
                    const li = document.createElement('li');
                    const img = document.createElement('img');
                    img.setAttribute('src', e.target.result);
                    img.setAttribute('data-file', file.name);
                    li.appendChild(img);

                    return li;
                    }

                    const realUpload3 = document.querySelector('.real-upload3');
                    const upload3 = document.querySelector('.licensebox1-2');

                    upload3.addEventListener('click', () => realUpload3.click());

                    realUpload3.addEventListener('change', getImageFiles3);  
              
                    
                    
                    
                    var verificationNumber = ""; // 인증번호를 저장하는 변수
                    //mail인증하기 버튼 클릭 
                       $("#emailcheck").on("click",function(){
                          isMailAuthed=true;
                          let memMail = $("#id-text").val();
                          let memMail2 = $("#emailct option:checked").text();
                          let Mail = memMail + memMail2;
                          $("#emailcheck").text("인증번호 재전송");

                          $.ajax({
                             url : "<%= request.getContextPath()%>/member/mailAuth"
                              ,data : {mail : Mail}
                             ,method : "get"
                            ,dataType : "TEXT"    
                            ,async:false
                              ,success: function(data){
                                 alert("인증번호를 전송완료.");
                                 verificationNumber = data;
                              },error : function(req,status,err){
                                  console.log(req);
                              }
                          });//ajax
                      });//mailCheck 
                      
                      
                      //인증하기 버튼 클릭시 숨겨진 박스 나오기(시간날떄 작업)
                      
                       /* document.getElementById("emailcheck").addEventListener("click", function() {
                      document.getElementById("emailchecknumber").style.display = "block";
                      document.getElementById("ok").style.display = "block";
                    });  */
                      
                      //인증번호 유효성 검사
                      document.getElementById("ok").addEventListener("click", function() {
                      var inputNumber = document.getElementById("emailchecknumber").value;
                      
                     
                      
                      
                      // 인증번호를 받은 후 이 변수에 해당 인증번호를 할당해야 합니다.

                      if (inputNumber === verificationNumber && verificationNumber != "") {
                        let email = document.getElementById("emailct");
                        let value = document.getElementById("id-text").value + (email.options[email.selectedIndex].value);

                        document.getElementById("userEmail").value = value;
                        $("#id-text").attr("readonly",true).css("background-color", "rgb(237, 237, 237)");
                        $("#emailchecknumber").attr("readonly",true).css("background-color", "rgb(237, 237, 237)");
                        $("#emailct").attr('disabled',true); 
                        alert("인증번호가 일치합니다.");
                      } else {
                        alert("인증번호가 일치하지 않습니다.");
                      } 
                        
                    }); 
                    
                  //주소 가져오기
                    function execPostCode() {
                           new daum.Postcode({
                               oncomplete: function(data) {	
                                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                   
                                  // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                  var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                                  var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                   
                                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                      extraRoadAddr += data.bname;
                                  }
                                  // 건물명이 있고, 공동주택일 경우 추가한다.
                                  if(data.buildingName !== '' && data.apartment === 'Y'){
                                     extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                  }
                                  // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                  if(extraRoadAddr !== ''){
                                      extraRoadAddr = ' (' + extraRoadAddr + ')';
                                  }
                                  // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                                  if(fullRoadAddr !== ''){
                                      fullRoadAddr += extraRoadAddr;
                                  }
                   
                                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                  console.log(data.zonecode);
                                  console.log(fullRoadAddr);
                                  
                                  
                                  $("[id=addr1]").val(data.zonecode);
                                  $("[name=addr2]").val(fullRoadAddr);
                                  
                                  document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
                                  document.getElementById('addr2').value = fullAddr;
                              }
                           }).open();
                  };
                  
                  $("#emailCheck").on("click",function(){
                	     let email = document.getElementById("emailct");
                	     let value = document.getElementById("id-text").value + (email.options[email.selectedIndex].value);
                	     $.ajax({
                	         url : "<%= request.getContextPath()%>/member/emailCheck"
                	          ,data : {id : value}
                	         ,method : "get"
                	          
                	          ,success: function(data){
                	            if(data==1){
                	               alert("이미 가입된 아이디 입니다.");
                	               $("#id-text").val("");
                	            }else{
                	               alert("사용가능한 아이디입니다");
                	               $("#emailCheck").css("display","none");
                	               $("#emailcheck").css("display","block");

                	            }
                	          },error : function(req,status,err){
                	              console.log(req);
                	          }
                	      });//ajax
                	    
                	  });
    
      </script>
</html>