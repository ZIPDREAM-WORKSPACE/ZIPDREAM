<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담신청 리스트</title>
<style>
	.counselHeader{
		margin-top : 20px;
		display: flex;
		justify-content: center;
	}
	table{
		width: 72.9%;
		text-align: center;
	}
	.thead{
		height:3rem;
		background-color: #171F45;
		color:white;
	}
	.tbody{
		height:5rem;
	}
	.block{
		height:30rem;
	}
	/*모달창*/
	#modal.modal-overlay {
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    left: 0;
	    top: 0;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    justify-content: center;
	    background: rgba(255, 255, 255, 0.25);
	    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	    backdrop-filter: blur(1.5px);
	    -webkit-backdrop-filter: blur(1.5px);
	    border-radius: 10px;
	    border: 1px solid rgba(255, 255, 255, 0.18);
	}
	#modal .modal-window {
	    /* background: rgba( 69, 139, 197, 0.70 ); */            backdrop-filter: blur( 13.5px );
	    -webkit-backdrop-filter: blur( 13.5px );
	    border-radius: 10px;
	    width: 700px;
	    position: relative;
	    top: -100px;
	    padding: 10px;
	}
	#modal .title {
	    padding-left: 10px;
	    display: inline;
	    text-shadow: 1px 1px 2px gray;
	    color: white;
	    
	}
	#modal .title h2 {
	    display: inline;
	}
	#modal .close-area {
	    display: inline;
	    float: right;
	    padding-right: 10px;
	    cursor: pointer;
	    text-shadow: 1px 1px 2px gray;
	    color: white;
	}
	
	#modal .content {
	    margin-top: 20px;
	    padding: 0px 10px;
	    text-shadow: 1px 1px 2px gray;
	    color: white;
	}
	/*모달 css*/
	.counsel, .last_counsel{
	    border: 1px solid  black;
	    width: 80%;
	    margin: 0 auto;
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    background-color: #abafc5;
	}
	.counsel{
	    height: 28rem;
	    margin-top : 250px;
	}
	.radius{
	    border-radius: 30px;
	}
	.modal_header1{
	    height: 5%;
	}
	.modal_header1>span{
	    font-size: 2rem;
	    font-weight: 900;
	}
	.modal_header2{
	    margin-top: 30px;
	    font-size: 0.8rem;
	    line-height: 10px;
	    height: 10%;
	    text-align: center;
	    border-bottom: 2px solid gray;
	}
	.modal_body{
		line-height: 20px;
		width : 100%;
	    height: 40%;
	  	display: flex;
    	justify-content: center;
    	flex-direction: column;
    	align-items: center;
	}
	.modal_body>p{
		font-size: 1.5rem;
		font-weight: 900;
	}
	
	.modal_footer{
		margin-top: 30px;
	    height: 5%;
	}
	.tbody>tr>td{
		cursor: pointer;
	}
</style>
</head>
<body>

	<jsp:include page="agentPage.jsp"/>
	
	<div class="counselHeader">
		<table border="collapse">
			<thead class="thead">
				<tr>
					<th id="sellNo">매물번호</th>
					<th id="sellType">매물명</th>
					<th id="sellName">신청자 이름</th>
					<th id="date">신청방식</th>
					<th id="count">신청날짜</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr>
					<td>12345678910</td>
					<td>시그니엘</td>
					<td>오현지</td>
					<td>비대면 상담</td>
					<td>2023.05.25</td>
				</tr>
				<tr>
					<td>12345678910</td>
					<td>트리마제</td>
					<td>김예진</td>
					<td>대면상담</td>
					<td>2023.05.18</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div id="modal" class="modal-overlay" style="display: none;">
        <div class="modal-window">
            <div class="counsel radius" >
                <div class="modal_header1">
                    <span>매물상담 수락하기</span>
                </div>
                <div class="modal_header2">
                    <p>공인중개사님이 등록한 매물에 상담을 신청하셨습니다.</p>
                    <p>아래 정보를 확인하시고 상담을 진행하세요.</p>
                </div>
                <hr>
                <div class="modal_body">
                	<p>김예진</p>
                	<p>010-1234-5668</p>
                   <textarea cols="40" rows="5" readonly="readonly" style="resize: none">
                   	날짜는 상관없고 오전에 상담받았으면 좋겠어요
                   </textarea>
                </div>
                <div class="modal_footer">
                    <input type="button" class="close_apply" value="거절하기">
                    <input type="button" class="apply" value="수락하기">
                </div>
            </div>
            <div class="last_counsel radius" style="display:none;">
                <div class="modal_header1">
                    <span>상담 수락 완료</span>
                </div>
                <div class="modal_header2">
                    <p>신청자번호를 확인하고 컨텍을 진행하세요</p>
                </div>
                <hr>
                <div class="modal_body">
                	<p>김예진</p>
                	<p>010-1234-5668</p>
                </div>
                <div class="modal_footer">
                    <input type="button" class="close_apply" value="닫기">
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	$(function(){
		$(".tbody>tr>td").on("click", function(){
			$(".modal-overlay").show();
			$(".counsel").show();
		})
		
		$(".apply").on("click", function(){
			$(".counsel").hide();
			$(".last_counsel").show();
		})
		
		$(".close_apply").on("click", function(){
			$(".modal-overlay").hide();
			$(".last_counsel").hide();
			
		})
	})
</script>
</html>