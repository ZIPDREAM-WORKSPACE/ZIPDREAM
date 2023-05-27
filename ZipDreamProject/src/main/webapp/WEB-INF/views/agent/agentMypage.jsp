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
    button[name^=change], .findcode{
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
				<form action="<%=request.getContextPath()%>/agent/changeAddress" method="post">
					<input type="text" name="addressNumber" id="addressNumber" placeholder="우편번호"  size="5" value="12345">
					<input type="button" name="findAddress" class="findcode" value="우편번호찾기" onclick="findCode();">
					<br>
					<input type="text" name="datail_address1" id="detail_address1" placeholder="주소" size="80" value="서울특별시 강남구 테헤란로 14길 6">
					<br>
					<input type="text" name="detail_address2" id="detail_address2" placeholder="상세주소" size="36" value="내집마련공인중개소">
					<input type="text" name="detail_address3" id="detail_address3" placeholder="참고항목" size="36" value="남도빌딩">
					<button type="submit" name="changeAddress" class="changeAddress">소재지 변경</button>
				</form>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	function findCode(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("detail_address3").value = extraAddr;
                
                } else {
                    document.getElementById("detail_address3").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addressNumber').value = data.zonecode;
                document.getElementById("detail_address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detail_address2").value="";
                document.getElementById("detail_address2").focus();
                
            }
        }).open();
    }
</script>
</html>