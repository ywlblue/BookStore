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
	<div class="container text-center container-sm">
		<div>Add Book to Order ID: ${order.orderId}</div>
		<form action="add_book_to_order" method="post">
			<div class="form-group">
				<label for="bookId">Select a book:</label> 
				<select class="form-control" id="bookId" name="bookId">
					<c:forEach items="${listBook}" var="book" varStatus="sttaus">
						<option value="${book.bookId}">${book.bookId} -
							${book.title} - ${book.author}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="bookCopies">Number of Copies</label> 
				<select class="form-control" id="bookCopies" name="quantity">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
			<div>
				<button type="submit" class="btn btn-primary">Submit</button>
				<button class="btn btn-primary" onclick="javascript: self.close();">Cancel</button>
			</div>
		</form>
	</div>
</body>
</html>