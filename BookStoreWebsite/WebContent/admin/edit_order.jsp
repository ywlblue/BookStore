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
								<td>${order.customer.firstname}${order.customer.lastname}</td>
							</tr>
							<tr>
								<th>Order Date</th>
								<td>${order.orderDate}</td>
							</tr>
							<tr>
								<th>First Name</th>
								<td><input class="common-text required" id="firstName"
									name="firstName" value="${order.firstname}" size="50"
									type="text"></td>
							</tr>
							<tr>
								<th>Last Name</th>
								<td><input class="common-text required" id="lastName"
									name="lastName" value="${order.lastname}" size="50" type="text"></td>
							</tr>
							<tr>
								<th>Recipient Phone</th>
								<td><input class="common-text required" id="recipientPhone"
									name="recipientPhone" value="${order.recipientPhone}" size="50"
									type="text"></td>
							</tr>
							<tr>
								<th>Shipping Address Line1</th>
								<td><input class="common-text required" id="addressLine1"
									name="addressLine1" value="${order.addressLine1}" size="50"
									type="text"></td>
							</tr>
							<tr>
								<th>Shipping Address Line2</th>
								<td><input class="common-text required" id="addressLine1"
									name="addressLine2" value="${order.addressLine2}" size="50"
									type="text"></td>
							</tr>
							<tr>
								<th>City</th>
								<td><input class="common-text required" id="city"
									name="recipientCity" value="${order.city}" size="50"
									type="text"></td>
							</tr>
							<tr>
								<th>State</th>
								<td><input class="common-text required" id="state"
									name="recipientState" value="${order.state}" size="50"
									type="text"></td>
							</tr>
							<tr>
								<th>Country</th>
								<td><select name="country" id="country" class="common-text">
										<c:forEach var="country" items="${mapCountries}">
											<option value="${country.value}"
												<c:if test="${order.customer.country eq country.value}">selected</c:if>>${country.key}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th>Zip Code</th>
								<td><input class="common-text required" id="zipcode"
									name="zipcode" value="${order.zipcode}" size="50" type="text"></td>
							</tr>
							<tr>
								<th>Payment Method</th>
								<td><select name="paymentMethod" id="paymentMethod">
										<option value="Cash On Delivery"
											<c:if test="${paymentMethod eq 'Cash On Delivery'}">selected</c:if>>Cash
											On Delivery</option>
										<option value="PayPal"
											<c:if test="${paymentMethod eq 'PayPal'}">selected</c:if>>PayPal</option>
										<option value="Credit Card"
											<c:if test="${paymentMethod eq 'Credit Card'}">selected</c:if>>Credit
											Card</option>
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
								<td colspan="7" align="right">
									<p>
										Subtotal:
										<fmt:formatNumber value="${order.subtotal}" type="currency" />
									</p>
									<p>
										Tax: <input type="text" size="5" name="tax"
											value="${order.tax}" />
									</p>
									<p>
										Shipping Fee: <input type="text" size="5" name="shippingFee"
											value="${order.shippingFee}" />
									</p>
									<p>
										TOTAL:
										<fmt:formatNumber value="${order.total}" type="currency" />
									</p>
								</td>
							</tr>
						</table>
					</div>
					<br> <br>
					<div align="center">
						<button type="submit">Save</button>
						<button>
							<a href="${pageContext.request.contextPath}/admin/list_orders">Cancel</a>
						</button>
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
					firstName: "required",
					lastName: "required",
					recipientPhone: "required",
					addressLine1: "required",
					city: "requires",
					state: "requires",
					country: "requires",
					zipcode: "requires",
					shippingFee: "required",
					tax: "required",
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
						quantity${status.index + 1}: {
							required: true,
							number: true,
							min: 1
						},
					</c:forEach>
					
				},
				messages: {
					firstName: "Please enter the recipient first name",
					lastName: "Please enter the recipient last name",
					recipientPhone: "Please enter the recipient phone",
					addressLine1: "Please enter the shipping address",
					city: "Please enter the city",
					state: "Please enter the state",
					country: "Please enter the country",
					zipcode: "Please enter the zipcode",
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
						quantity${status.index + 1}: {
							required: "Please enter quantity",
							number: "Quality must be a number",
							min: "Quantity must be greater than 0"
						},
					</c:forEach>
						
					shippingFee: {
						required: "Please enter shipping fee",
						number: "Shipping fee must be a number",
						min: "Shipping fee must be greater than 0"
					}
					tax: {
						required: "Please enter tax",
						number: "Tax must be a number",
						min: "Tax must be greater than 0"
					}
				}
			});
		})
	</script>

</body>
</html>