<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Jade & Gem Admin Panel</title>
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/main.css" />
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	<div class="container clearfix">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font fas fa-bullhorn"></i><span>Welcome to Jade Bookstore's Admin Panel!</span>
				</div>
			</div>
			<div class="result-wrap">
				<div class="result-title">
					<h1>Quick Actions</h1>
				</div>
				<div class="result-content">
					<div class="short-wrap">
						<a href="add_user.jsp"><i class="icon-font fas fa-users-cog"></i>New User</a> 
						<a href="add_category.jsp"><i class="icon-font fas fa-tags"></i>New Category</a> 
						<a href="new_book"><i class="icon-font fas fa-book-open"></i>New Book</a> 
						<a href="new_customer"><i class="icon-font fas fa-users"></i>New Customer</a>
					</div>
				</div>
			</div>
			<div class="result-wrap">
				<div class="result-content" align="center">
					<div class="result-title">
						<h1>Recent Sales:</h1>
					</div>
					<table class="result-tab">
						<thead>
							<tr>
								<th scope="col">Order ID</th>
								<th scope="col">Ordered by</th>
								<th scope="col">Book Copies</th>
								<th scope="col">Total</th>
								<th scope="col">Payment Method</th>
								<th scope="col">Status</th>
								<th scope="col">Order Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${mostRecentOrders}" var="mostRecentOrder" varStatus="status">
							<tr>
								<th scope="row"><a href="view_order?id=${mostRecentOrder.orderId}">${mostRecentOrder.orderId}</a></th>
								<td>${mostRecentOrder.customer.firstname}</td>
								<td>${mostRecentOrder.bookCopies}</td>
								<td>${mostRecentOrder.total}</td>
								<td>${mostRecentOrder.paymentMethod}</td>
								<td>${mostRecentOrder.status}</td>
								<td>${mostRecentOrder.orderDate}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
		<div class="result-wrap">
			<div class="result-content" align="center">
			<div class="result-title">
				<h1>Recent Review: </h1>
			</div>
				<table class="result-tab">
					<thead>
						<tr>
							<th scope="col">Book</th>
							<th scope="col">Rating</th>
							<th scope="col">Headline</th>
							<th scope="col">Customer</th>
							<th scope="col">Review On</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${mostRecentReviews}" var="mostRecentReview" varStatus="status">
						<tr>
							<th scope="row">${mostRecentReview.book.title}</th>
							<td>${mostRecentReview.rating}</td>
							<td><a href="edit_review?id=${mostRecentReview.reviewId}">${mostRecentReview.headline}</a></td>
							<td>${mostRecentReview.customer.firstname}</td>
							<td>${mostRecentReview.reviewTime}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="result-wrap">
			<div class="result-content" align="center">
			<div class="result-title">
				<h1>Statistics: </h1>
			</div>
			<div>
				<span>Total Users: ${totalUsers}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>Total Books: ${totalBooks}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>Total Orders: ${totalOrders}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>Total Reviews: ${totalReviews}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
	</div>
	</div>
</body>
</html>