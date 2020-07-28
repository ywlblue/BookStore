package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ReviewDAO reviewDAO;
	public ReviewServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		reviewDAO = new ReviewDAO();
	}
	public void listReviews() throws ServletException, IOException {
		listReviews(null);
	}
	
	public void listReviews(String message) throws ServletException, IOException {
		List<Review> listReviews = reviewDAO.listAll();

		request.setAttribute("listReviews", listReviews);

		if (message != null) {
			request.setAttribute("created_msg", message);
		}

		String reviewPage = "review_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(reviewPage);
		requestDispatcher.forward(request, response);

	}
	public void editReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("id"));
		Review review = reviewDAO.get(reviewId);

		String editPage = "edit_review.jsp";
		request.setAttribute("review", review);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
		
	}
	public void updateReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("reviewId"));
		String headline = request.getParameter("headline");
		String comment = request.getParameter("comment");
		
		Review review = reviewDAO.get(reviewId);
		if (review == null) {
			String message = "Could not find review with ID " + reviewId;
			request.setAttribute("error_msg", message);
			String errorPage = "message.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(errorPage);
			requestDispatcher.forward(request, response);
		} else {
			review.setHeadline(headline);
			review.setComment(comment);
			
			reviewDAO.update(review);
			String message = "Review has been updated successfully!";
			listReviews(message);
		}
		
	}
	public void deleteReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("id"));
		Review review = reviewDAO.get(reviewId);
		
		if (review == null) {
			String message = "Could not find review with ID " + reviewId;
			request.setAttribute("error_msg", message);
			String errorPage = "message.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(errorPage);
			requestDispatcher.forward(request, response);
		} else {
			reviewDAO.delete(reviewId);
			String message = "Review has been deleted successfully!";
			listReviews(message);
		}
	}
	public void showReviewForm() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("book_id"));
		BookDAO bookDAO = new BookDAO();
		Book book = bookDAO.get(bookId);
		
		HttpSession session = request.getSession();
		session.setAttribute("book", book);
		
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		Review existReview = reviewDAO.findByCustomerAndBook(customer.getCustomerId(), bookId);
		
		String targetPage = "frontend/review_form.jsp";
		if (existReview != null) {
			request.setAttribute("review", existReview);
			targetPage = "frontend/review_info.jsp";
		} 
		RequestDispatcher dispatcher = request.getRequestDispatcher(targetPage);
		dispatcher.forward(request, response);
		
		
		
	}
	public void submitReview() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("book_id"));
		Integer rating = Integer.parseInt(request.getParameter("rating"));
		
		String headline = request.getParameter("headline");
		String comment = request.getParameter("comment");
		
		Review newReview = new Review();
		newReview.setHeadline(headline);
		newReview.setComment(comment);
		newReview.setRating(rating);
		
		BookDAO bookDAO = new BookDAO();
		Book reviewBook = bookDAO.get(bookId);
		
		newReview.setBook(reviewBook);
		
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		newReview.setCustomer(customer);
		
		reviewDAO.create(newReview);
		
		String messagePage = "frontend/review_done.jsp";
		request.getSession().setAttribute("book", reviewBook);
		RequestDispatcher dispatcher = request.getRequestDispatcher(messagePage);
		dispatcher.forward(request, response);
	}
	
	
}
