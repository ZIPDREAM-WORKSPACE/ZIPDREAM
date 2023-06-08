<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
	<section class="content-wrap">
		<form action="<%= request.getContextPath() %>/admin/notice/enroll" method="post">
			<div class="content-title">
				<h1>공지사항 보기</h1>
				<div style="width:500px;height:100px;display:flex;">
					<button type="submit">등록</button>
					<button type="button" onclick="location.href='<%=request.getContextPath()%>/admin/notice/delete?boardNo=${noticeBoard.noticeBoardNo}'" style="background-color:red;">삭제</button>
				</div>
			</div>
			번호 : <input type="text" class="content-noticeBoardNo" name="noticeBoardNo" value="${noticeBoard.noticeBoardNo}" readonly/>
			<input type="text" class="content-noticeBoardTitle" name="noticeBoardTitle" placeholder="제목을 입력하세요." value="${noticeBoard.noticeBoardTitle}">
			<textarea id="summernote" name="noticeBoardContent">		
				${noticeBoard.noticeBoardContent}
			</textarea>
		</form>
	</section>
</section>
<script>
	$(document).ready(function() {
		 $('#summernote').summernote({
		        placeholder: '내용을 입력하세요.',
		        tabsize: 2,
		        height: 600
	     });
	});
</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />