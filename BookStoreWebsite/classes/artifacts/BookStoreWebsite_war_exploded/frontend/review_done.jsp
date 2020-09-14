<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Write</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Montserrat:wght@200&family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/frontend/owl.carousel.min.css">
    <link rel="stylesheet" href="css/frontend/styles.css">
    <link rel="stylesheet" href="css/frontend/register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="main">
        <div class="container">
         <div class="review-form-title">Your Reviews ${loggedCustomer.fullname}</div>
         <hr />
            <div class="signup-content">
                <div class="review-book-info ">
                	<div class="book-title">${book.title}</div>
            	<div class="book-author">by ${book.author}</div>
                    <img src="data:image/jpg;base64,${book.base64Image}" alt="book-img">
                </div>
                <div class="write-review-form">
                    <div class="review-rating"></div>
                    <c:if test="${error_msg != null}">
                    	<div><i>${error_msg}</i></div>
                    </c:if>
                    
                    	<input type="hidden" name="rating" id="rating" />
                    	<input type="hidden" name="bookId" value="${book.bookId}" />
                        <div class="form-group">
                        	<h2>${review.headline}</h2>
                        </div>
                        <div class="form-group">
                            <p>${review.headline}</p>
                        </div>
                        <div class="form-submit">
                        	<input type="submit" value="Cancel" class="submit" name="cancel" id="cancel" Save" type="submit"
										onClick="history.go(-1)" />
                            <input type="submit" value="Edit Review" class="submit" name="submit" id="submit" />
                        </div>
          
                    </form>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/frontend/common.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script text="text/javascript">
    	$(document).ready(function(){
    		$("#review-form").validate({
    			rules: {
    				headline: "required",
    				comment: "required"
    			},
    			messages: {
    				headline: "Please enter your headline",
    				comment: "Please enter your comment"
    			}
    		});
    		$("#rateYo").rateYo({
        	    starWidth: "30px",
        	    fullStar: true,
        	    onSet: function(rating, rateYoInstance) {
        	    	$("#rating").val(rating);
        	    }
        	  });
    	});
    </script>
</body>
</html>