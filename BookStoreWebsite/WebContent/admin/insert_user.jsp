<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <div class="crumb-list"><i class="icon-font"></i><a href="/jscss/admin/design/">Home</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="/jscss/admin/design/">User Management</a><span class="crumb-step">&gt;</span><span>New User</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
            	<div id="error-msg"></div>
                <form action="create_user" method="post" id="new_user_form" name="new_user_form">
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th><i class="require-red">*</i>Email：</th>
                                <td>
                                    <input class="common-text required" id="email" name="email" size="50" type="email" required>
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>Full Name：</th>
                                <td><input class="common-text" name="full_name" size="50" type="text" required></td>
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
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="Create" type="submit">
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