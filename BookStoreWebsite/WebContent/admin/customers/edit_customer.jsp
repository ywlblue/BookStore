<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<jsp:include page="../partials/top-navbar.jsp" />
<jsp:include page="../partials/sidebar.jsp" />
<div role="main" class="jumbotron bg-light mt-0 mb-0">
    <jsp:include page="../partials/quick-actions.jsp" />
    <div class="form-title">Edit Customer</div>
    <div class="container">
        <div class="row">
            <div class="col offset-2">
                <form id="edit-customer-form" action="update_customer" method="post">
                    <input type="hidden" name="customerId" value="${customer.customerId}"/>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email" value="${customer.email}">
                    </div>
                    <div class="form-group">
                        <label for="firstname">First Name</label>
                        <input type="text" class="form-control" id="firstname" aria-describedby="name" name="first_name" value="${customer.firstname}">
                    </div>
                    <div class="form-group">
                        <label for="lastname">Last Name</label>
                        <input type="text" class="form-control" id="lastname" aria-describedby="name" name="last_name" value="${customer.lastname}">
                    </div>
                    <div class="form-group">
                        <label for="password1">Password</label>
                        <input type="password" class="form-control" id="password1" name="password" value="${customer.password}">
                    </div>
                    <div class="form-group">
                        <label for="password2">Confirm Password</label>
                        <input type="password" class="form-control" id="password2" name="confirm_password" value="${customer.password}" data-rule-equalTo="#password1" >
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${customer.phone}">
                    </div>
                    <div class="form-group">
                        <label for="address_line1">Address Line 1</label>
                        <input type="text" class="form-control" id="address_line1" name="address_line1" value="${customer.addressLine1}">
                    </div>
                    <div class="form-group">
                        <label for="address_line2">Address Line 2</label>
                        <input type="text" class="form-control" id="address_line2" name="address_line2" value="${customer.addressLine2}">
                    </div>
                    <div class="form-group">
                        <label for="city">City</label>
                        <input type="text" class="form-control" id="city" name="city" value="${customer.city}">
                    </div>
                    <div class="form-group">
                        <label for="state">State</label>
                        <input type="text" class="form-control" id="state" name="state" value="${customer.state}">
                    </div>
                    <div class="form-group">
                        <label for="zipcode">Zipcode</label>
                        <input type="text" class="form-control" id="zipcode" name="zip_code" value="${customer.zipcode}">
                    </div>
                    <div class="form-group">
                        <label for="country">Country</label>
                        <select name="country" id="country" class="common-text">
                            <c:forEach var="country" items="${mapCountries}">
                                <option value="${country.value}" <c:if test="${customer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="submit" class="btn btn-primary">Save</button>
                        <button type="reset" class="btn btn-secondary" onClick="history.go(-1)">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


</div>
<jsp:include page="../partials/footer.jsp" />
<!-- jquery first, popper, then bootstrap js-->
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.slim.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/admin/form-validation.js"></script>
</body>
</html>
