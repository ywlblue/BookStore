package com.bookstore.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.controller.frontend.shoppingcart.ShoppingCart;
import com.bookstore.dao.OrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

public class OrderServices {
	private final HttpServletRequest request;
	private final HttpServletResponse response;
	private final OrderDAO orderDAO;

	public OrderServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.orderDAO = new OrderDAO();
	}

	public void listOrders() throws ServletException, IOException {
		listOrders(null);

	}

	public void listOrders(String message) throws ServletException, IOException {
		List<BookOrder> listOrders = orderDAO.listAll();
		request.setAttribute("listOrders", listOrders);

		if (message != null) {
			request.setAttribute("created_msg", message);
		}

		String orderPage = "orders/orders_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(orderPage);
		requestDispatcher.forward(request, response);
	}

	public void viewOrderDeatilsForAdmin() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("id"));

		BookOrder order = orderDAO.get(orderId);

		if (order == null) {
			String message = "Could not find order with ID " + orderId;
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("order", order);

			String detailPage = "order_detail.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
			dispatcher.forward(request, response);
		}
	}

	public void showCheckoutForm() throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
		
		// tax is 10% of subtotal
		float tax = shoppingCart.getTotalAmount() * 0.1f;
		
		// shipping fee is 1.99 USD per copy - free shipping on any order greater than 99
		float shippingFee = 0.0f;
		if (shoppingCart.getTotalAmount() < 99.0f) { 
			shippingFee = shoppingCart.getTotalQuantity() * 1.99f;
		}
		float total = shoppingCart.getTotalAmount() + tax + shippingFee;
		request.setAttribute("tax", tax);
		request.setAttribute("shippingFee", shippingFee);
		request.setAttribute("total", total);
		
		CommonUtility.generateCountryList(request);
		
		String checkoutPage = "frontend/checkout.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(checkoutPage);
		dispatcher.forward(request, response);

	}

	public void placeOrder() throws ServletException, IOException {
		String firstName = request.getParameter("recipientFirstName");
		String lastName = request.getParameter("recipientLastName");
		String recipientPhone = request.getParameter("recipientPhone");
		String address1 = request.getParameter("addressLine1");
		String address2 = request.getParameter("addressLine2");
		String city = request.getParameter("recipientCity");
		String state = request.getParameter("recipientState");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("recipientCountry");
		String paymentMethod = request.getParameter("paymentMethod");
		float tax = Float.parseFloat(request.getParameter("tax"));
		float shippingFee = Float.parseFloat(request.getParameter("shippingFee"));
		float subtotal = Float.parseFloat(request.getParameter("subtotal"));

		BookOrder order = new BookOrder();
		order.setFirstname(firstName);
		order.setLastname(lastName);
		order.setRecipientPhone(recipientPhone);
		order.setAddressLine1(address1);
		order.setAddressLine2(address2);
		order.setCity(city);
		order.setState(state);
		order.setCountry(country);
		order.setZipcode(zipcode);
		order.setTax(tax);
		order.setSubtotal(subtotal);
		order.setShippingFee(shippingFee);
		order.setPaymentMethod(paymentMethod);
		order.setStatus("Processing");

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		order.setCustomer(customer);

		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
		Map<Book, Integer> items = shoppingCart.getItems();

		Iterator<Book> iterator = items.keySet().iterator();

		Set<OrderDetail> orderDetails = new HashSet<>();
		while (iterator.hasNext()) {
			Book book = iterator.next();
			Integer quantity = items.get(book);
			float bookSubtotal = quantity * book.getPrice();

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(book);
			orderDetail.setBookOrder(order);
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(bookSubtotal);

			orderDetails.add(orderDetail);
		}

		order.setOrderDetails(orderDetails);
		order.setTotal(shoppingCart.getTotalAmount());

		orderDAO.create(order);
		shoppingCart.clear();

		String message = "Thank you! Your order has been received."
				+ "We will deliver your book within a few business days.";

		String messagePage = "frontend/message.jsp";
		request.setAttribute("msg", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher(messagePage);
		dispatcher.forward(request, response);

	}

	public void listOrderByCustomer() throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		List<BookOrder> listOrders = orderDAO.listByCustomer(customer.getCustomerId());

		request.setAttribute("listOrders", listOrders);
		String orderPage = "frontend/order_list.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(orderPage);
		dispatcher.forward(request, response);

	}

	public void showOrderDetailForCustomers() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("id"));

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");

		BookOrder order = orderDAO.get(orderId, customer.getCustomerId());

		request.setAttribute("order", order);

		String detailPage = "frontend/order_detail.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
		dispatcher.forward(request, response);

	}

	public void showEditOrderForm() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		Object isPendingBook = session.getAttribute("NewBookPendingToAddToOrder");
		
		if (isPendingBook == null) {
			BookOrder order = orderDAO.get(orderId);
			session.setAttribute("order", order);
		
		} else {
			session.removeAttribute("NewBookPendingToAddToOrder");
		}
		
		CommonUtility.generateCountryList(request);
		
		String editOrderPage = "orders/edit_order.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(editOrderPage);
		dispatcher.forward(request, response);

	}

	public void updateOrder() throws ServletException, IOException {
		HttpSession session = request.getSession();
		BookOrder order = (BookOrder) session.getAttribute("order");
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String recipientPhone = request.getParameter("recipientPhone");
		String address1 = request.getParameter("addressLine1");
		String address2 = request.getParameter("addressLine2");
		String city = request.getParameter("recipientCity");
		String state = request.getParameter("recipientState");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");
		float tax = Float.parseFloat(request.getParameter("tax"));
		float shippingFee = Float.parseFloat(request.getParameter("shippingFee"));
		String paymentMethod = request.getParameter("paymentMethod");
		String orderStatus = request.getParameter("orderStatus");
		
		order.setFirstname(firstName);
		order.setLastname(lastName);
		order.setRecipientPhone(recipientPhone);
		order.setAddressLine1(address1);
		order.setAddressLine2(address2);
		order.setCity(city);
		order.setState(state);
		order.setCountry(country);
		order.setZipcode(zipcode);
		order.setTax(tax);
		order.setShippingFee(shippingFee);
		order.setPaymentMethod(paymentMethod);
		order.setStatus(orderStatus);
		
		String[] arrayBookId = request.getParameterValues("bookId");
		String[] arrayPrice = request.getParameterValues("price");
		String[] arrayQuantity = new String[arrayBookId.length];
		
		for (int i = 1; i <= arrayQuantity.length; i++) {
			arrayQuantity[i - 1] = request.getParameter("quantity" + i);
		}
		
		Set<OrderDetail> orderDetails = order.getOrderDetails();
		orderDetails.clear();
		
		float totalAmount = 0;
		
		for (int i = 0; i < arrayQuantity.length; i++) {
			int bookId = Integer.parseInt(arrayBookId[i]);
			int quantity = Integer.parseInt(arrayQuantity[i]);
			float price = Float.parseFloat(arrayPrice[i]);
			
			float subtotal = price * quantity;
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(new Book(bookId));
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
			orderDetail.setBookOrder(order);
			
			orderDetails.add(orderDetail);
			totalAmount += subtotal;
		}
		order.setSubtotal(totalAmount);
		
		totalAmount += tax;
		totalAmount += shippingFee;
		
		order.setTotal(totalAmount);
		
		orderDAO.update(order);
		
		String message = "The order has been updated successfully";
		listOrders(message);
	}

	public void deleteOrder() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("id"));
		BookOrder order = orderDAO.get(orderId);
		
		if (order == null) {
			String message = "Could not find order with ID " + orderId;
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else {
			orderDAO.delete(orderId);
			String message = "Delete an order successfully!";
			listOrders(message);
		}
	}

}
