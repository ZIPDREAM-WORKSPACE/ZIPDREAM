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
        /* top: calc(50% - 799px/2 - 114.31px); */
        margin-top: 20px;
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
        width: 150px;
        height: 45px;
        left: 5px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

    #emailct{
        width: 180px;
        height: 45px;
        left: 5px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
        text-align: center;
    }

    #emailcheck{
		position: absolute;
	    width: 115px;
	    height: 45px;
	    left: 440px;
	    top: 135px;
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
	    width: 335px;
	    height: 45px;
	    top: 190px;
	    background: #FFFFFF;
	    border: 0.5px solid #000000;
    }

    #password{
        position: absolute;
	    width: 335px;
	    height: 45px;
	    top: 290px;
	    background: #FFFFFF;
	    border: 0.5px solid #000000;
    }

    #confirmPassword{
        position: absolute;
        width: 360px;
        height: 45px;
        /* top: 535px; */
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
	    bottom: 510px;
	    background: #FFFFFF;
	    border: 0.5px solid #000000;
    }

    #address{
        position: absolute;
        width: 360px;
        height: 45px;
        bottom: 270px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

    #adsearch{
        position: absolute;
        width: 100px;
        height: 47px;
        left: 450px;
        top: 880px;
        background: #4C69A2;
        color: white;
    }

    #detailaddress{
        position: absolute;
        width: 360px;
        height: 45px;
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
        margin-left: 70px;
        margin-top: 100px;  
    }

    h4{
        margin-top: 18px;
    }
   
   
</style>
<body>
<jsp:include page="../common/header.jsp" />

    <div class="wrap">
        <div class="content" id="content">
            <div class="login1">
                <h2 id="login-text">회원정보입력</h2> 
                <p>서비스 이용을 위해 아래내용을 입력해주세요.</p>

                <h4>아이디</h4>
                <input type="text" id="id-text" class="userEmail" name="userEmail" required> <select id="emailct" class="userEmail2" name="userEmail2">
                    <option value="선택안함">선택안함</option>
                    <option value="@naver.com">@naver.com</option>
                    <option value="@gmail.com">@gmail.com</option></select><br><br>
                    <button type="button" id="emailcheck" name="emailcheck" >인증번호 전송</button><br><br>
                    
                    <input type="text" id="emailchecknumber" name="emailCheckNumber" placeholder="인증번호를 입력해주세요.">
                    <button type="button" id="ok">확인</button>
                    

                <h4>비밀번호</h4>
                <input type="password" id="password" name="userPwd" onkeyup="checkPasswordValidity()" placeholder="비밀번호를 입력해주세요." required><br><br>
                <label style="font-size: 13px; color: gray;">※영문자, 숫자, 특수문자(!@#$%^)로 총 8~15자로 입력하세요.</label><br>
                <span id="passwordError" style="color: red; font-size: 13px;" ></span>
                <span id="passwordMessage" style="color: green; font-size: 13px;"></span><br>
                

                <h4>비밀번호 확인</h4>
                <input type="password" id="confirmPassword" name="userPwdCheck" onkeyup="checkPasswordMatch()" placeholder="비밀번호 확인을해주세요." required><br><br>
                <span id="confirmMessage" style="color: red; font-size: 14px;"></span><br>

                <h4>이름</h4>
                <input type="text" id="name" name="username" placeholder="이름을 입력해주세요."><br><br><br>

                <h4>전화번호</h4>
                <input type="text" id="phone" name="phone" placeholder="전화번호를 입력해주세요."><br><br>

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
    	
  //mail인증하기 버튼 클릭 
    $("#emailcheck").on("click",function(){
        isMailAuthed=true;
        let memMail = $("input[name='memMail']").val();
        $.ajax({
        	url : "<%= request.getContextPath()%>/member/mailAuth"
        	,type : "get"
            ,data : {"mail" : memMail}
	 		,dataType : "TEXT"       
            ,success: function(data){
               alert(data);
            },error : function(req,status,err){
                console.log(req);
            }
        });//ajax
    });//mailCheck
    
   
   </script>
</html>