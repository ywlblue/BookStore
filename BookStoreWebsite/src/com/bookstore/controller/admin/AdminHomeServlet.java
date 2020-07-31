package com.bookstore.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.dao.UserDAO;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Review;

/**
 * Servlet implementation class AdminHomeServlet
 */
@WebServlet("/admin/")
public class AdminHomeServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String homepage = "index.jsp";
		
		UserDAO userDAO = new UserDAO();
		long totalUsers = userDAO.count();
		request.setAttribute("totalUsers", totalUsers);
		
		OrderDAO orderDAO = new OrderDAO();
		List<BookOrder> mostRecentOrders = orderDAO.listMostRecentSales();
		long totalOrders = orderDAO.count();
		request.setAttribute("mostRecentOrders", mostRecentOrders);
		request.setAttribute("totalOrders", totalOrders);
		
		ReviewDAO reviewDAO = new ReviewDAO();
		List<Review> mostRecentReviews = reviewDAO.listMostRecentReviews();
		long totalReviews = reviewDAO.count();
		request.setAttribute("mostRecentReviews", mostRecentReviews);
		request.setAttribute("totalReviews", totalReviews);
		
		
		BookDAO bookDAO = new BookDAO();
		long totalBooks = bookDAO.count();
		request.setAttribute("totalBooks", totalBooks);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
