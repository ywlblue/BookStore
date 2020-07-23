<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">Admin</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="index.html">Home</a></li>
                <li><a href="#" target="_blank">Jade & Gem</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="#"><c:out value="${sessionScope.username}" /></a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>
    </div>
</div>