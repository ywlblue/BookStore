function confirmDelete(id, controller) {
	var location = '';
	
	if (controller === "user") {
		location = 'delete_user?id=' + id;
	} else if (controller === "category") {
		location = 'delete_category?id=' + id;
	} else if (controller == "book") {
		location = 'delete_book?id=' + id;
	} else if (controller == "customer") {
		location = 'delete_customer?id=' + id;
	} else if (controller == "review") {
		location = 'delete_review?id=' + id;
	} else if (controller == "order") {
		location = 'delete_order?id=' + id;
	}
	
	if (confirm('Are you sure you want to delete ID ' + id + "?")) {
		window.location = location;
	}
}