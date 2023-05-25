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
		top:100px;
        position: absolute;
        width: 600px;
        height: 600px;
        right: 440px;
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

        #btn1, #btn2{
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
        
        #naverlogo{
            width: 150px;
            bottom: 100px;
            margin-left: 65px;
        }
        
        #kakaologo{
        	width: 150px;
        	height:57px;
            bottom: 100px;
            margin-left: 30px;
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
            <a href="<%=request.getContextPath()%>/member/brokerjoin" role="button" class="sign-up2" >공인중개사 회원가입</a>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          
        </div>
      </div>
    </div>
  </div>
    
        <div class="content" id="content">
            <div class="login1">
                <h2 id="login-text">로그인</h2> 
                <p>서비스 이용을 위해 로그인 해주세요.</p>

                <h4>아이디</h4>
                <input type="text" id="id-text" name="userId" placeholder="아이디를 입력해주세요."><br><br>

                <h4>비밀번호</h4>
                <input type="password" id="pwd-text" name="userPwd" placeholder="비밀번호를 입력해주세요"><br><br>

                <input type="checkbox">아이디저장<br></input>

                <div id="login_search">
                    <button type="button" id="btn1" onclick="" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="color: #000000;">회원가입</button> |
                    <button type="button" id="btn2" onclick="">아이디, 비밀번호 찾기</button>
                </div><br>
                
                <a href="" ><button type="submit" id="loginbtn">로그인</button></a><br><br>
                
                <a href=""><img src="https://ifh.cc/g/zH06zo.png" id="naverlogo"></a><br><br>
                <a href=""><img src="https://ifh.cc/g/MAcZ8R.png" id="kakaologo"></a>


                


            </div>
            
        </div>

       
    </div>

</body>
</html>