<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: weilanyu
  Date: 9/13/20
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/styles.css">
    <title>Pineapple Bookstore | Administration</title>
</head>
<body>
<jsp:include page="../partials/top-navbar.jsp"/>
<jsp:include page="../partials/sidebar.jsp"/>
<div role="main" class="jumbotron bg-light mt-0 mb-0">
    <jsp:include page="../partials/quick-actions.jsp"/>
    <div class="form-title">Edit User</div>
    <div class="container">
        <div class="row">
            <div class="col offset-2">
                <form id="order-detail-form" action="update_order" method="post">
                    <input type="hidden" name="customerId" value="${customer.customerId}"/>
                    <div class="form-group">
                        <label for="customer_name">Order By</label>
                        <input type="text" readonly class="form-control-plaintext" id="customer_name"
                               value="${order.customer.firstname} ${order.customer.lastname}">
                    </div>
                    <div class="form-group">
                        <label for="order_date">Order Date</label>
                        <input type="text" readonly class="form-control-plaintext" id="order_date"
                               value="${order.orderDate}">
                    </div>
                    <div class="form-group">
                        <label for="firstname">First Name</label>
                        <input type="text" class="form-control" id="firstname" name="firstName"
                               value="${order.firstname}">
                    </div>
                    <div class="form-group">
                        <label for="lastname">Last Name</label>
                        <input type="text" class="form-control" id="lastname" name="lastName" value="${order.lastname}">
                    </div>
                    <div class="form-group">
                        <label for="phone">Recipient Phone</label>
                        <input type="text" class="form-control" id="phone" ame="recipientPhone"
                               value="${order.recipientPhone}">
                    </div>
                    <div class="form-group">
                        <label for="address_line1">Shipping Address Line 1</label>
                        <input type="text" class="form-control" id="address_line1" name="addressLine1"
                               value="${order.addressLine1}">
                    </div>
                    <div class="form-group">
                        <label for="address_line2">Shipping Address Line 2</label>
                        <input type="text" class="form-control" id="address_line2" name="addressLine2"
                               value="${order.addressLine2}">
                    </div>
                    <div class="form-group">
                        <label for="city">City</label>
                        <input type="text" class="form-control" id="city" name="recipientCity" value="${order.city}">
                    </div>
                    <div class="form-group">
                        <label for="state">State</label>
                        <input type="text" class="form-control" id="state" name="recipientState" value="${order.state}">
                    </div>
                    <div class="form-group">
                        <label for="zipcode">Zipcode</label>
                        <input type="text" class="form-control" id="zipcode" name="zipcode" value="${order.zipcode}">
                    </div>
                    <div class="form-group">
                        <label for="country">Country</label>
                        <select name="country" id="country" class="common-text">
                            <c:forEach var="country" items="${mapCountries}">
                                <option value="${country.value}"
                                        <c:if test="${customer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="paymentMethod">Payment Method</label>
                        <select name="paymentMethod" id="paymentMethod">
                            <option value="Cash On Delivery"
                                    <c:if test="${paymentMethod eq 'Cash On Delivery'}">selected</c:if>>Cash
                                On Delivery
                            </option>
                            <option value="PayPal"
                                    <c:if test="${paymentMethod eq 'PayPal'}">selected</c:if>>PayPal
                            </option>
                            <option value="Credit Card"
                                    <c:if test="${paymentMethod eq 'Credit Card'}">selected</c:if>>Credit
                                Card
                            </option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="orderStatus">Order Status</label>
                        <select name="orderStatus" id="orderStatus">
                            <option value="Processing"
                                    <c:if test="${order.status eq 'Processing'}">
                                        selected='selected'</c:if>>Processing
                            </option>
                            <option value="Shipped"
                                    <c:if test="${order.status eq 'Shipped'}">
                                        selected='selected'</c:if>>Shipped
                            </option>
                            <option value="Delivered"
                                    <c:if test="${order.status eq 'Delivered'}">
                                        selected='selected'</c:if>>Delivered
                            </option>
                            <option value="Completed"
                                    <c:if test="${order.status eq 'Completed'}">
                                        selected='selected'</c:if>>Completed
                            </option>
                        </select>
                    </div>

                    <div class="table-title">Ordered Books</div>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Index</th>
                            <th>Book Title</th>
                            <th>Author</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                            <th><a href="javascript:showAddBookPopup()">Add Book</a></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="orderDetail" items="${order.orderDetails}"
                                   varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${orderDetail.book.title}</td>
                                <td>${orderDetail.book.author}</td>
                                <td><input type="hidden" name="price"
                                           value="${orderDetail.book.price}"/>
                                        ${orderDetail.book.price}</td>
                                <td><input type="hidden" name="bookId"
                                           value="${orderDetail.book.bookId}"/> <input
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
                                    <fmt:formatNumber value="${order.subtotal}" type="currency"/>
                                </p>
                                <p>
                                    Tax: <input type="text" size="5" name="tax"
                                                value="${order.tax}"/>
                                </p>
                                <p>
                                    Shipping Fee: <input type="text" size="5" name="shippingFee"
                                                         value="${order.shippingFee}"/>
                                </p>
                                <p>
                                    TOTAL:
                                    <fmt:formatNumber value="${order.total}" type="currency"/>
                                </p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="submit" class="btn btn-primary">Save</button>
                        <button type="reset" class="btn btn-secondary" onClick="history.go(-1)">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../partials/footer.jsp"/>
<!-- jquery first, popper, then bootstrap js-->
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.slim.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/admin/form-validation.js"></script>
<script>
    function showAddBookPopup() {
        var width = 600;
        var height = 250;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;
        window.open('show_add_form', '_blank', 'width=' + width,
            'height=' + height, 'top=' + top, 'left=' + left);
    }

    $(document).ready(function () {
        $("#order-detail-form").validate({
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
