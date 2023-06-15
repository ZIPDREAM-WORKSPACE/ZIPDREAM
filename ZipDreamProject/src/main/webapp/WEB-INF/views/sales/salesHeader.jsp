<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>



</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<script>
	    $(document).ready(function() {
	        if(location.href.indexOf('<%=request.getContextPath()%>/sales/faq') > -1){ 
	            $('#faq').addClass('current');
	        }
	        if(location.href.indexOf('<%=request.getContextPath()%>/sales/term') > -1) {
				$('#term').addClass('current');
			}
			if (location.href.indexOf('<%=request.getContextPath()%>/sales/guide') > -1){ 
	        	$('#guide').addClass('current');
	        }   
	        
	    });
    </script>


 

</body>
</html>