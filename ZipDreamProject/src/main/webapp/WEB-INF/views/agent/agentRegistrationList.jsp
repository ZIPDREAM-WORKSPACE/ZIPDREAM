<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록한 매물 리스트</title>
<style>
	.head_button{
		margin-top : 50px;
		width:86.5%;
		display: flex;
    	justify-content: flex-end;
	}
	.agentListHeader{
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
</style>
</head>
<body>

	<jsp:include page="agentPage.jsp"/>
	
	<div class="head_button">
		<button type="button" class="registration"><a href="<%=request.getContextPath()%>/sell/insert">매물등록하기</a></button>
	</div>
	
	<div class="agentListHeader">
		<table border="collapse">
			<thead class="thead">
				<tr>
					<th id="sellNo">매물번호</th>
					<th id="sellType">매물타입</th>
					<th id="sellName">매물이름(상가명, 아파트명)</th>
					<th id="date">작성날짜</th>
					<th id="count">찜 횟수</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr>
					<td>12345678910</td>
					<td>아파트</td>
					<td>시그니엘</td>
					<td>2023.05.18</td>
					<td>22</td>
				</tr>
				<tr>
					<td>12345678910</td>
					<td>아파트</td>
					<td>시그니엘</td>
					<td>2023.05.18</td>
					<td>22</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="block"></div>
	
	<jsp:include page="../../views/common/footer.jsp" />

</body>
</html>