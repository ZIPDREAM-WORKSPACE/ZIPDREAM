<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="list" value="${map.list}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록한 매물 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	.registration{
		width : 150px;
    	height : 3rem;
    	background-color: white;
    	border-radius: 30px;
    	margin-left: 25px;
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
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>	
				<c:if test="${!empty list }">
					<c:forEach items="${list}" var="sell">
						
								<tr onclick="movePage(${sell.sellNo})">
									<td class="sno">${sell.sellNo}</td>
									<td>${sell.sellType}</td>
									<td>${sell.sellName}</td>
									<td>${sell.createDate} </td>
									<td>22</td>
								</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	
	<div class="block"></div>
	
	<jsp:include page="../../views/common/footer.jsp" />

</body>
<script>
	function movePage(sno){
		location.href="<%=request.getContextPath()%>/sell/detail/"+sno;
	}
</script>
</html>