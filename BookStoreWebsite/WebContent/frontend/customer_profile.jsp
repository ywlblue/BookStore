<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Customer Profile</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/frontend/owl.carousel.min.css">
    <link rel="stylesheet" href="css/frontend/styles.css">
    <link rel="stylesheet" href="css/frontend/register.css">
    <link rel="stylesheet" href="css/frontend/profile.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="wrapper">
        <!-- sidebar -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <div id="welcome-message">
                	<p>Welcome, ${loggedCustomer.fullname}</p>
                </div>
                <div id="profile-img">
                    <img src="images/default_profile.png" alt="customer-profile">
                </div>
                <div id="order-quantity" name="numOfOrder">
                    <span>Order: </span>&nbsp;<span>0</span>
                </div>
                
            </div>
            <ul class="list-unstyled components">
                <li>
                    <a href="#profile-sec">Profile</a>
                </li>
                <li>
                    <a href="#order-sec">Order</a>
                </li>
            </ul>
        </nav>
        
        <div id="profile-content">
        	 <!-- page content -->
        	<div id="profile-sec" class="tab-content">
        		<div id="view-profile-sec">
        			<a href="${pageContext.request.contextPath}/edit_profile">Edit Profile</a>
        		</div>
        		<div id="edit-profile-sec">
        			<jsp:include page="customer_form.jsp"></jsp:include>
        		</div>
        		
        	</div>
        	<div id="order-sec" class="tab-content">
        		<h2>Order</h2>
        	</div>
        </div>
        </div>
       
    
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/frontend/owl.carousel.min.js"></script>
    <script src="js/frontend/custom.js"></script>
    <script>
    $(document).ready(function () {
        $('#sidebar ul li:first').addClass('active');
        $('.tab-content:not(:first)').hide();
        $('#sidebar ul li a').click(function (event) {
            event.preventDefault();
            var content = $(this).attr('href');
            $(this).parent().addClass('active');
            $(this).parent().siblings().removeClass('active');
            $(content).show();
            $(content).siblings('.tab-content').hide();
        });
        $('#edit-profile-sec').hide();
        $('#view-profile-sec a').click(function(event){
        	event.preventDefault(); 
        	$(this).hide();
        	$(this).parent().siblings().show();
        });
        
        
    });
    </script>
</body>
</html>