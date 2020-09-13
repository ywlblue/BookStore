<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: weilanyu
  Date: 9/4/20
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/styles.css">
    <title>Pineapple Bookstore | Administration</title>
</head>
<body>
    <jsp:include page="partials/top-navbar.jsp" />
    <jsp:include page="partials/sidebar.jsp" />

    <div role="main" class="jumbotron bg-light mb-0">
        <jsp:include page="partials/quick-actions.jsp" />
        <div class="container align-self-center table-container table-responsive">
            <div class="table-title">Recent Orders</div>
            <table class="table table-bordered">
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
        <div class="container align-self-center table-container table-responsive">
            <div class="table-title">Recent Reviews</div>
            <table class="table table-bordered">
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
        <div class="container align-self-center">
            <div class="table-title">Statistics</div>
            <table class="table table-bordered align-middle">
                <tbody>
                <tr>
                    <th scope="row">Total Users</th>
                    <td>${totalUsers}</td>
                </tr>
                <tr>
                    <th scope="row">Total Books</th>
                    <td>${totalBooks}</td>
                </tr>
                <tr>
                    <th scope="row">Total Orders</th>
                    <td>${totalOrders}</td>
                </tr>
                <tr>
                    <th scope="row">Total Reviews</th>
                    <td>${totalReviews}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <jsp:include page="partials/footer.jsp" />
    <!-- jquery first, popper, then bootstrap js-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<%--    <script src="../js/essentials.js"></script>--%>
</body>
</html>
