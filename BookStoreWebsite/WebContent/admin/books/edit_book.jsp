<%--
  Created by IntelliJ IDEA.
  User: weilanyu
  Date: 9/21/20
  Time: 9:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <div class="form-title">Edit Book</div>
    <div class="container">
        <div class="row">
            <div class="col offset-2">
                <form id="edit-book-form" action="update_book" method="post">
                    <input type="hidden" name="bookId" value="${book.bookId}">
                    <div class="form-group">
                        <label for="category">Category</label>
                        <select name="category" id="category">
                        <c:forEach items="${listCategory}" var="category">
                            <c:if test="${category.categoryId eq book.category.categoryId}">
                                <option value="${category.categoryId}" selected>${category.name}</option>
                            </c:if>
                            <c:if test="${category.categoryId ne book.bookId}">
                                <option value="${category.categoryId}">${category.name}</option>
                            </c:if>

                        </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="${book.title}" >
                    </div>
                    <div class="form-group">
                        <label for="author">Author</label>
                        <input type="text" class="form-control" id="author" name="author" value="${book.author}">
                    </div>
                    <div class="form-group">
                        <label for="isbn">ISBN</label>
                        <input type="text" class="form-control" id="isbn" name="isbn" value="${book.isbn}">
                    </div>
                    <div class="form-group">
                        <label for="publish_date">Publish Date</label>
                        <input type="text" class="form-control" id="publish_date" name="publish_date" value="<fmt:formatDate pattern='MM/dd/yyyy' value ='${book.publishDate}'/>">
                    </div>
                    <div class="form-group">
                        <label for="book_image">Publish Date</label>
                        <input type="file" class="form-control" id="book_image" name="book_image" ><img id="thumbnail" src="data:image/jpg;base64,${book.base64Image}" width="84" alt="Image Preview" style="width:20%"/>
                    </div>
                    <div class="form-group">
                        <label for="price">Price</label>
                        <input type="text" class="form-control" id="price" name="price" value="${book.price}" >
                    </div>
                    <div class="form-group">
                        <label for="description"></label>
                        <textarea name="description" class="form-control" id="description" >${book.description}</textarea>
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
<script>
    $(document).ready(function() {
        $(function() {
            $('#publish_date').datepicker();
            $('#description').richText();
            $('#book_img').change(function(){
                showImageThumbnail(this);
            });
        });

    })

    function showImageThumbnail(fileInput) {
        var file = fileInput.files[0];
        var reader = new FileReader();
        reader.onload = function(e){
            $('#thumbnail').attr('src', e.target.result);
        };

        reader.readAsDataURL(file);
    }
</script>
</body>
</html>

