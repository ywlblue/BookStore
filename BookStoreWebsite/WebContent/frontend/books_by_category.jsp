<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Book Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#03a6f3">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/frontend/owl.carousel.min.css">
    <link rel="stylesheet" href="css/frontend/styles.css">
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="category_menu.jsp"></jsp:include>
    <section class="recent-book-sec">
        <div class="container">
            <div class="title">
                <h2>Books in ${category.name}</h2>
                <hr>
            </div>
            <c:if test="${msg != null}">
  				<h3><i>${msg}</i></h3>
			</c:if>
            <div class="row">
            	<c:forEach items="${listBooks}" var="book">
            		<div class="col-lg-2 col-md-3 col-sm-4">
                    <div class="item">
                        <img src="data:image/jpg;base64,${book.base64Image}" alt="book-img">
                        <h3><a href="view_book?id=${book.bookId}">${book.title}</a></h3>
                        <div>
                        	<c:forTokens items="${book.ratingStars}" delims="," var="star">
                        		<c:if test="${star eq 'on'}">
                        			<span><img src="images/rating_on.png" /></span>
                        		</c:if>
                        		<c:if test="${star eq 'off'}">
                        			<span><img src="images/rating_off.png" /></span>
                        		</c:if>
                        		<c:if test="${star eq 'half'}">
                        			<span><img src="images/rating_half.png" /></span>
                        		</c:if>
                        	</c:forTokens>
                        </div>     
                        <h6><span class="price">${book.price}</span> / <a href="#">Buy Now</a></h6>
                    </div>
                </div>
            	</c:forEach>
            	</div>
            <c:if test="${msg == null}">
  				<div class="btn-sec">
                	<a href="#" class="btn gray-btn">view all books</a>
            	</div>
			</c:if>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>