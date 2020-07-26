<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Montserrat:wght@200&family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/frontend/owl.carousel.min.css">
    <link rel="stylesheet" href="css/frontend/styles.css">
    <link rel="stylesheet" href="css/frontend/register.css">
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img src="images/login-bg.jpg" alt="" />
                </div>
                <div class="signup-form">
                    <div class="form-title">Login</div>
                    <form method="post" class="register-form" id="register-form">
                        <div class="form-group">
                                <label for="email">Email :</label>
                                <input type="text" name="email" id="email" onblur="checkItem(this)" required />
                        </div>
                        <div class="form-group">
                            <label for="password">Password :</label>
                            <input type="password" name="password" id="password" required />
                        </div>
                        <div class="form-submit">
                            <input type="submit" value="Go!" class="submit" name="submit" id="submit" />
                        </div>
                        <div>
                        	<a href="#">Forgot password?</a>
                        </div>
                        <hr/>
                    </form>
                    
                    <div class="register-redirect">
                            <a href="${pageContext.request.contextPath}/register"><button class="btn btn-primary">Register a new account</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="js/frontend/common.js"></script>
</body>
</html>