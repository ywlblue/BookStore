<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Add User - Jade & Gem Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="../css/admin/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/admin/main.css"/>
    <script defer src="../js/formValidation.js"></script>
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
<div class="container clearfix">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
            	<i class="icon-font"></i><a href="${pageContext.request.contextPath}/admin/">Home</a>
            	<span class="crumb-step">&gt;</span><a class="crumb-name" href="list_customers">Customer Management</a>
            	<span class="crumb-step">&gt;</span><span>New Customer</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
            	<div id="error-msg"></div>
                <form action="create_customer" method="post" id="newForm" name="newForm">
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th><i class="require-red">*</i>Email：</th>
                                <td>
                                    <input class="common-text required" id="email" name="email" size="50" type="email" required>
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>First Name：</th>
                                <td><input class="common-text" name="first_name" size="50" type="text" required></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>Last Name：</th>
                                <td><input class="common-text" name="last_name" size="50" type="text" required></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>Password：</th>
                                <td><input class="pwd" name="password" id="pwd" size="50" type="password" required></input></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>Confirm Password：</th>
                                <td><input class="pwd" name="confirm_password" id="confirm_pwd" size="50" type="password" required></input></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>Phone Number：</th>
                                <td><input class="common-text" name="phone" size="50" type="text" required></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>Address Line 1: </th>
                                <td><input class="common-text" name="addressLine1" size="50" type="text" required></td>
                            </tr>
                            <tr>
                                <th></i>Address Line 2: </th>
                                <td><input class="common-text" name="addressLine2" size="50" type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>City：</th>
                                <td><input class="common-text" name="city" size="50" type="text" required></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>State：</th>
                                <td><input class="common-text" name="state" size="50" type="text" required></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>Zip Code：</th>
                                <td><input class="common-text" name="zip_code" size="50" type="text" required></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>Country: </th>
                                <td>
                                	<select name="country" id="country" class="common-text">
											<c:forEach var="country" items="${mapCountries}">
												<option value="${country.value}">${country.key}</option>
											</c:forEach>
										</select>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="Save" type="submit">
                                    <input class="btn btn6" onClick="history.go(-1)" value="Cancel" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>

    </div>
</div>
</body>
</html>