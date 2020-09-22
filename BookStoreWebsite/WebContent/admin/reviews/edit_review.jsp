<%--
  Created by IntelliJ IDEA.
  User: weilanyu
  Date: 9/21/20
  Time: 9:26 PM
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
    <div class="form-title">Edit Review</div>
    <div class="container">
        <div class="row">
            <div class="col offset-2">
                <form id="edit-user-form" action="update_user" method="post">
                    <input type="hidden" name="reviewId" value="${review.reviewId}"/>
                    <div class="form-group">
                        <label for="title">Book Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="${review.book.title}">
                    </div>
                    <div class="form-group">
                        <label for="rating">Rating</label>
                        <input type="text" class="form-control" id="rating" name="rating" value="${review.rating}">
                    </div>
                    <div class="form-group">
                        <label for="headline">Headline</label>
                        <input type="text" class="form-control" id="headline" name="headline" value="${review.headline}">
                    </div>
                    <div class="form-group">
                        <label for="comment">Comment</label>
                        <textarea type="text" class="form-control" id="comment" name="comment" >${review.comment}</textarea>
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

