<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
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
                    <img src="images/register-bg.jpg" alt="" />
                </div>
                <div class="signup-form">
                    <div class="form-title">Registration</div>
                    <form action="${pageContext.request.contextPath}/register_customer" method="post" class="register-form" id="register-form">
                       <div class="form-group">
                       		<label for="full_name">Full Name :</label>
                       		<input type="text" name="full_name" id="full_name" />
                       </div>
                        
						<div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" name="email" id="email" />
                        </div>
                        <div class="form-group">
                            <label for="password">Password :</label>
                            <input type="password" name="password" id="password" required />
                        </div>
                        <div class="form-group">
                            <label for="re-password">Repeat Password :</label>
                            <input type="password" name="re-password" id="re-password" oninput="checkItem(this)"
                                required required/>
                        </div>
                        
                        <div class="form-group">
                            <label for="phone">Phone Number :</label>
                            <input type="text" name="phone" id="phone" required/>
                        </div>
                        <div class="form-group">
                            <label for="address">Address :</label>
                            <input type="text" name="address" id="address" required/>
                        </div>
                        <div class="form-group">
                            <label for="city">City :</label>
                            <input type="text" name="city" id="city" required/>
                        </div>
                        <div class="form-group">
                            <label for="zip_code">Zip Code :</label>
                            <input type="text" name="zip_code" id="zip_code" required/>
                        </div>
                        <div class="form-group">
                            <label for="country">Country :</label>
                            <input type="text" name="country" id="country" required/>
                        </div>
                        <div class="form-submit">
                            <input type="submit" value="Reset All" class="submit" name="reset" id="reset" />
                            <input type="submit" value="Register" class="submit" name="submit" id="submit" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="js/frontend/common.js"></script>
</body>
</html>