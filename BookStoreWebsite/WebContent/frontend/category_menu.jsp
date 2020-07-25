<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="category-sec">
	<div class="container">
		<c:forEach var="category" items="${listCategory}" varStatus="status">
			<a href="view_category?id=${category.categoryId}"> <b>
			<c:out value="${category.name}" /></b>
			</a>
			<c:if test="${not status.last}">
    				&nbsp; | &nbsp;
    			</c:if>
		</c:forEach>
	</div>
</section>