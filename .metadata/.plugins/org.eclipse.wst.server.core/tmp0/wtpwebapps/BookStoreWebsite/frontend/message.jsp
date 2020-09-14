<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Place Successfully</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="css/frontend/owl.carousel.min.css">
<link rel="stylesheet" href="css/frontend/styles.css">
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
		<section class="msg" align="center">
			<h2>${msg}</h2>
		</section>
	</c:if>
	
	<jsp:include page="footer.jsp"></jsp:include>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/frontend/owl.carousel.min.js"></script>
    <script src="js/frontend/custom.js"></script>
</body>
</html>