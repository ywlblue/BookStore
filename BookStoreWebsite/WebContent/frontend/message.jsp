<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<c:if test="${error_msg != null}">
		<section class="error-msg" align="center">
			<div>${error_msg}</div>
			<input class="btn btn-primary" onClick="history.go(-1)" value="Retry" type="button">
		</section>
	</c:if>
	<c:if test="${msg != null}">
		<section class="error-msg" align="center">
			<div>${msg}</div>
			<div><a href="/login">Click Here</a>to Login</div>
		</section>
	</c:if>
	
	<jsp:include page="footer.jsp"></jsp:include>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/frontend/owl.carousel.min.js"></script>
    <script src="js/frontend/custom.js"></script>
</body>
</html>