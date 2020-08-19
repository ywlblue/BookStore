<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="css/frontend/owl.carousel.min.css">
<link rel="stylesheet" href="css/frontend/styles.css">
<link rel="stylesheet" href="css/frontend/cart.css">
<script src="https://use.fontawesome.com/c560c025cf.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<c:set var="cart" value="${sessionScope['cart']}" />
	<c:if test="${cart.totalItems == 0}">
		<h2>There's no item in your cart.</h2>
	</c:if>
	<c:if test="${cart.totalItems > 0}">
		<div class="container checkout-container">
			<div class="card shopping-cart">
				<div class="card-header bg-dark text-light">
					<i class="fa fa-shopping-cart" aria-hidden="true"></i> Review Your
					Order Details <a href="${pageContext.request.contextPath}/view_cart"
						class="btn btn-outline-info btn-sm pull-right">Edit</a>
					<div class="clearfix"></div>
				</div>
				<form method="post" action="update_cart" id="update-form">
					<div class="card-body">
						<!-- PRODUCT -->
						<c:forEach items="${cart.items}" var="item" varStatus="status">
							<div class="row">
								<div class="col-12 col-sm-12 col-md-2 text-center">
									<img class="img-responsive"
										src="data:image/jpg;base64,${item.key.base64Image}"
										alt="book-img" alt="prewiew" width="120" height="160">
								</div>
								<div
									class="col-12 text-sm-center col-sm-12 text-md-left col-md-6 text-center">
									<h4 class="product-name">
										<strong>${item.key.title}</strong>
									</h4>
								</div>
								<div
									class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
									<div class="col-3 col-sm-3 col-md-6 text-md-right"
										style="padding-top: 5px">
										<h6>
											<strong><fmt:formatNumber value="${item.key.price}"
													type="currency" /><span class="text-muted">x</span></strong>
										</h6>
									</div>
									<div class="col-4 col-sm-4 col-md-4">
										<div class="quantity">
											<input type="hidden" name="bookId" value="${item.key.bookId}" />
											<input
												type="number" value="${item.value}" title="Qty" class="qty" size="4"
												name="quantity${status.index + 1}" readonly="readonly">
										</div>
									</div>
									<div class="col-2 col-sm-2 col-md-2 text-right">
										<button type="button" class="btn btn-outline-danger btn-xs"
											onclick="remove_from_cart(${item.key.bookId})">
											<i class="fa fa-trash" aria-hidden="true"></i>
										</button>
									</div>
								</div>
							</div>
							<hr>
						</c:forEach>
					</div>
				</form>
				<div class="card-footer">
					<div class="row">
					<div class="col-md-4 col-sm-4 no-padding-right pull-right"></div>
					<div class="col-md-4 col-sm-4 no-padding-right pull-right"></div>
						<div class="col-md-4 col-sm-4 no-padding-right pull-right">
						<div class="pull-right text-right" style="margin: 5px">
							<p>Number of Copies: ${cart.totalQuantity}</p>
							<p>Subtotal: <fmt:formatNumber
											value="${cart.totalAmount}" type="currency" /></p>
							<p>Tax: <fmt:formatNumber
											value="${tax}" type="currency" /></p>
							<p>Shipping Fee: <fmt:formatNumber
											value="${shippingFee}" type="currency" /></p>
							<p>TOTAL:  <fmt:formatNumber
											value="${total}" type="currency" /></p>
						</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</c:if>
	<div class="container shipping-container">
		<div class="shipping-title">
			<h2>Your Shipping Information:</h2>
		</div>
		<div>
			<form action="place_order" method="post" id="order-form">
				<input type="hidden" name="tax" value="${tax}"/>
				<input type="hidden" name="shippingFee" value="${shippingFee}"/>
				<input type="hidden" name="subtotal" value="${cart.totalAmount}"/>
				<div class="form-group">
					<label for="recipientName">Recipient First Name:</label> <input
						type="text" class="form-control" id="recipientFirstName"
						name="recipientFirstName" value="${loggedCustomer.firstname} ">
				</div>
				<div class="form-group">
					<label for="recipientName">Recipient Last Name:</label> <input
						type="text" class="form-control" id="recipientLastName"
						name="recipientLastName" value="${loggedCustomer.lastname} ">
				</div>
				<div class="form-group">
					<label for="recipientPhone">Recipient Phone:</label> <input
						type="text" class="form-control" id="recipientPhone"
						name="recipientPhone" value="${loggedCustomer.phone}">
				</div>
				<div class="form-group">
					<label for="recipientAddress">Address Line1:</label> <input
						type="text" class="form-control" id="addressLine1"
						name="addressLine1" value="${loggedCustomer.addressLine1}">
				</div>
				<div class="form-group">
					<label for="recipientAddress">Address Line2:</label> <input
						type="text" class="form-control" id="addressLine2"
						name="addressLine2" value="${loggedCustomer.addressLine2}">
				</div>
				<div class="form-group">
					<label for="recipientCity">City:</label> <input type="text"
						class="form-control" id="recipientCity"
						name="recipientCity" value="${loggedCustomer.city}">
				</div>
				<div class="form-group">
					<label for="recipientState">State:</label> <input type="text"
						class="form-control" id="recipientState"
						name="recipientState" value="${loggedCustomer.state}">
				</div>
				<div class="form-group">
					<label for="zipcode">Zip Code:</label> <input type="text"
						class="form-control" id="zipcode"
						name="zipcode" value="${loggedCustomer.zipcode}">
				</div>
				<div class="form-group">
					<label for="recipientCountry">Country:</label>
					<select name="recipientCountry" id="recipientCountry" class="form-control">
						<c:forEach var="country" items="${mapCountries}">
							<option value="${country.value}"<c:if test="${loggedCustomer.country eq country.value}">selected</c:if>>${country.key}</option>
						</c:forEach>
					</select>
				</div>
				
				<div class="form-group">
					<label for="paymentSelect">Payment Method</label> <select
						class="form-control" id="paymentSelect"
						name="paymentMethod">
						<option>Cash On Delivery</option>
						<option>Credit Card</option>
						<option>Pay Pal</option>
					</select>
				</div>
				<div class="place-order-sec">
				<button type="submit" class="btn btn-success mb-2" id="place-order-btn">Place Order</button>
				<a href="${pageContext.request.contextPath}/" class="btn btn-info mb-2" id="continue-btn">Continue Shopping</a>
				</div>
			</form>
		</div>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/frontend/owl.carousel.min.js"></script>
	<script src="js/frontend/custom.js"></script>
	<script>
		$(document).ready(function() {
			$("#order-form").validate({
				rules: {
					recipientFirstName: "required",
					recipientLastName: "required",
					recipientPhone: "required",
					addressLine1: "required",
					recipientCity: "required",
					recipientState: "required",
					zipcode: "required"
				},
				messages: {
					recipientFirstName: "Please enter recipient first name",
					recipientLastName: "Please enter recipient last name",
					recipientPhone: "Please enter recipient phone",
					addressLine1: "Please enter recipient address",
					recipientCity: "Please enter city",
					recipientState: "Please enter state",
					zipcode: "Please enter zip code"
				}
			})
		})
	</script>


</body>
</html>