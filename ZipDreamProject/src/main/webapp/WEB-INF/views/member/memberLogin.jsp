<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 

<style>
    div{
        box-sizing: border-box;
        border : 0px solid black;
        
    }
    .wrap{
        width:1500px;
        height:1000px;
        margin : auto;
        
    }
  
    .wrap>div {
        width: 100%; 
          
    }
    
    #header{
        height:20%;
        position: relative; 
    }
   
    #content{
        height:80%;
        position: relative;
        
         
    }

    .login1{
        box-sizing: border-box;
      /* top:100px; */
        position: absolute;
        width: 600px;
        height: 600px;
        right: 440px;
        margin-top: 100px;
        background: #FFFFFF;
        border: 0.5px solid #A0A0A0;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        padding-left: 4.5%;
    }
   
    #login-text{
        font-size: 43px;
        display: flex;
        align-items: center;
        text-align: center;
        color: #326CF9;
        margin-left: -5px;
        margin-top:20px;
 
    }

    #id-text, #pwd-text{
        width: 450px;
        height: 50px;
        left: 5px;
       

    }

    #id-check{
        box-sizing: border-box;
        width: 24px;
        height: 24px;
        background: #FFFFFF;
        border: 0.5px solid #000000;
    }

    #login_search{
            text-align: left;
            border: none;
            margin-top:10px;
        }

        #loginbtn{
            width: 330px;
            height: 48px;
            right: 520px;
          
            align-items: center;
            margin-left: 65px;
            
        }

        #btn1, #btn2, #btn3{
            border: none;
            background-color: white;
            /* margin-left: -7px; */
        }

        #btn1{
            margin-left: -9px;
        }
    
        .modal-body{
            text-align: center;
        }
        .modal-body>a{
           color:grey;
        }
         .modal-body>a:hover{
         color:black;
            
            text-decoration: none;
        }
        #exampleModal{
           margin-top: 250px;
        }
        
        /* #naverlogo{
            width: 150px;
            bottom: 100px;
            margin-left: 65px;
        } */
        
        #kakaologo{
           width: 330px;
          height: 48px;
          bottom: 100px;
          margin-left: 65px;
        }
        #findPasswordInner{
           text-align: left;
           margin-left:30px;
           position:relative;
           
        }
        #findPasswordInner>*{
           margin:2px;
           padding:5px;
        }
        #findPasswordInner>.bt{
           margin-bottom:13px;
           
        }
   		h2,h4{
   			font-weight: 600 !important;
   		}
   		.textTitle{
   			font-weight:500;
   			font-size:20px;
   		}
   		#emailCheck{
   			position:absolute;
   			left:74%;
   			top:51%;
   			width:75px;
   		}
   		#emailsamecheck{
   			position:absolute;
   			left:74%;
   			top:80%;
   				width:75px;
   		}
   		
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="wrap">   
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;">회원가입</h5>
       
        </div>
        <div class="modal-body">
            <a href="<%=request.getContextPath()%>/member/join" role="button" class="sign-up" >일반 회원가입</a>
            <hr>
            <a href="<%=request.getContextPath()%>/member/bkjoin" role="button" class="sign-up2" >공인중개사 회원가입</a>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          
        </div>
      </div>
    </div>
  </div>
  
    <div class="modal fade" id="findPassword" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel" style="text-align:center;">비밀번호 찾기 </h5>
       
        </div>
        <div class="modal-body" id="findPasswordInner" >
          <p class="textTitle"> 전화번호</p><input  class="signin_pass form-control" id="phoneNumber" type="text" name="phoneNumber"  placeholder="전화번호 입력해주세요" style="width:400px;">
            
        
            
            <p class="textTitle">아이디</p><input  class="signin_pass form-control" id="idText" type="text" name="idText"  placeholder="아이디를 입력해주세요" style="width:320px;">
            <button type="button" class="btn btn-outline-secondary" id="emailCheck" >인증번호</button>
            
            <p class="textTitle">인증번호</p><input  class="emailchecknumber form-control" id="emailchecknumber" type="text" name="emailchecknumber"  placeholder="인증번호를 입력해주세요" style="width:320px;">
            <button type="button" class="btn btn-outline-secondary" id="emailsamecheck" >중복확인</button>
           
           
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" id="findPwd">확인</button>
          <button type="button" class="btn btn-outline-warning" data-dismiss="modal">취소</button>
          
        </div>
      </div>
    </div>
  </div>
  
   <div class="modal fade" id="searchId" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered" >
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;">아이디 찾기 </h5>
       
        </div>
        <div class="modal-body" id="findPasswordInner" >
           <p class="textTitle">전화번호</p><input  class="signin_pass form-control" id="phone" type="text" name="phone"  placeholder="전화번호 입력해주세요" style="width:400px;">
           <br>
        
            
            <p class="textTitle">이름</p><input  class="signin_pass form-control" id="name" type="text" name="name"  placeholder="이름을 입력해주세요" style="width:400px;">
           
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" id="findId">확인</button>
          <button type="button" class="btn btn-outline-warning" data-dismiss="modal">취소</button>
          
        </div>
      </div>
    </div>
  </div>
    
    <form action="<%=request.getContextPath()%>/member/memberLogin" method="post">
        <div class="content" id="content">
            <div class="login1">
                <h2 id="login-text">로그인</h2> 
                <p style="font-size:14px; color:grey;">서비스 이용을 위해 로그인 해주세요.</p>

                <h4>아이디</h4>
                <input type="text" class="form-control" id="id-text" name="userId" placeholder="아이디를 입력해주세요."><br>

                <h4>비밀번호</h4>
                <input type="password" class="form-control" id="pwd-text" name="userPwd" placeholder="비밀번호를 입력해주세요"><br>

                <input type="checkbox" name="saveId">&nbsp;&nbsp;아이디저장<br></input>

                <div id="login_search">
                    <button type="button" id="btn1" onclick="" data-toggle="modal" data-target="#exampleModal" style="color: #000000;">회원가입</button> |
                    <button type="button" id="btn2" onclick="" data-toggle="modal" data-target="#searchId">아이디 찾기</button>
                     <button type="button" id="btn3" onclick="" data-toggle="modal" data-target="#findPassword">비밀번호 찾기</button>
                </div><br>
                

                

                <button type="submit" id="loginbtn" class="btn btn-primary">로그인</button><br><br>

                
                <!-- <a href=""><img src="https://ifh.cc/g/zH06zo.png" id="naverlogo"></a><br><br>-->

                <a href="javascript:void(0)" onclick="kakaoLogin();"><img src="https://ifh.cc/g/yQkCA0.png" id="kakaologo"></a>



            </div>
            
        </div>
   </form>
       
    </div>
<script>

//아이디 찾기
$(function(){
	//아이디 찾기
     $("#findId").click(function(){
    	 let phone = $("#phone").val();
    	 let name = $("#name").val();
 		$.ajax({
             url:"<%=request.getContextPath()%>/member/searchId", 
             data: {name,phone }, // 전송할 ㅔ이터값
             success:function(data){
            	 console.log(data);
                 if(data.userId == null){ 
                     swal("","가입된 아이디가 없습니다.","warning");
                 }else{                  
                     swal("","아이디는 "+data.userId+"입니다.","information");
                 }
             }
             
         });
        
     });
     
     //비밀번호 찾기
         $("#findPwd").click(function(){
        	 let phone = $("#phoneNumber").val();
        	 let idText = $("#idText").val();
     		$.ajax({
                 url:"<%=request.getContextPath()%>/member/searchPwd", 
                 data: {idText, phone }, 
                 success:function(data){
                     if(data < 1){ 
                    	 swal("","비밀번호 찾기에 실패했습니다.","warning");
                     }else{
                    	 swal("","비밀번호를 이메일로 전송했습니다.","success");
	                     $("#findPassword").modal("hide");
                     }
                 }
                 
             });
            
         });
     
     
     
     var verificationNumber = ""; // 인증번호를 저장하는 변수
     //mail인증하기 버튼 클릭 
        $("#emailCheck").on("click",function(){
           isMailAuthed=true;
           let memMail = $("#idText").val();
         	console.log(memMail);
           $("#emailCheck").text("재전송");

           $.ajax({
              url : "<%= request.getContextPath()%>/member/mailAuth"
               ,data : {mail : memMail}
              ,method : "get"
             ,dataType : "TEXT"    
             ,async:false
               ,success: function(data){
            	   swal("","인증번호를 전송하였습니다.","success");
                  verificationNumber = data;
               },error : function(req,status,err){
                   console.log(req);
               }
           });//ajax
       });//mailCheck 
     
     
     //인증번호 유효성 검사
     document.getElementById("emailsamecheck").addEventListener("click", function() {
    	 let inputNumber = $("#emailchecknumber").val();
     
     // 인증번호를 받은 후 이 변수에 해당 인증번호를 할당해야 합니다.

     if (inputNumber === verificationNumber && verificationNumber != "") {
       
       $("#emailsamecheck").attr("readonly",true).css("background-color", "rgb(237, 237, 237)");
       /* $("#emailct").attr('disabled',true); */ 
       swal("","인증번호가 일치합니다.","success");
       
     } else {
       swal("","인증번호가 일치하지 않습니다.","error");
     } 
       
   }); 
}); 

//체크박스 상태 변경 감지
var checkbox = document.getElementsByName("saveId")[0];
checkbox.addEventListener('change', function() {
    var id = document.getElementById("id-text").value;
    
    // 체크가 되어있으면 로컬 스토리지에 아이디 저장
    if (checkbox.checked) {
        localStorage.setItem("savedId", id);
    } else {
        localStorage.removeItem("savedId");
    }
});

// 페이지 로드 시 저장된 아이디 불러오기
window.addEventListener('load', function() {
    var savedId = localStorage.getItem("savedId");
    
    // 저장된 아이디가 있을 경우 입력 필드에 표시
    if (savedId) {
        document.getElementById("id-text").value = savedId;
        document.getElementsByName("saveId")[0].checked = true;
    }
});

document.getElementById("emailsamecheck").addEventListener("click", function() {
	 let inputNumber = $("#emailchecknumber").val();

// 인증번호를 받은 후 이 변수에 해당 인증번호를 할당해야 합니다.

if (inputNumber === verificationNumber && verificationNumber != "") {
  
  $("#emailsamecheck").attr("readonly",true).css("background-color", "rgb(237, 237, 237)");
  /* $("#emailct").attr('disabled',true); */ 
  swal("","인증번호가 일치합니다.","success");
} else {
	 swal("","인증번호가 일치하지 않습니다.","error");
} 
  
}); 
}); 

</script>


 <script>
            Kakao.init('597148a4792f11606a885d22718bb101'); //발급받은 키 중 javascript키를 사용해준다.
            console.log(Kakao.isInitialized()); // sdk초기화여부판단
            
            //카카오로그인
            function kakaoLogin() {
             /* Kakao.Auth.login( */
                Kakao.Auth.loginForm({
                success: function (response) {
                    Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                       let accessToken = Kakao.Auth.getAccessToken();
                       Kakao.Auth.setAccessToken(accessToken);
                       console.log(accessToken);
                       console.log(response);
                       console.log(response.id);
                       console.log(response.properties.nickname);
                       console.log(response.kakao_account.email);
                        let snsEmail = response.kakao_account.email;
                        let snsId = response.id;
                        let snsName = response.properties.nickname;
                        let snsType = 1;
                        
                       $.ajax({
                           url : "<%= request.getContextPath()%>/member/snslogin",
                           data : { userId : snsEmail, userPwd : snsId, userName : snsName, userLevel: snsType},
                           method : 'post',
                           success: function(data){
                        	   /* alertMsg("카카오로 정상 로그인되었습니다."); */
                        	    
                        	  setTimeout(()=> location.href="<%= request.getContextPath()%>/", 500);
                           },
                           error: function(){
                              error("카카오 로그인 실패");
                           }
                        });
                        
                    },
                    fail: function (error) {
                        console.log(error)
                    },
                    })
                },
                fail: function (error) {
                    console.log(error)
                }
                });
            } 
        </script>

