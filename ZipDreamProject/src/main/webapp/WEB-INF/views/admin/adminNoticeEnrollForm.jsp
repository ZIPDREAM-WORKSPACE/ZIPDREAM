<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
	<section class="content-wrap">
		<form action="<%= request.getContextPath() %>/admin/notice/enroll" method="post">
			<div class="content-title">
				<h1>공지사항 작성</h1>
				<button type="submit" onclick="location.href='<%=request.getContextPath()%>/admin/notice/enrollForm'">등록</button>
			</div>
			<input type="text" class="content-noticeBoardTitle" name="noticeBoardTitle" placeholder="제목을 입력하세요.">
			<textarea id="summernote" name="noticeBoardContent"></textarea>
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