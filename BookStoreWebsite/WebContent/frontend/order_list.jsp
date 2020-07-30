<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Order History</title>
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

	<div class="container order-history-container">
		<c:if test="${fn:length(listOrders) == 0}">
			<div align="center" class="order-history-title">
				<h3>You don't have any orders yet.</h3>
				<button class="btn btn-primary">Go Shopping!</button>
			</div>
		</c:if>
		<c:if test="${fn:length(listOrders) > 0}">
			<div align="center" class="order-history-title">
				<h3>Order History</h3>
			</div>
			<div class="order-history">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Index</th>
							<th scope="col">Order ID</th>
							<th scope="col">Quantity</th>
							<th scope="col">Total Amount</th>
							<th scope="col">Order Date</th>
							<th scope="col">Status</th>					
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listOrders}" var="order" varStatus="status">
						<tr>
							<th scope="row">${status.index + 1}</th>
							<td>${order.orderId}</td>
							<td>${order.bookCopies}</td>
							<td><fmt:formatNumber value="${order.total}" type="currency" /></td>
							<td>${order.orderDate}</td>
							<td>${order.status}</td>
							<td><a href="show_order_detail?id=${order.orderId}">View Details</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>