<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
        <div class="header-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-3"><a href="${pageContext.request.contextPath}/" class="web-url">www.bookstore.com</a></div>
                    <div class="col-md-6">
                        <h5>Free Shipping Over $99 + 3 Free Samples With Every Order</h5></div>
                    <div class="col-md-3">
                        <span class="ph-number">Call : 800 1234 5678</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-menu">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="images/logo-backup.png" alt="logo"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="navbar-item active">
                                <a href="${pageContext.request.contextPath}/" class="nav-link">Home</a>
                            </li>
                            <li class="navbar-item">
                                <a href="shop.html" class="nav-link">Shop</a>
                            </li>
                            <li class="navbar-item">
                                <a href="about.html" class="nav-link">About</a>
                            </li>
                            <c:if test="${loggedCustomer != null}">
                            <li class="navbar-item dropdown ">
                            	<div>Welcome, <a href="#" class="dropdown">${loggedCustomer.fullname}</a></div>
                            		<div class="dropdown-content">
									    <a href="${pageContext.request.contextPath}/view_profile">Profile</a>
									    <a href="${pageContext.request.contextPath}/view_orders">Order</a>
									    <a href="${pageContext.request.contextPath}/logout">Sign Out</a>
									  </div>
							</li>
                            </c:if>
                            <c:if test="${loggedCustomer == null}">
                            	<li class="navbar-item dropdown ">
                                	<a href="${pageContext.request.contextPath}/login" class="nav-link">Login</a>
                                </li>
                            </c:if>
                            
                        </ul>
                        <div class="cart my-2 my-lg-0">
                            <a href="${pageContext.request.contextPath}/view_cart"><span>
                                <i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                            <span class="quntity">3</span></a>
                        </div>
                        <form action="search" class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" name="keyword" type="text" placeholder="Search here..." aria-label="Search">
                            <button class="search-btn" type="submit"><span class="fa fa-search"></span></button>
                            
                        </form>
                    </div>
                </nav>
            </div>
        </div>
    </header>