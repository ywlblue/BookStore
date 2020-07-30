package com.bookstore.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
	private HttpServletRequest request;
	private HttpServletResponse response;
	private OrderDAO orderDAO;
	
	
	
	
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

		String orderPage = "order_list.jsp";
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
		String checkoutPage = "frontend/checkout.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(checkoutPage);
		dispatcher.forward(request, response);
		
	}

	public void placeOrder() throws ServletException, IOException {
		String recipientName = request.getParameter("recipientName");
		String recipientPhone = request.getParameter("recipientPhone");
		String address = request.getParameter("recipientAddress");
		String city = request.getParameter("recipientCity");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("recipientCountry");
		String paymentMethod = request.getParameter("paymentMethod");
		String shippingAddress = address + ", " + city + ", " + country + " " + zipcode;
		
		BookOrder order = new BookOrder();
		order.setRecipientName(recipientName);
		order.setRecipientPhone(recipientPhone);
		order.setShippingAddress(shippingAddress);
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
			float subtotal = quantity * book.getPrice();
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(book);
			orderDetail.setBookOrder(order);
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
			
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

}
