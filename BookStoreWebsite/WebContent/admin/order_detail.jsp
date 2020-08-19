<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>All Users - Jade & Gem Books</title>
	<link rel="stylesheet" type="text/css" href="../css/admin/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/admin/main.css"/>
	<script defer src="../js/general.js"></script>
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	<div class="container clearfix">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font fa fa-house-user"></i><a href="${pageContext.request.contextPath}/admin/">Home</a><span
						class="crumb-step">&gt;</span><span class="crumb-name"><a href="${pageContext.request.contextPath}/admin/list_orders">Order
						Management</a></span></a><span class="crumb-step">&gt;</span><span class="crumb-name">Order Deatil</span>
				</div>
			</div>
			<br>
			<div class="result-wrap">
					<c:if test="${created_msg != null}">
  						<h4><i>${created_msg}</i></h4>
					</c:if>
					
					<div class="result-content" align="center">
						<h1 align="center">Order Overview:</h1>
						<table class="result-tab" width="50%">
							<tr>
								<th>Order By</th>
								<td>${order.customer.firstname} ${order.customer.lastname}</td>
							</tr>
							<tr>
								<th>Book Copies</th>
								<td>${order.bookCopies}</td>
							</tr>
							<tr>
								<th>Total Amount</th>
								<td>&#36;${order.total}</td>
							</tr>
						</table>
						<br>
						<hr>
						<br>
						<h1 align="center">Recipient Information:</h1>
						<table class="result-tab" width="50%">
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
						</table>
					</div>
					<br>
					<br>
					<hr>
					<br>
					<br>
					<div class="result-content" align="center">
						<h1 align="center">Ordered Books:</h1>
						<table class="result-tab" width="80%">
							<tr>
								<th>Index</th>
								<th>Book Title</th>
								<th>Author</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Subtotal</th>
							</tr>
							<c:forEach var="orderDetail" items="${order.orderDetails}" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td>${orderDetail.book.title}</td>
									<td>${orderDetail.book.author}</td>
									<td>${orderDetail.book.price}</td>						
									<td>${orderDetail.quantity}</td>
									<td>${orderDetail.subtotal}</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="6" align="right">
									<p>Tax: <fmt:formatNumber value="${order.tax}" type="currency"/></p>
									<p>Shipping Fee: <fmt:formatNumber value="${order.shippingFee}" type="currency"/></p>
									<p>TOTAL: <fmt:formatNumber value="${order.total}" type="currency"/></p>
								</td>
							</tr>
						</table>
					</div>
				<br>
			<br>
			</div>
			<br>
			<div align="center">
				<a href="edit_order?id=${order.orderId}">Edit</a>
				<a href="${pageContext.request.contextPath}/admin/list_orders">Cancel</a>
				<a href="javascript:confirmDelete(${order.orderId}, 'order')">Delete</a>		
			</div>
			<br>
		</div>
		</div>
		<script src="https://kit.fontawesome.com/c852dd71e5.js" crossorigin="anonymous"></script>
</body>
</html>