<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
</head>
<body>
<button onclick="location.href='<%= request.getContextPath()%>/home'">asdf</button>
<jsp:include page="WEB-INF/views/common/header.jsp" />


<%-- <jsp:include page="WEB-INF/views/map/mapFirstPage.jsp"/> --%>

<jsp:include page="WEB-INF/views/main/main.jsp" />
	<%-- <jsp:include page="WEB-INF/views/map/mapFirstPage.jsp"/> --%>




</body>
</html>