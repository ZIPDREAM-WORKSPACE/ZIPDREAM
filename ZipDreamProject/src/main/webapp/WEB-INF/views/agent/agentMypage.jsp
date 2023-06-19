<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.myInfo_wrap{
		width:700px;
		height:930px;
		border: 1px solid rgb(223, 223, 223);
		margin: auto;
		padding:60px 80px 60px 60px;
		margin-top:50px;
		margin-bottom:50px;
		box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
		position: relative;
	}
	.myInfo_title{
		font-weight: 600;
		font-size:17px;
	}

	.myInfo_button{
		position: absolute;
		left:80.5%;
		bottom:9.1%;
	}
	.delete_account{
		widht:70%; 
		text-align:right; 
		margin-top:15px;  
		margin-right:10px;
	}
	#delete_account{
		padding:0;
		cursor: pointer;
		font-weight: 500;
	}
	#delete_account:hover{
		color:rgb(70, 78, 217);
	}

	.read_only{
		background: rgb(239, 239, 239);
		border : 1px solid rgb(223, 223, 223);
	}


	.address_content{
		width:387px;
		padding:5px;
	}
	
	#signchangebtn{
        width: 100px;
	    margin-left: 400px;
	      margin-top: -20px;
    }
    
    #signdeletebtn{
        margin-top: -37.5px;
	    width: 100px;
	    margin-left: 510px;  
    }
    
    .licensebox{
        box-sizing: border-box;
	    position: absolute;
	    width: 203px;
	    height: 250px;
	    left: -30px;
	    background: #FFFFFF;
	    border: 1px solid #B9B9B9;
	    overflow:hidden;
	    
	    
    }
    .licensebox img, .licensebox1-1 img, .licensebox1-2 img{
        width: 100%;
        height: 100%;
        object-fit: cover;
        margin-top: 25px;
        overflow: hidden;
       
    }

    #license{
     margin-top: 33px;
        font-size: large;
    }

    .licensebox1-1{
        box-sizing: border-box;
	    position: absolute;
	    width: 203px;
	    height: 250px;
	    left: 190px;
	    background: #FFFFFF;
	    border: 1px solid #B9B9B9;
	      overflow:hidden;
    }

    #license1-1{
        margin-top: -30px;
    	margin-left: 230px;
    	font-size: large;
            
    }

    .licensebox1-2{
        box-sizing: border-box;
	    position: absolute;
	    width: 203px;
	    height: 250px;
	    left: 410px;
	    background: #FFFFFF;
	    border: 1px solid #B9B9B9;	
	      overflow:hidden;
    }

    #license1-2{
        margin-top: -30px;
    	margin-left: 460px;
    	font-size: large;
            
    }
    
    .myInfo_wrap1{
 		margin-left: 30px;
    	margin-top: -20px;   
    }
    
    .info{
        margin-left: 40px;
    }
    
    .real-upload, .real-upload1{
        object-fit: cover;
    }

    li{
        list-style-type: none;
       
    }
    
    .licensebox img, .licensebox1-1 img, .licensebox1-2 img{
        width: 100%;
        height:  100%;
        object-fit: cover;
        margin-top: 0px;
        
    }
    .licensewrap{
    	width:100%;
    	position: absolute;
    	
    }
.signchangebtn {
	width: 100px;
	height: 48px;
	background: white;
	border-radius: 8px;
}
.closedelete{
	width: 60px;
	height: 48px;
	background: white;
	border-radius: 8px;
}
    
</style>
<body>
<jsp:include page="agentPage.jsp"/>
	 <form action="<%= request.getContextPath() %>/member/updatebkMember" method="post" enctype="multipart/form-data">
	<div class="myInfo_wrap">
		<div class="myInfo_wrap1">
		<label class="myInfo_title">아이디</label><br>
	    <input class="read_only form-control" type="text" name="userId" value="${m.userId}" size="55" readonly><br>
	    <label class="myInfo_title" >비밀번호</label><br>
	    <button class="form-control btn btn-dark" type="button"  name="password"  data-toggle="modal" data-target="#password_modal">비밀번호 변경</button><br><br>
	   	</div>
	    <h5 id="license">사업자 등록증 등록</h5>
               
                <div class="licensewrap">
	                <input type="file" class="real-upload images" accept="images/*"   style="display: none;" name="images" >
	                <div class="licensebox" ><li><img src="<%= request.getContextPath()%>/${images[0].filePath}/${images[0].changeName}"></li></div>
	                    
	                
	               <!--  <div class="licensewrap2"> -->
	                <h5 id="license1-1">중개사자격증 등록</h5>
	                <input type="file" class="real-upload1 images" accept="images/*"   style="display: none;" name="images">
	                <div class="licensebox1-1"><li><img src="<%= request.getContextPath()%>/${images[1].filePath}/${images[1].changeName}"></li></div>
	                <!-- </div> -->
	                
	               <!--  <div class="licensewrap3"> -->
	                <h5 id="license1-2">증명사진 등록</h5>
	                <input type="file" class="real-upload3 images" accept="images/*"   style="display: none;" name="images">
	                <div class="licensebox1-2" ><li><img src="<%= request.getContextPath()%>/${images[2].filePath}/${images[2].changeName}"></li></div>
                </div>
	    <br><br><br><br><br><br><br><br><br><br><br><br>   
	    <div class="info">
	    <input type="hidden" value="${m.userNo}" name="userNo">
	    <label class="myInfo_title ">이름</label><br>
	    <input class="form-control" type="text"  id="userName" name="userName" value="${m.userName}"><br>
	    <label class="myInfo_title">전화번호</label><br>
	    <input class="form-control" type="text" id="phone" name="phone" value="${m.phone}"  ><br>
	    <label class="myInfo_title ">주소</label><br>
	    <input class="form-control" type="text"  value="${m.address}" id="addr" name="address" style="width:450px" readonly>
	    <button class="btn btn-dark myInfo_button" type="button" data-toggle="modal" data-target="#address_modal">변경</button><br><br>
	    </div>
		<button type="submit" id="signchangebtn" class="btn  btn-outline-primary">변경하기</button>  
	    <button type="button" id="signdeletebtn" class="btn  btn-outline-danger">회원탈퇴</button>
	</div>
	</form>
	


<!-- 비밀번호 모달 -->
<div class="modal fade" id="password_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form action="<%= request.getContextPath() %>/member/changePw" method="post">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title " id="exampleModalLabel">비밀번호 변경</h5>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close" style="border:none; background: white; font-size:20px;">
        	<span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<label class="myInfo_title">기존 비밀번호</label><br>
	    <input class="form-control" type="password"  name="currentPw" id="currentPw"><br>
	    
	    <label class="myInfo_title">비밀번호 재설정</label><br>
	    <input class="form-control" type="password"  id="password"  name="newPw" onkeyup="checkPasswordValidity()" style="margin-bottom:5px;">
	    <span id="passwordError" style="color: red; font-size: 13px;" ></span>
        <span id="passwordMessage" style="color: green; font-size: 13px;"></span><br>
        
	    <label class="myInfo_title">비밀번호 확인</label><br>
	    <input class="form-control" type="password" id="confirmPassword" name="newPwdConfirm" onkeyup="checkPasswordMatch()"  style="margin-bottom:5px;">
	    <span id="confirmMessage" style="color: red; font-size: 13px;"></span><br>
      </div>
      
      <div class="modal-footer">
        <button type="submit" class="btn btn-outline-dark" id="confirm" >변경</button>
      </div>
    </div>
    </form>
  </div>
</div>


<!-- 주소 모달 -->
<div class="modal fade" id="address_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">주소 변경</h5>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close" style="border:none; background: white; font-size:20px;">
        	<span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<div class="form-group">                   
            <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="address" id="addr1" type="text" readonly="readonly" >
                <button type="button" class="btn btn-outline-dark"  id="adsearch" onclick="execPostCode();" style="margin-bottom : 5px;"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
            </div>
            <div class="form-group">
                <input class="form-control"  placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
            </div>
            <div class="form-group">
                <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-dark" id="addConfirm" name="updateButton" data-dismiss="modal" aria-label="Close"  >변경</button>
      </div>
    </div>
  </div>
</div>

<!-- 탈퇴 모달 -->
 <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="reportInsertModalLabel" aria-hidden="true">
	 <div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">회원탈퇴</h5>
				<button type="button" class="btn-close" onclick="$('#deleteModal').modal('hide');"
					aria-label="Close"
					style="border: none; background: white; font-size: 20px;">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" align="center">
				<h3>비밀번호 입력</h3>
				<input type="password" size="60" name="userPwd" class="deleteContent"  placeholder="현재 비밀번호를 입력해주세요.">
			</div>
			<div class="modal-footer">
				<button type="button" class="signchangebtn">탈퇴하기</button>
				<button type="button" class="closedelete"
	                      onclick="$('#deleteModal').modal('hide');">닫기</button>
    				</div>
		</div>
	</div>
</div>   
	
	<jsp:include page="../common/footer.jsp"/>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
//주소
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
           document.getElementById('addr2').value = fullRoadAddr;
       }
    }).open();
}
//비밀번호 유효성 검사
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
    
  //중개사  첫번쨰 사진
    function getImageFiles1(e) {
       const uploadFiles = [];
       const files = e.currentTarget.files;
           const licensebox = document.querySelector('.licensebox');
           const docFrag = new DocumentFragment();

           if ([...files].length >= 4) {
               swal("","이미지는 최대 3개까지 업로드가 가능합니다.","warning");
               return;
           }

           // 파일 타입 검사
           [...files].forEach(file => {
               if (!file.type.match("image/.*")) {
               swal("","이미지 파일만 업로드가 가능합니다.","warning");
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

             
        // 중개사 두번째 사진
         function getImageFiles2(e) {
           const uploadFiles = [];
           const files = e.currentTarget.files;
               const licensebox1 = document.querySelector('.licensebox1-1');
               const docFrag = new DocumentFragment();

               if ([...files].length >= 4) {
            	   swal("","이미지는 최대 3개까지 업로드가 가능합니다.","warning");
                   return;
               }

               // 파일 타입 검사
               [...files].forEach(file => {
                   if (!file.type.match("image/.*")) {
                   swal("","이미지 파일만 업로드가 가능합니다.","warning");
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
                   
           //중개사 세번째사진
            function getImageFiles3(e) {
               const uploadFiles = [];
               const files = e.currentTarget.files;
                   const licensebox2 = document.querySelector('.licensebox1-2');
                   const docFrag = new DocumentFragment();

                   if ([...files].length >= 4) {
                	   swal("","이미지는 최대 3개 까지 업로드가 가능합니다.","warning");
                       return;
                   }

                   // 파일 타입 검사
                   [...files].forEach(file => {
                       if (!file.type.match("image/.*")) {
                    	   swal("","이미지 파일만 업로드가 가능합니다.","warning");
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
                   
                   
                   $("#addConfirm").click(function(){
                  	 let add1 = document.getElementById('addr1').value;
                  	let add2 = document.getElementById('addr2').value;
                  	let add3 = document.getElementById('addr3').value;
                  	let address = add1 + add2 + add3;
                  	document.getElementById('addr').value = address;
                  	console.log(document.getElementById('addr').value);
                  	$('#addr').attr("value",address);
                  	console.log($('#addr').val());
                  });
                              
                   $(function(){
                		
                	  <%--  $("#signchangebtn").click(function(){
                	   	 let phone = $("#phone").val();
                	   	 let images = $(".images").val();
               	   	 	 console.log(images);
                	   	 let userNo = ${loginUser.userNo};
                		   	let add1 = document.getElementById('addr1').value;
                			let add2 = document.getElementById('addr2').value;
                			let add3 = document.getElementById('addr3').value;
                			
                		  
                			let address = add1 + add2 + add3;
                	   	 let userName = $("#userName").val();
                			$.ajax({
                	            url:"<%=request.getContextPath()%>/member/updatebkMember", 
                	            method:"post",
                	            dataType : "TEXT",
                	            data: {phone, address, userName, userNo, images}, 
                	            success:function(data){
                	                if(data == null){ 
                	                    alert("정보수정 실패.");
                	                }else{                  
                	                    alert("정보수정 성공");
                	                }
                	            },error : function(err){
                	            	console.log(err)
                	            }
                	            
                	        });
                	       
                	    });   --%>
                   });
  
  $(function(){
	  $("#signdeletebtn").click(function(){
		  $("#deleteModal").modal("show");
	  })
  })
  $(function(){
	$(".signchangebtn").click(function(){
		let userPwd2 = $(".deleteContent").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/member/deleteMember",
			type : "post",
			data : {userPwd2 },
			success : function(result){
				if(result ==1){
					console.log("탈퇴성공");
					$.ajax({
						url : "<%=request.getContextPath()%>/member/sessionOut",
						success : function(data){
							console.log("성공");
							swal({
								title : "탈퇴완료",
								text : "그동안 이용해주셔서 감사합니다.",
								icon : "success",
								closeOnclickOutside : false
							}).then(function(){
								  location.href="<%=request.getContextPath()%>";
							})
						},
						error : function(){
							console.log("에러");
						}
						
					})
					
				}else{
					console.log("탈퇴실패");
					swal("탈퇴 실패", "비밀번호가 일치하지 않습니다. 다시입력해주세요.", "error");
					$("#deleteModal").modal("hide");
				}
			},
			error : function(){
				console.log("컨트롤러 못감씨앙");
			}
		})
	})
})


                	 
</script>
