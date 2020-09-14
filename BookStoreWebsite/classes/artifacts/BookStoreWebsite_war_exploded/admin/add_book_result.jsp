<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Add Book to Order - Jade & Gem Admin Panel</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div class="container text-center">
		<h2>The book ${book.title} has been added to the order ID ${order.orderId}</h2>
		<button class="btn btn-success" onclick="javascript: self.close();">Close</button>
	</div>
	
	<script>
		window.onunload = function() {
			window.opener.location.reload();
		}
	</script>
</body>
</html>