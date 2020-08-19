<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Order Detail</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="css/frontend/owl.carousel.min.css">
<link rel="stylesheet" href="css/frontend/styles.css">
<script src="https://use.fontawesome.com/c560c025cf.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container order-overview-container">
		<div align="center" class="order-overview-title">
			<h3>Your Order Overview</h3>
		</div>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row">Order By</th>
					<td>${order.customer.firstname}${order.customer.lastname}</td>
				</tr>
				<tr>
					<th scope="row">Book Copies</th>
					<td>${order.bookCopies}</td>
				</tr>
				<tr>
					<th scope="row">Total Amount</th>
					<td>&#36;${order.total}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<hr>
	<div class="container recipient-info-container">
		<div align="center" class="recipient-info-title">
			<h3>Recipient Information</h3>
		</div>
		<table class="table table-bordered">
			<tbody>
				<tr>
								<th>Recipient Name</th>
								<td>${order.firstname} ${order.lastname}</td>
							</tr>
							<tr>
								<th>Recipient Phone</th>
								<td>${order.recipientPhone}</td>
							</tr>
							<tr>
								<th>Address Line1</th>
								<td>${order.addressLine1}</td>
							</tr>
							<c:if test="${order.addressLine2 ne null}">
							<tr>
								<th>Address Line2</th>
								<td>${order.addressLine2}</td>
							</tr>
							</c:if>
							<tr>
								<th>City</th>
								<td>${order.city}</td>
							</tr>
							<tr>
								<th>State</th>
								<td>${order.state}</td>
							</tr>
							<tr>
								<th>Country</th>
								<td>${order.countryName}</td>
							</tr>
							<tr>
								<th>Zip Code</th>
								<td>${order.zipcode}</td>
							</tr>
							<tr>
								<th>Payment Method</th>
								<td>${order.paymentMethod}</td>
							</tr>
							<tr>
								<th>Order Status</th>
								<td>${order.status}</td>
							</tr>
							<tr>
								<th>Order Date</th>
								<td><fmt:formatDate pattern='MM/dd/yyyy' value ='${order.orderDate}'/></td>
							</tr>
			</tbody>
		</table>
	</div>
	
	<hr>

	<div class="container order-detail-container">
		<c:if test="${order == null}">
			<div align="center">
				<h3>Sorry, you are not authorized to view this order.</h3>
			</div>
		</c:if>
		<c:if test="${order != null}">
			<div align="center" class="order-detail-title">
				<h3>Your Order Detail</h3>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">Book</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Quantity</th>
						<th scope="col">Subtotal</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="orderDetail" items="${order.orderDetails}"
						varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>
								<div class="book-container">
									<div class="book-detail-img" style="float: left;">
										<img
											src="data:image/jpg;base64,${orderDetail.book.base64Image}"
											width="84" />
									</div>
									<div class="book-title">${orderDetail.book.title}</div>
								</div>

							</td>
							<td>${orderDetail.book.author}</td>
							<td>${orderDetail.book.price}</td>
							<td>${orderDetail.quantity}</td>
							<td>${orderDetail.subtotal}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4" align="right"><b><i>TOTAL:</i></b></td>
						<td>${order.bookCopies}</td>
						<td>${order.total}</td>
					</tr>
				</tbody>
			</table>
			<div class="after-order-detail-container">
				<a href="${pageContext.request.contextPath}/view_orders"><button
						class="btn btn-info">Back to Order List</button></a>
			</div>
		</c:if>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>