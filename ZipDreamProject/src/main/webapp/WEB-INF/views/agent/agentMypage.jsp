<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>공인중개사 마이페이지</title>
<style>
	div{
		/* border:1px solid red; */
	}
	.block{
		height:5rem;
	}
	.agentMypage{
		border:1px solid black;
		width: 60%;
		height : 1650px;
		margin: 0 auto;
		padding: 30px;
	}
	.high{
		height: 9%;
	}
	.password{
		height:5%;
	}
	.high>p, .p{
		font-size: 2rem;
		font-weight: 700;
	}
	.pic_name,.pictureArea{
		font_size: 1.5rem;
		font-weight: 700;
		display: flex;
	    justify-content: space-around;
    }
    input[type=text]{
    	height:3rem;
    	margin-left: 25px;
    }
    button[name^=change]{
    	width : 150px;
    	height : 3rem;
    	background-color: white;
    	border-radius: 30px;
    	margin-left: 25px;
    }
    .agentfooter{
    	text-align: center;
    }
</style>
</head>
<body>

	<jsp:include page="agentPage.jsp"/>
		<div class="block"></div>
	<div class="agentMypage">
			<div class="name high">
				<p>이름</p>
				<input type="text" name="userId" size="50" value="집집집" readonly="readonly">
			</div>
			<hr>
			<div class="ofice high">
				<p>중개사무소명</p>
				<form action="<%=request.getContextPath()%>/agent/changeName" method="post">
					<input type="text" name="agentName" size="50" value="내돈내산공인중개소">
					<button type="submit" name="changeName" class="changeName">중개사무소명 변경</button>
				</form>
			</div>
			<hr>
			<div class="address">
				<p class="p">소재지</p>
				<input type="text" name="addressNumber" placeholder="우편번호" value="12345" size="5">
				<input type="button" name="findAddress" value="우편번호찾기">
				<br>
				<input type="text" name="datail_address1" placeholder="주소" value="서울특별시 강남구 테헤란로 14길 6" size="80">
				<br>
				<input type="text" name="detail_address2" placeholder="상세주소" value="2F, 3F, 4F" size="36">
				<input type="text" name="detail_address3" placeholder="참고항목" value="남도빌딩" size="36">
			</div>
			<hr>
			<div class="picture">
				<p class="p"> 사진</p>
				<div class="fileArea" style="display:none;">
					<input type="file" name="file1" id="file1" onchange="changeImg(this,1);">
					<input type="file" name="file2" id="file2" onchange="changeImg(this,2);">
				</div>
				<div class="pic_name">
					<span>공인중개사 자격증</span>
					<span>프로필 사진</span>
					<span>중개사무소 등록증</span>
				</div>
				<div class="pictureArea">
					<img width="350" height="450">
					<img id="contentImg1" width="350" height="450">
					<img id="contentImg2" width="350" height="450">
				</div>
			</div>
			<hr>
			<div class="id high">
				<p>아이디</p>
				<input type="text" name="agentId" size="50" value="naezipmarun@naver.com" readonly="readonly">
			</div>
			<hr>
			<div class="password">
				<span class="p">비밀번호</span>
				<button type="button" name="changePwd" class="changePwd">비밀번호 변경</button>
			</div>
			<hr>

			<div class="phone high">
				<p>전화번호</p>
				<form action="<%=request.getContextPath()%>/agent/changePhone" method="post">
					<input type="text" name="agentPhone" size="50" value="010-1234-5678">
					<button type="button" name="changePhone" class="changePhone">전화번호 변경</button>
				</form>
			</div>
	</div>
	
	<div class="block"></div>
	
	<jsp:include page="../../views/common/footer.jsp" />
</body>
<script>
	$(function(){
		$("#contentImg1").click(function(){
			$("#file1").click();
		});
		
		$("#contentImg2").click(function(){
			$("#file2").click();
		});
		
	})
	
	function changeImg(inputFile, num){
		if(inputFile.files.length != 0){
			let reader = new FileReader();
			reader.readAsDataURL(inputFile.files[0]);
			reader.onload = function(e){
				let url = e.target.result;
				
				switch(num){
				case 1 :$("#contentImg1").attr("src", url); break;
				case 2 :$("#contentImg2").attr("src", url); break;
				}
			}
		}
	}
</script>
</html>