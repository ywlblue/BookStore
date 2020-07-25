<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Add User - Jade & Gem Admin Panel</title>
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/main.css" />
<link
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<link
	href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/richtext.min.css">

</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	<div class="container clearfix">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a href="/jscss/admin/design/">Home</a><span
						class="crumb-step">&gt;</span><a class="crumb-name"
						href="/list_books">Book Management</a><span class="crumb-step">&gt;</span><span>New
						Book</span>
				</div>
			</div>
			<div class="result-wrap">
				<div class="result-content">
					<form action="create_book" method="post" id="bookform"
						name="bookform" enctype="multipart/form-data">
						<table class="insert-tab" width="100%">
							<tbody>
								<tr>
									<th width="120"><i class="require-red">*</i>Category：</th>
									<td><select name="category" id="category" class="required">
											<c:forEach items="${listCategory}" var="category">
												<option value="${category.categoryId}">${category.name}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<th><i class="require-red">*</i>Title：</th>
									<td><input class="common-text required" id="title"
										name="title" size="50" value="" type="text" required></td>
								</tr>
								<tr>
									<th><i class="require-red">*</i>Author：</th>
									<td><input class="common-text" name="author" size="50"
										type="text" required></td>
								</tr>
								<tr>
									<th><i class="require-red">*</i>ISBN：</th>
									<td><input class="common-text" name="isbn" size="50"
										type="text" required></td>
								</tr>
								<tr>
									<th><i class="require-red">*</i>Publish Date：</th>
									<td><input class="common-text" name="publish_date"
										id="publish_date" size="50" type="text" required></td>
								</tr>
								<tr>
									<th><i class="require-red">*</i>Book Image：</th>
									<td><input name="book_img" id="book_img" type="file"
										required><br> <img id="thumbnail"
										alt="Image Preview" style="width: 20%" /></td>
								</tr>
								<tr>
									<th><i class="require-red">*</i>Price：</th>
									<td><input class="common-text" name="price" size="50"
										type="text" required></td>
								</tr>
								<tr>
									<th><i class="require-red">*</i>Description：</th>
									<td><textarea name="description" class="common-textarea"
											id="description" cols="30" style="width: 98%;" rows="10"
											required></textarea></td>
								</tr>
								<tr>
									<th></th>
									<td><input class="btn btn-primary btn6 mr10" value="Save"
										type="submit"> <input class="btn btn6"
										onClick="history.go(-1)" value="Cancel" type="button">
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>

		</div>
	</div>
	<script>
		$(document).ready(function() {
			$(function() {
				$('#publish_date').datepicker();
				$('#description').richText();
				$('#book_img').change(function() {
					showImageThumbnail(this);
				});
			});

		})

		function showImageThumbnail(fileInput) {
			var file = fileInput.files[0];
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#thumbnail').attr('src', e.target.result);
			};

			reader.readAsDataURL(file);
		}
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../js/jquery.richtext.min.js"></script>

</body>

</html>