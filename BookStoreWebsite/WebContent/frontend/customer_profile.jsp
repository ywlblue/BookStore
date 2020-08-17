<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Profile</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="css/frontend/owl.carousel.min.css">
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
			<div id="profile-sec" class="tab-content">
				<div id="edit-profile-sec">
					<div class="signup-form">
						<div class="form-title">Customer Profile</div>
						<form action="${pageContext.request.contextPath}/edit_profile"
							method="post" class="register-form" id="register-form">
							<div class="form-group">
								<label for="first_name">First Name :</label> <input type="text"
									name="first_name" value="${customer.firstname}" id="first_name" />
							</div>
							<div class="form-group">
								<label for="last_name">Last Name :</label> <input type="text"
									name="last_name" value="${customer.lastname}" id="last_name" />
							</div>

							<div class="form-group">
								<label for="email">Email:</label> <input type="email"
									name="email" value="${customer.email}" id="email" readonly/><i>Cannot
									be changed</i>
							</div>
							<div class="form-group">
								<label for="phone">Phone Number :</label> <input type="text"
									name="phone" value="${customer.phone}" id="phone" />
							</div>
							<div class="form-group">
								<label for="addressLine1">Address Line1:</label> <input
									type="text" name="addressLine1"
									value="${customer.addressLine1}" id="addressLine1" />
							</div>
							<div class="form-group">
								<label for="addressLine2">Address Line2:</label> <input
									type="text" name="addressLine2"
									value="${customer.addressLine2}" id="addressLine2" />
							</div>
							<div class="form-group">
								<label for="city">City :</label> <input type="text" name="city"
									value="${customer.city}" id="city" required />
							</div>
							<div class="form-group">
								<label for="state">State :</label> <input type="text"
									name="state" value="${customer.state}" id="state" required />
							</div>
							<div class="form-group">
								<label for="zip_code">Zip Code :</label> <input type="text"
									name="zip_code" value="${customer.zipcode}" id="zip_code" />
							</div>
							<div class="form-group">
								<label for="country">Country :</label> <input type="text"
									name="country" value="${customer.countryName}" id="country" />
							</div>
							<div class="form-submit">
								<input type="submit" value="Edit Profile" class="submit"
									name="submit" id="submit" />
							</div>
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
	<script>
		$(document).ready(function() {
			$('#first_name').attr('readonly', true);
			$('#last_name').attr('readonly', true);
			$('#email').attr('readonly', true);
			$('#phone').attr('readonly', true);
			$('#addressLine1').attr('readonly', true);
			$('#addressLine2').attr('readonly', true);
			$('#city').attr('readonly', true);
			$('#state').attr('readonly', true);
			$('#zip_code').attr('readonly', true);
			$('#country').attr('readonly', true);
		});
	</script>

</body>
</html>