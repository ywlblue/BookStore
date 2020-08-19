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
    <section class="slider">
        <div class="container">
            <div id="owl-demo" class="owl-carousel owl-theme">
                <div class="item">
                    <div class="slide">
                        <img src="images/slide1.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>
                                <h5>Discover the best books online with us</h5>
                                <a href="#" class="btn">shop books</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="slide">
                        <img src="images/slide2.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>
                                <h5>Discover the best books online with us</h5>
                                <a href="#" class="btn">shop books</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="slide">
                        <img src="images/slide3.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>
                                <h5>Discover the best books online with us</h5>
                                <a href="#" class="btn">shop books</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="slide">
                        <img src="images/slide4.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>
                                <h5>Discover the best books online with us</h5>
                                <a href="#" class="btn">shop books</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="category_menu.jsp"></jsp:include>
    
    <section class="recomended-sec">
        <div class="container">
            <div class="title">
                <h2>New Books</h2>
                <hr>
            </div>
            <div class="row">
            	<c:forEach items="${newBooks}" var="book">
            		<div class="col-lg-3 col-md-6">
                    <div class="item">
                        <a href="view_book?id=${book.bookId}"><img src="data:image/jpg;base64,${book.base64Image}" alt="book-img" width="200" height="280"></a>
                        <h3 class="book-title"><a href="view_book?id=${book.bookId}">${book.title}</a></h3>
                        <h6>By ${book.author}</h6>  
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
                        <h6><span class="price">$19</span> / <a href="${pageContext.request.contextPath}/add_to_cart?book_id=${book.bookId}">Add to Cart</a></h6>
                    </div>
                </div>
            	</c:forEach>
            </div>
        </div>
    </section>
    
    <section class="recent-book-sec">
        <div class="container">
            <div class="title">
                <h2>Best Seller</h2>
                <hr>
            </div>
            <div class="row">
            	<c:forEach items="${bestSellingBooks}" var="bestSellingBook">
                <div class="col-lg-2 col-md-3 col-sm-4">
                    <div class="item">
                        <a href="view_book?id=${bestSellingBook.bookId}"><img src="data:image/jpg;base64,${bestSellingBook.base64Image}" alt="book-img" width="200" height="280"></a>
                        <h3 ><a href="view_book?id=${bestSellingBook.bookId}">${bestSellingBook.title}</a></h3>
                        <h6>By ${bestSellingBook.author}</h6>
                        <div>
                        	<c:forTokens items="${bestSellingBook.ratingStars}" delims="," var="star">
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
                        <h6><span class="price">${bestSellingBook.price}</span> / <a href="${pageContext.request.contextPath}/add_to_cart?book_id=${bestSellingBook.bookId}">Add to Cart</a></h6>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    
    <section class="recent-book-sec">
        <div class="container">
            <div class="title">
                <h2>Most Favored</h2>
                <hr>
            </div>
            <div class="row">
            	<c:forEach items="${mostFavoredBooks}" var="mostFavoredBook">
                <div class="col-lg-2 col-md-3 col-sm-4">
                    <div class="item">
                        <a href="view_book?id=${mostFavoredBook.bookId}"><img src="data:image/jpg;base64,${mostFavoredBook.base64Image}" alt="book-img" width="200" height="280"></a>
                        <h3 ><a href="view_book?id=${mostFavoredBook.bookId}">${mostFavoredBook.title}</a></h3>
                        <h6>By ${mostFavoredBook.author}</h6>
                        <div>
                        	<c:forTokens items="${mostFavoredBook.ratingStars}" delims="," var="star">
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
                        <h6><span class="price">${mostFavoredBook.price}</span> / <a href="${pageContext.request.contextPath}/add_to_cart?book_id=${mostFavoredBook.bookId}">Add to Cart</a></h6>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    
    <section class="features-sec">
        <div class="container">
            <ul>
                <li>
                    <span class="icon"><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                    <h3>SAFE SHOPPING</h3>
                    <h5>Safe Shopping Guarantee</h5>
                    <h6>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's...</h6>
                </li>
                <li>
                    <span class="icon return"><i class="fa fa-reply-all" aria-hidden="true"></i></span>
                    <h3>30- DAY RETURN</h3>
                    <h5>Moneyback guarantee</h5>
                    <h6>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's...</h6>
                </li>
                <li>
                    <span class="icon chat"><i class="fa fa-comments" aria-hidden="true"></i></span>
                    <h3>24/7 SUPPORT</h3>
                    <h5>online Consultations</h5>
                    <h6>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's...</h6>
                </li>
            </ul>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/frontend/owl.carousel.min.js"></script>
    <script src="js/frontend/custom.js"></script>
</body>
</html>