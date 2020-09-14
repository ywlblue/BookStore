<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div class="container">
			<div class="card shopping-cart">
				<div class="card-header bg-dark text-light">
					<i class="fa fa-shopping-cart" aria-hidden="true"></i> Shopping
					cart <a href="${pageContext.request.contextPath}/" class="btn btn-outline-info btn-sm pull-right">Continue
						shopping</a>
					<div class="clearfix"></div>
				</div>
				<form method="post" action="update_cart" id="update-form">
				<div class="card-body">
					<!-- PRODUCT -->
					<c:forEach items="${cart.items}" var="item" varStatus="status">
						<div class="row">
							<div class="col-12 col-sm-12 col-md-2 text-center">
								<img class="img-responsive" src="data:image/jpg;base64,${item.key.base64Image}" alt="book-img"
									alt="prewiew" width="120" height="160">
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
										<strong><fmt:formatNumber value="${item.key.price}" type="currency" /><span class="text-muted">x</span></strong>
									</h6>
								</div>
								<div class="col-4 col-sm-4 col-md-4">
									<div class="quantity">
										<input type="hidden" name="bookId" value= "${item.key.bookId}"/>
										<input type="button" value="+" class="plus"> <input
											type="number" step="1" max="99" min="1" value="${item.value}" title="Qty"
											class="qty" size="4" name="quantity${status.index + 1}"> <input type="button" value="-"
											class="minus">
									</div>
								</div>
								<div class="col-2 col-sm-2 col-md-2 text-right">
									<button type="button" class="btn btn-danger btn-xs" id="remove-book" onclick="remove_from_cart(${item.key.bookId})">
										<i class="fa fa-trash" aria-hidden="true"></i>
									</button>
								</div>
							</div>
						</div>
						<hr>
					</c:forEach>
					<div class="pull-right" id ="update-quantity">
						<button class="btn btn-outline-secondary pull-right" type="submit">Update shopping cart</button>
						<div class="pull-right" style="margin: 20px">
							Total Books: <b>${cart.totalQuantity}</b>
						</div>
					</div>
				</div>
				</form>
				<div class="card-footer">
					<div class="row">
					<div class="col-md-4 col-sm-4 no-padding-right pull-right">
					
						<div class="pull-right" style="margin: 5px">
							<a href="clear_cart" class="btn btn-danger">Clear All</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 no-padding-right pull-right">
					
						<div class="pull-right" style="margin: 5px">
							<a href="checkout" class="btn btn-primary">Checkout</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 no-padding-right pull-right">
						<div class="pull-right" style="margin: 5px">
							Total price: <b><fmt:formatNumber value="${cart.totalAmount}" type="currency" /></b>
						</div>
					</div>
					
					
					</div>
				</div>
				
			</div>
		</div>
	</c:if>
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
	function remove_from_cart(bookId) {
		window.location = 'remove_from_cart?book_id=' + bookId;
	}
	</script>
	
	
</body>
</html>