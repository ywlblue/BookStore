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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/styles.css">
    <title>Pineapple Bookstore | Administration</title>
</head>
<body>
<jsp:include page="../partials/top-navbar.jsp" />
<jsp:include page="../partials/sidebar.jsp" />
<div role="main" class="jumbotron bg-light mt-0 mb-0">
    <jsp:include page="../partials/quick-actions.jsp" />
    <div class="table-title">All Categories</div>
    <div class="container align-self-center table-responsive">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">Index</th>
                <th scope="col">ID</th>
                <th scope="col">Category Name</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cat" items="${listCategory}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${cat.categoryId}</td>
                    <td>${cat.name}</td>
                    <td>
                        <a class="link-update" href="edit_category?id=${cat.categoryId}">Edit</a>
                        <a class="link-del" href="javascript:confirmDelete(${cat.categoryId}, 'category')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <nav aria-label="..." class="container align-self-center">
        <ul class="pagination">
            <li class="page-item disabled">
                <span class="page-link">Previous</span>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item active">
                <span class="page-link">2<span class="sr-only">(current)</span></span>
            </li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>
</div>
<jsp:include page="../partials/footer.jsp" />
<!-- jquery first, popper, then bootstrap js-->
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.slim.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/essentials.js"></script>
</body>
</html>
