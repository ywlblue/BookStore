package com.bookstore.dao;

import static org.junit.Assert.assertThrows;
import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

class ReviewDAOTest {

	private static ReviewDAO reviewDAO;
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		reviewDAO = new ReviewDAO();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		reviewDAO.close();
	}

	@Test
	void testCreateReview() {
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.get(1);
		
		
		BookDAO bookDAO = new BookDAO();
		Book book = bookDAO.get(4);
	
		Review review = new Review();
		review.setCustomer(customer);
		review.setBook(book);
		review.setRating(4);
		review.setComment("Really enjoyed the story of Harper and her sister Willa. "
				+ "A very moving story. Brougjt up a lot of memories of my sister as we "
				+ "traveled the same road eighteen years ago. LOVE is the key word and Debbie "
				+ "hit the nail on the head with her story.");
		review.setHeadline("Wonderful");
		Review createdReview = reviewDAO.create(review);
		assertNotNull(createdReview);
	}

	@Test
	void testUpdateReview() {
		Review review = reviewDAO.get(2);
		String headline = "A must read!!!";
		review.setHeadline(headline);
		
		Review updatedReview = reviewDAO.update(review);
		assertEquals(headline, updatedReview.getHeadline());
	}

	@Test
	void testGetReview() {
		Review review = reviewDAO.get(2);
		assertNotNull(review);
	}

	@Test
	void testDeleteReviewSucceed() {
		Integer reviewId = 2;
		 Review review = reviewDAO.delete(reviewId);
		 assertEquals(review.getReviewId(), reviewId);
	}
	
	@Test
	void testDeleteReviewFail() {
		assertThrows(EntityNotFoundException.class, () -> { 
		 Integer reviewId = 99;
		 Review review = reviewDAO.delete(reviewId);
		 assertEquals(review.getReviewId(), reviewId);
		});
	}

	@Test
	void testListAll() {
		List<Review> reviewList = reviewDAO.listAll();
		assertTrue(reviewList.size() > 0);
	}

	@Test
	void testCount() {
		List<Review> reviewList = reviewDAO.listAll();
		long count = reviewDAO.count();
		assertEquals(reviewList.size(), count);
	}
	
	@Test
	void testFindByCustomerAndBookNotFound() {
		Integer customerId = 100;
		Integer bookId = 99;
		
		Review result = reviewDAO.findByCustomerAndBook(customerId, bookId);
		
		assertNull(result);
	}
	
	@Test
	void testFindByCustomerAndBookFound() {
		Integer customerId = 1;
		Integer bookId = 4;
		
		Review result = reviewDAO.findByCustomerAndBook(customerId, bookId);
		
		assertNotNull(result);
	}

}
