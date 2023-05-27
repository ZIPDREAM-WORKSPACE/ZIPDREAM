<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.myInfo_wrap{
		width:600px;
		height:590px;
		border: 1px solid rgb(223, 223, 223);
		margin: auto;
		padding:40px;
		margin-top:50px;
		margin-bottom:50px;
		box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	}
	.myInfo_title{
		font-weight: 600;
		font-size:17px;
	}
	.myInfo_content{
		padding:5px;
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
	.myInfo_button{
		background: rgb(34, 34, 91);
		color:white;
		border: 2px solid rgb(169, 169, 169);
		width:70px;
		text-align: center;
	}
	.read_only{
		background: rgb(239, 239, 239);
		border : 1px solid rgb(223, 223, 223);
	}
	#confirm{
		margin: auto;
		background: rgb(34, 34, 91);
		border : 2px solid rgb(169, 169, 169);
		width: 70px;
		height:40px;
		justify-content: center;
		line-height:36px;
		
	}
	.password_content{
		width:460px;
		padding:5px;
	}
	.address_content{
		width:387px;
		padding:5px;
	}
</style>
<body>
<jsp:include page="mypage.jsp"/>
	<div class="myInfo_wrap">
		<label class="myInfo_title">아이디</label><br>
	    <input class="myInfo_content read_only" type="text"  value="dhguswl00" size="55" readonly><br><br>
	    <label class="myInfo_title" >비밀번호</label><br>
	    <input class="myInfo_content myInfo_button" type="button" value="비밀번호 변경" style="width:508px;" data-toggle="modal" data-target="#password_modal"><br><br>
	    <label class="myInfo_title ">이름</label><br>
	    <input class="myInfo_content read_only" type="text"  value="오현지" size="55" readonly><br><br>
	    <label class="myInfo_title">전화번호</label><br>
	    <input class="myInfo_content" type="text"  value="010-1111-2222" size="46" >
	    <input class="myInfo_content myInfo_button" type="button" value="변경"><br><br>
	    <label class="myInfo_title ">주소</label><br>
	    <input class="myInfo_content" type="text"  value="서울특별시 테헤란로 23-567" size="46" >
	    <input class="myInfo_content myInfo_button" type="button" value="변경" data-toggle="modal" data-target="#address_modal"><br><br>
	    <div class="delete_account"><p id="delete_account">회원탈퇴</p></div>
	</div>
	


<!-- 비밀번호 모달 -->
<div class="modal fade" id="password_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close" style="border:none; background: white; font-size:20px;">
        	<span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<label class="myInfo_title">기존 비밀번호</label><br>
	    <input class="password_content" type="text"  ><br><br>
	    <label class="myInfo_title">비밀번호 재설정</label><br>
	    <input class="password_content" type="text"  ><br><br>
	    <label class="myInfo_title">비밀번호 확인</label><br>
	    <input class="password_content" type="text"  >
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="confirm" >변경</button>
      </div>
    </div>
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
       	<label class="myInfo_title">우편번호</label><br>
	    <input class="address_content" type="text" placeholder="우편번호" v >
       	<input class="myInfo_content myInfo_button" type="button" value="검색"><br>
	    <input class="password_content" type="text" placeholder="상세주소를 입력해주세요." style="margin-top:5px;">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="confirm" >변경</button>
      </div>
    </div>
  </div>
</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
