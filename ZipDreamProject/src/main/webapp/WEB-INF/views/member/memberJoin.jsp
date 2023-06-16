<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<style>
    div{
        box-sizing: border-box;
        border : 0px solid black;
    }
    .wrap{
        width:1500px;
        height:1500px;
        margin : auto;
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
        box-sizing: border-box;
         position: absolute; 
        width: 600px;
        height: 1200px;
        right: 440px;
        margin-top: 100px;
        background: #FFFFFF;
        border: 0.5px solid #A0A0A0;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        padding-left: 4.5%;
    }
   
    #login-text{
        font-family: 'Inter';
        font-style: normal;
        font-weight: 270px;
        font-size: 43px;
        display: flex;
        align-items: center;
        text-align: center;
        color: #326CF9;
        margin-left: -5px;
 
    }

    #id-text{
        width: 170px;
        height: 45px;
        left: 5px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

    #emailct{
        width: 186px;
       height: 45px;
       left: 5px;
       background: #FFFFFF;
       border: 0.5px solid #000000;
       text-align: center;
   }
    

    #emailcheck{
      position: absolute;
       width: 114px;
       height: 44px;
       left: 440px;
       top: 135px;
       background-color: #4C69A2;
       color: white;
       font-size: 10px;
    }
        #emailCheck{
      position: absolute;
       width: 114px;
       height: 44px;
       left: 440px;
       top: 135px;
       background-color: #4C69A2;
       color: white;
       font-size: 10px;
    }

    #ok{
         position: absolute; 
       width: 114px;
       height: 45px;
      left: 440px;
       top: 190px; 
       background-color: #4C69A2;
       color: white;
    }
    
    #emailCheck{
    	position: absolute; 
       width: 114px;
       height: 45px;
      left: 440px; 
       background-color: #4C69A2;
       color: white;
    }

    #pwd-text{
        width: 450px;
        height: 50px;
        left: 5px;
        background: #FFFFFF;
        border: 0.5px solid #000000;

    }

    #id-check{
        box-sizing: border-box;
        width: 24px;
        height: 24px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

    #loginbtn{
         width: 330px;
         height: 48px;
         right: 520px;
         background: #326CF9;
         border-radius: 8px;
         align-items: center;
         margin-left: 50px;
        }

    #btn1, #btn2{
        border: none;
        background-color: white;
        }
    
    #emailchecknumber{
           position: absolute; 
          width: 360px;
          height: 45px;
          top: 190px;
          background: #FFFFFF;
          border: 0.5px solid #000000;
    }

    #password{
        position: absolute; 
       width: 360px;
       height: 45px;
      top: 290px; 
       background: #FFFFFF;
       border: 0.5px solid #000000;
    }

    #confirmPassword{
        position: absolute;
       width: 360px;
       height: 45px;
       top: 430px;
       background: #FFFFFF;
       border: 0.5px solid #000000;
    }

    #name{
        position: absolute; 
       width: 360px;
       height: 45px;
       bottom: 480px;
       top: 540px; 
       background: #FFFFFF;
       border: 0.5px solid #000000;
    }

    #phone{
        position: absolute; 
       width: 360px;
       height: 45px;
       top: 650px;
       bottom: 510px;
       background: #FFFFFF;
       border: 0.5px solid #000000;
    }

    #addr1{
       position: absolute; 
       width: 360px;
       height: 45px;
       bottom: 340px;
       top: 755px;
       background: #FFFFFF;
       border: 0.5px solid #000000;
    }
    
    #addr2{
       position: absolute; 
       width: 360px;
       height: 45px;
       bottom: 340px;
       top: 810px;
       background: #FFFFFF;
       border: 0.5px solid #000000;
    }
    
    #addr3{
       position: absolute; 
       width: 360px;
       height: 45px;
       bottom: 340px;
       top: 865px;
       background: #FFFFFF;
       border: 0.5px solid #000000;
    }
    

    #adsearch{
             position: absolute; 
          width: 114px;
          height: 45px;
           left: 315px; 
           top: 755px; 
          background: #4C69A2;
          color: white;
          font-size: 15px;
    }

    #detailaddress{
            position: absolute; 
          width: 360px;
          height: 45px;
          top: 810px; 
          background: #FFFFFF;
          border: 0.5px solid #000000;

    }

    #signupbtn{
            width: 330px;
          height: 48px;
          right: 520px;
          bottom: 100px;
          background: #B9B9B9;
          border-radius: 8px;
          align-items: center;
          margin-left: 65px;
          margin-top: 240px;  
    }

    h4{
        margin-top: 18px;
    }
    
  /*  .login2{
       position: absolute; 
    right: 5%;
    top: 15%;
    width: 9%;
    height: 40px;
    font-size: 1.1vw;
    text-align: center; 
     border-radius: 10px; 
     min-width: 70px; 
    line-height: 40px;
    font-weight: 500;
    }  */ 
   
   
</style>
<body>
<jsp:include page="../common/header.jsp" />

    <div class="wrap">
        <div class="content" id="content">
            <div class="login1">
              <form id="signUpform" action="insert" method="post" name="sign-up" >
                <h2 id="login-text">회원정보입력</h2> 
                <p>서비스 이용을 위해 아래내용을 입력해주세요.</p>

                <h4>아이디</h4>
                <input type="text" id="id-text" class="userEmail" name="userEmail" required> <select id="emailct" class="userEmail2" name="userEmail2">
                    <option value="선택안함">선택안함</option>
                    <option value="@naver.com">@naver.com</option>
                    <option value="@gmail.com">@gmail.com</option></select>
                     <button type="button" id="emailCheck" name="emailCheck" >중복확인</button><br><br>
                    <button type="button" id="emailcheck" name="emailcheck" style="display:none;">인증번호 전송</button><br><br>
                    
                    <input type="hidden" id="userEmail" name="userId">
                    <input type="text" id="emailchecknumber" name="emailCheckNumber" placeholder="인증번호를 입력해주세요.">
                   <button  type="button" id="ok" >확인</button>
                    
         <!-- <div class="login2"></div> -->
                <h4>비밀번호</h4>
                <input type="password" id="password" name="userPwd" onkeyup="checkPasswordValidity()" placeholder="비밀번호를 입력해주세요." required><br><br>
                <label style="font-size: 13px; color: gray;">※영문자, 숫자, 특수문자(!@#$%^)로 총 8~15자로 입력하세요.</label><br>
                <span id="passwordError" style="color: red; font-size: 13px;" ></span>
                <span id="passwordMessage" style="color: green; font-size: 13px;"></span><br>
                

                <h4>비밀번호 확인</h4>
                <input type="password" id="confirmPassword" name="userPwdCheck" onkeyup="checkPasswordMatch()" placeholder="비밀번호 확인을해주세요." required><br><br>
                <span id="confirmMessage" style="color: red; font-size: 14px;"></span><br>

                <h4>이름</h4>
                <input type="text" id="name" name="userName" placeholder="이름을 입력해주세요."><br><br><br>

                <h4>전화번호</h4>
                <input type="text" id="phone" name="phone" placeholder="전화번호를 입력해주세요."><br><br><br>
      
                <h4>주소</h4>
            <div class="form-group">                   
            <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="address" id="addr1" type="text" readonly="readonly" >
                <button type="button" class="btn btn-default"  id="adsearch" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
            </div>
            <div class="form-group">
                <input class="form-control"  placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
            </div>
            <div class="form-group">
                <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
            </div>

                <a href="" ><button type="submit" id="signupbtn">가입하기</button></a>
            
            </form>
               </div>
        
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    
    
    
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function ok(){
   
   var text = document.getElementById("emailchecknumber").value;
   console.log(text);
};
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
    };
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
     }
  
  $("#id-text").on("click",function(){
     let email = document.getElementById("emailct");
     let value = document.getElementById("id-text").value + (email.options[email.selectedIndex].value);
     $.ajax({
         url : "<%= request.getContextPath()%>/member/emailCheck"
         ,data : {id : value}
         ,method : "get"
          
          ,success: function(data){
            if(data==0){
               alert(".");
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