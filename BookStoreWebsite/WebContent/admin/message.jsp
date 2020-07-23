<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Add User - Jade & Gem Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="../css/admin/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/admin/main.css"/>
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
<div class="container clearfix">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="/admin/index.jsp">Home</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="/jscss/admin/design/">User Management</a><span class="crumb-step">&gt;</span><span>New User</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
            	<h3>${error_msg}</h3>
            </div>
            <input class="btn btn6" onClick="history.go(-1)" value="Retry" type="button">
        </div>

    </div>
</div>
</body>
</html>