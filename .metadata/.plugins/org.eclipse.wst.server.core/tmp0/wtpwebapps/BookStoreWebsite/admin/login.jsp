<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/admin/admin_login.css" rel="stylesheet">
</head>
<body>
	<div class="title">
		<h2 class="text-center">Bookstore Administration</h2>
		</div>
    <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="login-form" action="login" method="post">
                            <h4 class="text-center login-form-heading">Admin Login</h4>
                            <c:if test="${message != null}">
    							<div class="text-center text-danger">${message}</div>
    						</c:if>
                            <div class="form-group">
                                <label for="username">Email:</label><br>
                                <input type="email" name="email" id="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label><br>
                                <input type="password" name="password" id="password" class="form-control" required>
                            </div>
                            <input id="redirect" type="hidden" name="redirect" >
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>  
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="js/bootstrap.min.js"></script>
<!-- <script type="text/javascript">
	$(document).ready(function(){
		$("#loginform").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
				password: "required",
			},
			
			messages: {
				email: {
					required: "Please enter email",
					email: "Please enter an valid email address"
				},
				
				password: "Please enter password"
			}
		})
	})
</script> -->
</body>
</html>