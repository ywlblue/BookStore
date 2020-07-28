package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.ReviewDAO;
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
	
	
}
