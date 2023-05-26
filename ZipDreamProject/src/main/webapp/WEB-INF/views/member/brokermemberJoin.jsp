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

    .login{
        box-sizing: border-box;
        position: absolute;
        width: 680px;
        height: 1450px;
        right: 440px;
        /* top: calc(50% - 799px/2 - 114.31px); */
        margin-top: 20px;
        background: #FFFFFF;
        border: 0.5px solid #A0A0A0;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        padding-left: 4.5%;
    }
   
    #brokerlogin-text{
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

    #confirmPassword{
        position: absolute;
        width: 360px;
        height: 45px;
        top: 535px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }


    #brokeraddress{
        position: absolute;
        width: 360px;
        height: 45px;
        top: 200px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

    #brokeraddress2{
        position: absolute;
        width: 360px;
        height: 45px;
        top: 300px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

    #brokeraddress2-1{
        position: absolute;
        width: 360px;
        height: 45px;
        top: 355px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

    #broker-adsearch{
        position: absolute;
        width: 100px;
        height: 47px;
        left: 450px;
        top: 300px;
        background: #4C69A2;
        color: white;
    }

    .licensebox{
        box-sizing: border-box;
        position: absolute;
        width: 203px;
        height: 250px;
        left: 24px;
        top: 455px;

        background: #FFFFFF;
        border: 1px solid #B9B9B9;
    }
    .licensebox img, .licensebox1-1 img, .licensebox1-2 img{
        width: 100%;
        height:  100%;
        object-fit: cover;
        margin-top: 25px;
    }

    #license{
        margin-left: -5px;
    }

    .licensebox1-1{
        box-sizing: border-box;
        position: absolute; 
        width: 203px;
        height: 250px;
        left: 75px;
        top: 455px;
        background: #FFFFFF;
        border: 1px solid #B9B9B9;
        margin-left: 165px;
    }

    #license1-1{
        margin-top: -40px;
        margin-left: 220px;
            
    }

    .licensebox1-2{
        box-sizing: border-box;
        position: absolute; 
        width: 203px;
        height: 250px;
        left: 290px;
        top: 455px;
        background: #FFFFFF;
        border: 1px solid #B9B9B9;
        margin-left: 165px;
    }

    #license1-2{
        margin-top: -40px;
        margin-left: 440px;
            
    }

    #id-text{
        width: 150px;
        height: 40px;
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
        width: 100px;
        height: 45px;
        left: 450px;
        top: 765px;
        background-color: #4C69A2;
        color: white;
    }

    #id{
        margin-top: -10px;
    }

    #emailchecknumber{
        position: absolute;
        width: 360px;
        height: 45px;
        top: 830px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

    #ok{
        position: absolute;
        width: 100px;
        height: 47px;
        left: 450px;
        top: 830px;
        background-color: #4C69A2;
        color: white;
    }

    #password{
        position: absolute;
        width: 360px;
        height: 45px;
        top: 920px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

    #confirmPassword{
        position: absolute;
        width: 360px;
        height: 45px;
        top: 1070px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

   

    #name{
        position: absolute;
        width: 360px;
        height: 45px;
        bottom: 195px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

    #phone{
        position: absolute;
        width: 360px;
        height: 45px;
        bottom: 95px;
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
        margin-left: 100px;
        margin-top: 16px;  
    }

    .real-upload, .real-upload1{
        object-fit: cover;
    }

    li{
        list-style-type: none;
    }
</style>
<body>
<jsp:include page="../common/header.jsp" />

	<div class="wrap">
        <div class="content" id="content">
            <div class="login">
                <h2 id="brokerlogin-text">중개사회원정보입력</h2> 
                <p>서비스 이용을 위해 아래내용을 입력해주세요.</p>

                <h4>중개사무소명</h4>             
                <input type="text" id="brokeraddress" name="brokeraddress" placeholder="사무소명을 입력해주세요."><br><br>

                <h4>소재지</h4>
                <input type="text" id="brokeraddress2" placeholder="우편번호"><br>
                <button type="button" id="broker-adsearch" onclick="" >검색</button>
                <input type="text" id="brokeraddress2-1" placeholder="상세주소를 입력해주세요."><br><br><br>

                <h5 id="license">사업자 등록증 등록</h5>
                <input type="file" class="real-upload" accept="image/*" required multiple style="display: none;">
                <div class="licensebox" ></div>
                    
         

                  <!-- <div class="a"></div> -->
                <h5 id="license1-1">중개등록증 등록</h5>
                <input type="file" class="real-upload1" accept="image/*" required multiple style="display: none;">
                    <div class="licensebox1-1"></div>
                


                <h5 id="license1-2">증명사진 등록</h5>
                <input type="file" class="real-upload3" accept="image/*" required multiple style="display: none;">
                <div class="licensebox1-2" ></div>
                    
                
            
                <br><br><br><br><br><br><br><br><br><br><br><br><br>
                
                <h4 id="id">아이디</h4>
                <input type="text" id="id-text" name="userName"required> @ <select id="emailct">
                    <option value="선택안함">선택안함</option>
                    <option value="@naver.com">@naver.com</option>
                    <option value="@gmail.com">@gmail.com</option></select><br><br>
                    <button type="button" id="emailcheck" name="emailcheck" >인증번호 전송</button><br>
                    
                    <input type="text" id="emailchecknumber" placeholder="인증번호를 입력해주세요.">
                    <button type="button" id="ok">확인</button><br>
                    
                <h4>비밀번호</h4>
                <input type="password" id="password"  onkeyup="checkPasswordValidity()" placeholder="비밀번호를 입력해주세요." required><br><br>
                <label style="font-size: 13px; color: gray;">※영문자, 숫자, 특수문자(!@#$%^)로 총 8~15자로 입력하세요.</label><br>
                <span id="passwordError" style="color: red; font-size: 13px;" ></span>
                <span id="passwordMessage" style="color: green; font-size: 13px;"></span><br>
                

                <h4>비밀번호 확인</h4>
                <input type="password" id="confirmPassword"  name="userPwdCheck"onkeyup="checkPasswordMatch()" placeholder="비밀번호 확인을해주세요." required><br><br>
                <span id="confirmMessage" style="color: red; font-size: 14px;"></span><br>

                <h4>이름</h4>
                <input type="text" id="name" name="username" placeholder="이름을 입력해주세요."><br><br>

                <h4>전화번호</h4>
                <input type="text" id="phone" name="phone" placeholder="전화번호를 입력해주세요."><br><br>

                <a href="" ><button type="submit" id="signupbtn">가입하기</button></a>

                
            </div>
            
        </div>

    </div>
</body>

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
    function getImageFiles(e) {
        const uploadFiles = [];
        const files = e.currentTarget.files;
            const licensebox = document.querySelector('.licensebox');
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

            realUpload.addEventListener('change', getImageFiles);
              
        // 중개사회원가입 두번째 사진
        function getImageFiles(e) {
            const uploadFiles = [];
            const files = e.currentTarget.files;
                const licensebox1 = document.querySelector('.licensebox1-1');
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
                    uploadFiles.push(file);
                    const reader = new FileReader();
                    reader.onload = (e) => {
                        const preview = createElement(e, file);
                        licensebox1.appendChild(preview);
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

                realUpload1.addEventListener('change', getImageFiles);
                    
            //중개사 회원가입 세번째사진
            function getImageFiles(e) {
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

                    realUpload3.addEventListener('change', getImageFiles);
              
    
    
      </script>
</html>