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
						<div class="col-md-4 col-sm-4 no-padding-right pull-right">
							<div class="pull-right" style="margin: 5px">
								Total price: <b><fmt:formatNumber
										value="${cart.totalAmount}" type="currency" /></b>
							</div>
						</div>
						<div class="col-md-4 col-sm-4 no-padding-right pull-right">
							<div class="pull-right" style="margin: 5px">
								Total Books: <b>${cart.totalQuantity}</b>
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
				<div class="form-group">
					<label for="recipientName">Recipient Name:</label> <input
						type="text" class="form-control" id="recipientName"
						name="recipientName" value="${loggedCustomer.fullname}">
				</div>
				<div class="form-group">
					<label for="recipientPhone">Recipient Phone:</label> <input
						type="text" class="form-control" id="recipientPhone"
						name="recipientPhone" value="${loggedCustomer.phone}">
				</div>
				<div class="form-group">
					<label for="recipientAddress">Street Address:</label> <input
						type="text" class="form-control" id="recipientAddress"
						name="recipientAddress" value="${loggedCustomer.address}">
				</div>
				<div class="form-group">
					<label for="recipientCity">City:</label> <input type="text"
						class="form-control" id="recipientCity"
						name="recipientCity" value="${loggedCustomer.city}">
				</div>
				<div class="form-group">
					<label for="zipcode">Zip Code:</label> <input type="text"
						class="form-control" id="zipcode"
						name="zipcode" value="${loggedCustomer.zipcode}">
				</div>
				<div class="form-group">
					<label for="recipientCountry">Country:</label> <input type="text"
						class="form-control" id="recipientCountry"
						name="recipientCountry" value="${loggedCustomer.country}">
				</div>
				<div class="shipping-title">
					<h2>Payment:</h2>
				</div>
				<div class="form-group">
					<label for="paymentSelect">Example select</label> <select
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
					recipientName: "required",
					recipientPhone: "required",
					recipientAddress: "required",
					recipientCity: "required",
					zipcode: "required",
					recipientCountry: "required"
				},
				messages: {
					recipientName: "Please enter recipient name",
					recipientPhone: "Please enter recipient phone",
					recipientAddress: "Please enter recipient address",
					recipientCity: "Please enter city",
					zipcode: "Please enter zip code",
					recipientCountry: "Please enter country"
				}
			})
		})
	</script>


</body>
</html>