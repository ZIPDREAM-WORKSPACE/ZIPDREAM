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
    }

    #emailcheck{
		position: absolute; 
	    width: 114px;
	    height: 45px;
	   left: 800px;
	    top: 190px; 
	    background-color: #4C69A2;
	    color: white;
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

    #address{
       position: absolute; 
	    width: 360px;
	    height: 45px;
	    bottom: 340px;
	    top: 755px;
	    background: #FFFFFF;
	    border: 0.5px solid #000000;
    }

    #adsearch{
             position: absolute; 
		    width: 114px;
		    height: 45px;
		     left: 450px; 
		     top: 755px; 
		    background: #4C69A2;
		    color: white;
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
		    margin-top: 160px;  
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
              <form action=""></form>
                <h2 id="login-text">회원정보입력</h2> 
                <p>서비스 이용을 위해 아래내용을 입력해주세요.</p>

                <h4>아이디</h4>
                <input type="text" id="id-text" class="userEmail" name="userId" required> <select id="emailct" class="userEmail2" name="userEmail2">
                    <option value="선택안함">선택안함</option>
                    <option value="@naver.com">@naver.com</option>
                    <option value="@gmail.com">@gmail.com</option></select>
                    <button type="button" id="emailcheck" name="emailcheck" >인증번호 전송</button><br><br>
                    
                    <input type="text" id="emailchecknumber" name="emailCheckNumber" placeholder="인증번호를 입력해주세요.">
                	<button  id="ok" >확인</button><br><br>
                    
			<!-- <div class="login2"></div> -->
                <h4>비밀번호</h4>
                <input type="password" id="password" name="userPwd" onkeyup="checkPasswordValidity()" placeholder="비밀번호를 입력해주세요." required><br><br>
                <label style="font-size: 13px; color: gray;">※영문자, 숫자, 특수문자(!@#$%^)로 총 8~15자로 입력하세요.</label><br>
                <span id="passwordError" style="color: red; font-size: 13px;" ></span><br>
                <span id="passwordMessage" style="color: green; font-size: 13px;"></span>
                

                <h4>비밀번호 확인</h4>
                <input type="password" id="confirmPassword" name="userPwdCheck" onkeyup="checkPasswordMatch()" placeholder="비밀번호 확인을해주세요." required><br><br>
                <span id="confirmMessage" style="color: red; font-size: 14px;"></span><br>

                <h4>이름</h4>
                <input type="text" id="name" name="userName" placeholder="이름을 입력해주세요."><br><br><br>

                <h4>전화번호</h4>
                <input type="text" id="phone" name="phone" placeholder="전화번호를 입력해주세요."><br><br><br>

                <h4>주소</h4>
                <input type="text" id="address" name="address" placeholder="우편번호"><br><br>
                <button type="button" id="adsearch" name="adsearch">검색</button>
                <input type="text" id="detailaddress" placeholder="상세주소를 입력해주세요.">
                
                <a href="" ><button type="submit" id="signupbtn">가입하기</button></a>
				
				
            </div>
            
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    
    
    
</body>
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
    	
  //mail인증하기 버튼 클릭 
     $("#emailcheck").on("click",function(){
        isMailAuthed=true;
        let memMail = $("#id-text").val();
        console.log(memMail);
        $.ajax({
        	url : "<%= request.getContextPath()%>/member/mailAuth"
            ,data : {mail : memMail}
        	,method : "get"
	 		,dataType : "TEXT"       
            ,success: function(data){
               alert(data);
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
    // 입력한 인증번호
    var inputCode = document.getElementById("emailchecknumber").value;

    // 서버에서 가져온 저장된 인증번호
    var savedCode = document.getElementById("emailCheckNumber").value; 

    // 인증번호 일치 여부 확인
    if (inputCode === savedCode) {
        alert("인증번호가 일치합니다.");
        // 여기에서 추가 동작을 수행하거나 다음 단계로 진행할 수 있습니다.
    } else {
        alert("인증번호가 일치하지 않습니다.");
        // 여기에서 적절한 오류 처리를 수행할 수 있습니다.
    }
});
     
  

    
    
   
   </script>
</html>