<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
tbody::-webkit-scrollbar {
    width: 10px;  
 
}
  tbody::-webkit-scrollbar-thumb {
    background: grey;
    border-radius: 10px;
  }
  tbody::-webkit-scrollbar-track {
    background: rgb(237, 238, 248);
  }
	.notice_table{
		margin: auto;
		width:800px;
		height:480px;
		border: 1px solid grey;
		margin-top:50px;
		margin-bottom:50px;
		
	}
	thead{
		 display:block;
		 height:60px;
		 background: rgb(239, 240, 247);
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
	.num{
		width:100px;
	}
	.title{
		width:200px;
	}
	.content{
		width:500px;
	}
	
</style>
<body>
<jsp:include page="notice_header.jsp"/>
	<div class="notice_table">
		<table>
			<thead>
				<tr>
					<th class="num">번호</th>
					<th class="title">제목</th>
					<th class="content">내용</th>
				</tr>
			</thead>
			<tbody >
				<tr>
					<td class="num">1</td>
					<td class="title">첫 가입 이벤트 혜택</td>
					<td class="content">복비 10% 할인 쿠폰 지급되었습니다.</td>
				</tr>
				<tr>
					<td>2</td>
					<td>첫 가입 이벤트 혜택</td>
					<td>복비 10% 할인 쿠폰 지급되었습니다.</td>
				</tr>
				<tr>
					<td>2</td>
					<td>첫 가입 이벤트 혜택</td>
					<td>복비 10% 할인 쿠폰 지급되었습니다.</td>
				</tr>
				<tr>
					<td>2</td>
					<td>첫 가입 이벤트 혜택</td>
					<td>복비 10% 할인 쿠폰 지급되었습니다.</td>
				</tr>
				<tr>
					<td>2</td>
					<td>첫 가입 이벤트 혜택</td>
					<td>복비 10% 할인 쿠폰 지급되었습니다.</td>
				</tr>
				<tr>
					<td>2</td>
					<td>첫 가입 이벤트 혜택</td>
					<td>복비 10% 할인 쿠폰 지급되었습니다.</td>
				</tr>
				<tr>
					<td>2</td>
					<td>첫 가입 이벤트 혜택</td>
					<td>복비 10% 할인 쿠폰 지급되었습니다.</td>
				</tr>
				<tr>
					<td>2</td>
					<td>첫 가입 이벤트 혜택</td>
					<td>복비 10% 할인 쿠폰 지급되었습니다.</td>
				</tr>
					<tr>
					<td>2</td>
					<td>첫 가입 이벤트 혜택</td>
					<td>복비 10% 할인 쿠폰 지급되었습니다.</td>
				</tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>

