<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매물등록 신청 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.requestHeader{
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
	.contectRequest,.finish_apply{
	    border: 1px solid  black;
	    width: 90%;
	    margin: 0 auto;
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    background-color: #abafc5;
	}
	.contectRequest{
	    height: 50rem;
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
	    margin-top: 20px;
	    font-size: 0.8rem;
	    line-height: 10px;
	    height: 10%;
	    text-align: center;
	    border-bottom: 2px solid gray;
	}
	.modal_body{
		width : 100%;
	    height: 60%;
	    display: flex;
    	justify-content: center;
	}
	.modal_footer{
	    margin-top: 50px;
	    height: 5%;
	}
	.tbody>tr>td{
		cursor: pointer;
	}
</style>
</head>
<body>

	<jsp:include page="agentPage.jsp"/>
	
	<div class="requestHeader">
		<table border="collapse" calss="requestTable">
			<thead class="thead">
				<tr>
					<th id="sellType">매물종류</th>
					<th id="bulidType">건물유형</th>
					<th id="sellName">매물명(상가명, 아파트이름)</th>
					<th id="date">거래종류</th>
					<th id="count">신청자 이름</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr>
					<td>아파트</td>
					<td>다가구</td>
					<td>트리마제</td>
					<td>매매</td>
					<td>이유진</td>
				</tr>
				<tr>
					<td>아파트</td>
					<td>다가구</td>
					<td>시그니엘</td>
					<td>매매</td>
					<td>장하은</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	
	
	<div class="block"></div>
	
	<div id="modal" class="modal-overlay" style="display: none;">
        <div class="modal-window">
            <div class="contectRequest radius" ">
                <div class="modal_header1">
                    <span>매물신청 수락하기</span>
                </div>
                <div class="modal_header2">
                    <p>매물등록 요청이 들어왔습니다.</p>
                    <p>아래사항을 확인 후 매물등록을 진행하시거나 요청을 거절하세요.</p>
                </div>
                <hr>
                <div class="modal_body">
                   <table  border="collapse" style="background-color: white;">
                   	<thead>
                   		<tr>
                   			<th>매물종류</th>
                   			<td>아파트</td>
                   		</tr>
                   		<tr>
                   			<th>건물유형</th>
                   			<td>다가구</td>
                   		</tr>
                   		<tr>
                   			<th>위치정보</th>
                   			<td>서울특별시 성동구 성수동........</td>
                   		</tr>
                   		<tr>
                   			<th>거래종류</th>
                   			<td>매매</td>
                   		</tr>
                   		<tr>
                   			<th>신청자정보</th>
                   			<td>오현지 / 010-1234-5678</td>
                   		</tr>
                   	</thead>
                  
                   </table>
                </div>
                <div class="modal_footer">
                    <input type="button" class="close_apply" value="거절하기">
                    <input type="button" class="apply" value="등록하러가기">
                </div>
            </div>
        </div>
    </div>
	
	
	<jsp:include page="../../views/common/footer.jsp" />

</body>
<script type="text/javascript">
	$(function(){
		$(".tbody>tr>td").on("click", function(){
			$(".modal-overlay").show();
		})
		
		$(".close_apply").on("click", function(){
			$(".modal-overlay").hide();
		})
	})
</script>
</html>