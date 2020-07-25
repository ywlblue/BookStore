<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Book Store</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="theme-color" content="#03a6f3">
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
	<jsp:include page="category_menu.jsp"></jsp:include>
	<section class="product-sec">
		<div class="container">
			<h1>${book.title}</h1>
			<h3>
				<i>By ${book.author}</i>
			</h3>
			<br>
			<div class="row">
				<div class="col-md-5">
					<img src="data:image/jpg;base64,${book.base64Image}" alt="book-img">
				</div>
				<div class="col-md-5 slider-content">
					<div class="book-desciption">
						<p>${teaser}
							<c:if test="${more != ''}">
								<span id="dots">...</span>
								<span id="more">${more}</span>
							</c:if>
						
						<c:if test="${more != ''}">
							<span><a href="" id="toggle">Read More</a></span>
						</c:if>
						</p>
					</div>
					<ul>
						<li><span class="name">Rating</span><span class="clm">:</span>
							<span class="rating">*****</span></li>
						<li><span class="name">Price</span><span class="clm">:</span>
							<span class="price final">$${book.price}</span></li>
					</ul>
					<div class="btn-sec">
						<button class="btn ">Add To cart</button>
						<button class="btn black">Buy Now</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="customer-review">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h2>Customer Reviews</h2>
				</div>
				<div class="col-md-3">
					<button class="btn black">Write a Review</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/frontend/owl.carousel.min.js"></script>
	<script src="js/frontend/custom.js"></script>
	<script>
		$(document).ready(function() {
			$("#toggle").click(function(e) {
				e.preventDefault();
				var elem = $("#toggle").text();
				if (elem == "Read More") {
					//Stuff to do when btn is in the read more state
					$("#toggle").text("Read Less");
					$("#dots").text(" ");
					$("#more").slideDown();
				} else {
					//Stuff to do when btn is in the read less state
					$("#toggle").text("Read More");
					$("#dots").text("...");
					$("#more").slideUp();
				}
			});
		});
	</script>
</body>

</html>