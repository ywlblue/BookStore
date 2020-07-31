<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Order - Jade & Gem Books</title>
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/main.css" />
<script defer src="../js/general.js"></script>
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	<div class="container clearfix">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font fa fa-house-user"></i><a
						href="${pageContext.request.contextPath}/admin/">Home</a><span
						class="crumb-step">&gt;</span><span class="crumb-name"> <a
						href="${pageContext.request.contextPath}/admin/list_orders">Order
							Management</a></span> <span class="crumb-step">&gt;</span><span
						class="crumb-name">Edit Order</span>
				</div>
			</div>
			<br>
			<div class="result-wrap">
				<c:if test="${message != null}">
					<h4>
						<i>${message}</i>
					</h4>
				</c:if>

				<form action="update_order" method="post" id="order-detail-form">
					<div class="result-content" align="center">
						<h1 align="center">Order Overview:</h1>
						<table class="result-tab">
							<tr>
								<th>Order By</th>
								<td>${order.customer.fullname}</td>
							</tr>
							<tr>
								<th>Order Date</th>
								<td>${order.orderDate}'</td>
							</tr>
							<tr>
								<th>Recipient Name</th>
								<td><input class="common-text required" id="recipientName"
									name="recipientName" value="${order.recipientName}" size="50"
									type="text"></td>
							</tr>
							<tr>
								<th>Recipient Phone</th>
								<td><input class="common-text required" id="recipientPhone"
									name="recipientPhone" value="${order.recipientPhone}" size="50"
									type="text"></td>
							</tr>
							<tr>
								<th>Ship To</th>
								<td><input class="common-text required"
									id="shippingAddress" name="shippingAddress"
									value="${order.shippingAddress}" size="50" type="text">
								</td>
							</tr>
							<tr>
								<th>Payment Method</th>
								<td><select name="paymentMethod" id="paymentMethod">
										<option value="Cash On Delivery">Cash On Delivery</option>
										<option value="PayPal">PayPal</option>
										<option value="Credit Card">Credit Card</option>
								</select></td>
							</tr>
							<tr>
								<th>Order Status</th>
								<td><select name="orderStatus" id="orderStatus">
										<option value="Processing"
											<c:if test="${order.status eq 'Processing'}">
												selected='selected'</c:if>>Processing</option>
										<option value="Shipped"
											<c:if test="${order.status eq 'Shipped'}">
												selected='selected'</c:if>>Shipped</option>
										<option value="Delivered"
											<c:if test="${order.status eq 'Delivered'}">
												selected='selected'</c:if>>Delivered</option>
										<option value="Completed"
											<c:if test="${order.status eq 'Completed'}">
												selected='selected'</c:if>>Completed</option>
								</select></td>
							</tr>
						</table>
					</div>
					<br> <br>
					<hr>
					<br> <br>
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
								<th><a href="javascript:showAddBookPopup()">Add Book</a></th>
							</tr>
							<c:forEach var="orderDetail" items="${order.orderDetails}"
								varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td>${orderDetail.book.title}</td>
									<td>${orderDetail.book.author}</td>
									<td><input type="hidden" name="price"
										value="${orderDetail.book.price}" />
										${orderDetail.book.price}</td>
									<td><input type="hidden" name="bookId"
										value="${orderDetail.book.bookId}" /> <input
										class="common-text required" id="quantity"
										name="quantity${status.index+1}"
										value="${orderDetail.quantity}" type="text"></td>
									<td>${orderDetail.subtotal}</td>
									<td><a
										href="remove_book_from_order?id=${orderDetail.book.bookId}">Remove</a></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="4" align="right"><b><i>TOTAL:</i></b></td>
								<td>${order.bookCopies}</td>
								<td>${order.total}</td>
								<td></td>
							</tr>
						</table>
					</div>
					<br> <br> 
					<div class="result-content" align="center">
						<button type="submit">Save</button>
						<button onClick="history.go(-1)">Cancel</button>
					</div>
			</form>
			<br> <br>
		</div>
	</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery.validate.min.js"></script>
	<script>
		function showAddBookPopup() {
			var width = 600;
			var height = 250;
			var left = (screen.width - width) / 2;
			var top = (screen.height - height) / 2;
			window.open('show_add_form', '_blank', 'width=' + width, 
					'height=' + height, 'top=' + top, 'left=' + left);
		}
		
		$(document).ready(function() {
			$("#order-detatil-form").validate({
				rules: {
					recipientName: "required",
					recipientPhone: "required",
					shippingAddress: "required",
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
						quantity${status.index + 1}: {
							required: true,
							number: true,
							min: 1
						},
					</c:forEach>
					
				},
				messages: {
					recipientName: "Please enter the recipient name",
					recipientPhone: "Please enter the recipient phone",
					shippingAddress: "Please enter the shipping address",
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
						quantity${status.index + 1}: {
							required: "Please enter quantity",
							number: "Quality must be a number",
							min: "Quantity must be greater than 0"
						},
					</c:forEach>
				}
			});
		})
	</script>

</body>
</html>