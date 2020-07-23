<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>All Users - Jade & Gem Books</title>
	<link rel="stylesheet" type="text/css" href="../css/admin/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/admin/main.css"/>
	<script defer src="../js/general.js"></script>
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	<div class="container clearfix">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a href="index.jsp">Home</a><span
						class="crumb-step">&gt;</span><span class="crumb-name">Category
						Management</span>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="#" method="post">
						<table class="search-tab">
							<tr>
								<th width="120">选择分类:</th>
								<td><select name="search-sort" id="">
										<option value="">全部</option>
										<option value="19">精品界面</option>
										<option value="20">推荐界面</option>
								</select></td>
								<th width="70">关键字:</th>
								<td><input class="common-text" placeholder="关键字"
									name="keywords" value="" id="" type="text"></td>
								<td><input class="btn btn-primary btn2" name="sub"
									value="查询" type="submit"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="result-wrap">
				<form name="myform" id="myform" method="post">
					<div class="result-title">
						<div class="result-list">
							<a href="add_category.jsp"><i class="icon-font"></i>New Category</a> <a
								id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>Delete
								All</a> <a id="updateOrd" href="javascript:void(0)"><i
								class="icon-font"></i>更新排序</a>
						</div>
					</div>
					<c:if test="${created_msg != null}">
  						<h4><i>${created_msg}</i></h4>
					</c:if>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<tr>
								<th class="tc" width="5%"><input class="allChoose" name=""
									type="checkbox"></th>
								<th>Index</th>
								<th>ID</th>
								<th>Category Name</th>
								<th>Action</th>
							</tr>
							<c:forEach var="cat" items="${listCategory}" varStatus="status">
								<tr>
									<td class="tc"><input name="id[]" value="59"
										type="checkbox"></td>
									<td>${status.index + 1}</td>
									<td>${cat.categoryId}</td>
									<td>${cat.name}</td>
									<td>
										<a class="link-update" href="edit_category?id=${cat.categoryId}">Edit</a> 
										<a class="link-del" href="javascript:confirmDelete(${cat.categoryId}, 'category')">Delete</a>
									</td>
								</tr>
							</c:forEach>
						</table>
						<div class="list-page">2 条 1/1 页</div>
					</div>
				</form>
			</div>
		</div>
</body>
</html>