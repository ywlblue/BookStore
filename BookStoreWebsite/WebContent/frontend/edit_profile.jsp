<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Customer Profile</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/frontend/owl.carousel.min.css">
    <link rel="stylesheet" href="css/frontend/styles.css">
    <link rel="stylesheet" href="css/frontend/register.css">
    <link rel="stylesheet" href="css/frontend/profile.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="wrapper">
        <!-- sidebar -->
        <div id="profile-content">
        	 <!-- page content -->
        	<div id="profile-sec">
        		<div id="edit-profile-sec">
        			<div class="signup-form">
						<div class="form-title">Customer Profile</div>
						<form action="${pageContext.request.contextPath}/update_profile"
								method="post" class="register-form" id="register-form">
        						<jsp:include page="customer_form.jsp"></jsp:include>
        				</form>
        			</div>
        		</div>
        	</div>
        </div>
        </div>
       
    
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/frontend/owl.carousel.min.js"></script>
    <script src="js/frontend/custom.js"></script>
</body>
</html>