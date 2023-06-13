<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    #id-text, #pwd-text{
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

    #login_search{
            text-align: left;
            border: none;
        }

        #loginbtn{
            width: 330px;
            height: 48px;
            right: 520px;
            background: #326CF9;
            border-radius: 8px;
            align-items: center;
            margin-left: 65px;
            color: white;
        }

        #btn1, #btn2, #btn3{
            border: none;
            background-color: white;
            /* margin-left: -7px; */
        }

        #btn1{
            margin-left: -9px;
            margin-bottom: 8px;
        }
    
        .modal-body{
            text-align: center;
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
          height: 55px;
          bottom: 100px;
          margin-left: 65px;
        }
        #findPasswordInner{
           text-align: left;
           margin-left:30px;
           
        }
        #findPasswordInner>*{
           margin:2px;
           padding:5px;
        }
        #findPasswordInner>.bt{
           margin-bottom:13px;
           
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
          <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;">알림창</h5>
       
        </div>
        <div class="modal-body">
            <a href="<%=request.getContextPath()%>/member/join" role="button" class="sign-up" >일반 회원가입</a>
            <hr>
            <a href="<%=request.getContextPath()%>/member/bkjoin" role="button" class="sign-up2" >공인중개사 회원가입</a>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          
        </div>
      </div>
    </div>
  </div>
  
    <div class="modal fade" id="findPassword" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel" style="text-align:center;">비밀번호 찾기 </h5>
       
        </div>
        <div class="modal-body" id="findPasswordInner" >
           전화번호 : <input  class="signin_pass" id="phoneNumber" type="text" name="phoneNumber"  placeholder="전화번호 입력해주세요">
            <br>
        
            
            아이디 &nbsp;&nbsp;&nbsp;:  <input  class="signin_pass" id="idText" type="text" name="idText"  placeholder="아이디를 입력해주세요">
            <button type="button" class="btn btn-primary" id="emailCheck" >인증번호 전송</button>
            <br>
            
            인증번호 :  <input  class="emailchecknumber" id="emailchecknumber" type="text" name="emailchecknumber"  placeholder="인증번호를 입력해주세요">
            <button type="button" class="btn btn-primary" id="emailsamecheck" >중복확인</button>
            <br>
           
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="findPwd">확인</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          
        </div>
      </div>
    </div>
  </div>
  
   <div class="modal fade" id="searchId" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;">아이디 찾기 </h5>
       
        </div>
        <div class="modal-body" id="findPasswordInner" >
           전화번호 : <input  class="signin_pass" id="phoneNumber" type="text" name="phoneNumber"  placeholder="전화번호 입력해주세요">
           <br>
        
            
            이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:  <input  class="signin_pass" id="name" type="text" name="name"  placeholder="이름을 입력해주세요">
           
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="findId">확인</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          
        </div>
      </div>
    </div>
  </div>
    
    <form action="<%=request.getContextPath()%>/member/memberLogin" method="post">
        <div class="content" id="content">
            <div class="login1">
                <h2 id="login-text">로그인</h2> 
                <p>서비스 이용을 위해 로그인 해주세요.</p>

                <h4>아이디</h4>
                <input type="text" id="id-text" name="userId" placeholder="아이디를 입력해주세요."><br><br>

                <h4>비밀번호</h4>
                <input type="password" id="pwd-text" name="userPwd" placeholder="비밀번호를 입력해주세요"><br><br>

                <input type="checkbox" name="saveId">아이디저장<br></input>

                <div id="login_search">
                    <button type="button" id="btn1" onclick="" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="color: #000000;">회원가입</button> |
                    <button type="button" id="btn2" onclick="" data-toggle="modal" data-target="#searchId">아이디 찾기</button>
                     <button type="button" id="btn3" onclick="" data-toggle="modal" data-target="#findPassword">비밀번호 찾기</button>
                </div><br>
                
                <button type="submit" id="loginbtn">로그인</button><br><br>
                
                <!-- <a href=""><img src="https://ifh.cc/g/zH06zo.png" id="naverlogo"></a><br><br>-->
                <a href=""><img src="https://ifh.cc/g/MAcZ8R.png" id="kakaologo"></a>


            </div>
            
        </div>
   </form>
       
    </div>
<script>
//아이디 찾기
$(function(){
	//아이디 찾기
     $("#findId").click(function(){
    	 let phoneNumber = $("#phoneNumber").val();
    	 let name = $("#name").val();
 		$.ajax({
             url:"<%=request.getContextPath()%>/member/searchId", 
             data: {name,phoneNumber }, // 전송할 ㅔ이터값
             success:function(data){
                 if(data.userId == null){ 
                     alert("가입된 아이디가 없습니다.");
                 }else{                  
                     alert("아이디는 "+data.userId+"입니다.");
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
                     if(data.pwd == null){ 
                         alert("확인되는 비밀번호가 없습니다.");
                     }else{                  
                         alert("비밀번호는 "+data.pwd+"입니다.");
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
           $("#emailCheck").text("인증번호 재전송");

           $.ajax({
              url : "<%= request.getContextPath()%>/member/mailAuth"
               ,data : {mail : memMail}
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
     document.getElementById("emailsamecheck").addEventListener("click", function() {
    	 let inputNumber = $("#emailchecknumber").val();
     
     // 인증번호를 받은 후 이 변수에 해당 인증번호를 할당해야 합니다.

     if (inputNumber === verificationNumber && verificationNumber != "") {
       
       $("#emailsamecheck").attr("readonly",true).css("background-color", "rgb(237, 237, 237)");
       /* $("#emailct").attr('disabled',true); */ 
       alert("인증번호가 일치합니다.");
     } else {
       alert("인증번호가 일치하지 않습니다.");
     } 
       
   }); 
}); 
</script>
</body>
</html>