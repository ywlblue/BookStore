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
						class="crumb-step">&gt;</span><span class="crumb-name">Order
						Management</span></a><span class="crumb-step">&gt;</span><span class="crumb-name">Order Deatil</span>
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
								<td>${order.customer.fullname}</td>
							</tr>
							<tr>
								<th>Book Copies</th>
								<td>${order.bookCopies}</td>
							</tr>
							<tr>
								<th>Total Amount</th>
								<td>&#36;${order.total}</td>
							</tr>
							<tr>
								<th>Recipient Name</th>
								<td>${order.recipientName}</td>
							</tr>
							<tr>
								<th>Recipient Phone</th>
								<td>${order.recipientPhone}</td>
							</tr>
							<tr>
								<th>Ship To</th>
								<td>${order.shippingAddress}</td>
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
								<td colspan="4" align="right"><b><i>TOTAL:</i></b></td>
								<td>${order.bookCopies}</td>
								<td>${order.total}</td>
							</tr>
						</table>
					</div>
				<br>
			<br>
			</div>
			<br>
			<div align="center">
				<a class="link-update" href="edit_order?id=${order.orderId}">Edit</a>		
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;								
				<a class="link-del" href="javascript:confirmDelete(${order.orderId}, 'order')">Delete</a>
			</div>
			<br>
		</div>
		</div>
		<script src="https://kit.fontawesome.com/c852dd71e5.js" crossorigin="anonymous"></script>
</body>
</html>