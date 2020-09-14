<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Result</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="css/frontend/owl.carousel.min.css">
<link rel="stylesheet" href="css/frontend/styles.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>


	<section class="recent-book-sec">
		<div class="container">
			<c:if test="${fn:length(results) == 0}">
				<div class="title">
					<h2>No results for ${keyword}</h2>
				</div>
				<a href="${pageContext.request.contextPath}/"><button class="btn btn-primary">Go Browsing!</button></a>
			</c:if>
			<c:if test="${fn:length(results) > 0}">
				<div class="title">
					<h2>Result for ${keyword}</h2>
					<hr>
				</div>
				<c:forEach items="${results}" var="result">
					<div class="row">
						<div class="col-lg-2 col-md-3 col-sm-6">
							<div class="item">
								<a href="view_book?id=${result.bookId}"><img
									src="data:image/jpg;base64,${result.base64Image}"
									alt="book-img"></a>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-3">
							<div class="item result-title">
								<h3>
									<a href="view_book?id=${result.bookId}">${result.title}</a>
								</h3>
								<h4>By ${result.author}</h4>
								<div>
									<c:forTokens items="${result.ratingStars}" delims="," var="star">
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
								<h6>${fn:substring(result.description, 0, 200)}...</h6>

							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-3">
							<div class="price final">
								<h2>$${result.price}</h2>
							</div>
							<div class="btn-sec">
								<div id="jsVariables" data-someText="${result.bookId}"></div>
								<button class="btn" onclick="add_to_cart(${result.bookId})">Add To cart</button>
								<button class="btn black">Buy Now</button>
							</div>
						</div>

					</div>
				</c:forEach>
			</c:if>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/frontend/owl.carousel.min.js"></script>
	<script src="js/frontend/custom.js"></script>
	<script>
		function add_to_cart(bookId) {
			window.location = 'add_to_cart?book_id=' + bookId;
		}
	</script>
</body>
</html>