<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<style>
tbody::-webkit-scrollbar {
    width: 10px;  
 
}
  tbody::-webkit-scrollbar-thumb {
    background: grey;
    border-radius: 10px;
  }
	.notice_table{
		margin: auto;
		width:1000px;
		height:480px;
		border: 1px solid grey;
		margin-top:50px;
		margin-bottom:50px;
		
	}
	thead{
		 display:block;
		 height:60px;
		 background: rgb(242, 242, 242);
	}
	tbody{
	display:block;
    overflow:auto;
    height:420px;
   
   border-top: 2px solid grey;
    border-bottom: 1px solid grey;
    
	}
	table{
    	table-layout: fixed;
    border-collapse: collapse;
	}
	  th {
    border-bottom: 1px solid grey;
    border-right: 1px solid grey;
  }
  th:last-child{
  	border:none;
  }
  tr{
  	height:60px;
  	 border-bottom: 1px solid grey;
  }
  
	.notice_table *{
		
		text-align: center;
	}
	.title{
		width:400px;
	}
	.content{
		width:400px;
	}
	.time{
		width:200px;
	}
	.link{
		cursor:pointer;
	}

	
</style>
<body>
<jsp:include page="notice_header.jsp"/>
	<div class="notice_table">
		<table>
			<thead >
				<tr>
					<th class="title">제목</th>
					<th class="content">내용</th>
					<th class="time">날짜</th>
				</tr>
			</thead>
			<tbody class="noticeThead">
				<!-- <tr>
					<td class="num">1</td>
					<td class="title">역삼 디오빌 분양 정보</td>
					<td class="content">찜한 매물의 분양 정보가 도착하였습니다. 확인 부탁드립니다.</td>
				</tr> -->
		
			</tbody>
		</table>
	</div>
	<jsp:include page="../common/footer.jsp"/>

<script src="<%=request.getContextPath()%>/resources/js/chat/noticeChat.js"></script>
<script>

	let houseSock = new SockJS("<%=request.getContextPath()%>/notice"); 
	addEventMessage();
	


</script>
</body>

