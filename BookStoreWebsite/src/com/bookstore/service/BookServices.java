package com.bookstore.service;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.InputStream;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;



public class BookServices {
	private BookDAO bookDAO;
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	

	public BookServices(HttpServletRequest request,
			HttpServletResponse response) {
		this.request = request;
		this.response = response;
		
		bookDAO = new BookDAO();
		categoryDAO = new CategoryDAO();
	}
	
	public void listBooks() throws ServletException, IOException {
		listBooks(null);
	}

	
	public void listBooks(String message) throws ServletException, IOException {
		List<Book> listBooks = bookDAO.listAll();
		request.setAttribute("listBooks", listBooks);
		
		if (message != null) {
			request.setAttribute("created_msg", message);
		}

		String bookPage = "books/books_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(bookPage);
		requestDispatcher.forward(request, response);
		
	}

	public void showBookNewForm() throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		
		String newPage = "add_book.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
		requestDispatcher.forward(request, response);
		
	}

	public void createBook() throws ServletException, IOException {
		String title = request.getParameter("title");
		
		Book existedBook = bookDAO.findByTitle(title);
		
		if (existedBook != null) {
			String message = "Could not create new book because the title " + title + " exists already.";
			listBooks(message);
		}
		 
		existedBook = new Book();
		readBookFields(existedBook);
		
		Book createdBook = bookDAO.create(existedBook);	
		if (createdBook.getBookId() > 0) {
			String message = "A new book has been created successfully!";
			listBooks(message);
		} 
	}

	public void editBook() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		Book editBook = bookDAO.get(bookId);
		List<Category> listCategory = categoryDAO.listAll();
		
		String bookPage = "edit_book.jsp";
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("book", editBook);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(bookPage);
		requestDispatcher.forward(request, response);
		
	}
	
	public void readBookFields(Book book) throws IOException, ServletException {
		Integer categoryId = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		
		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		float price = Float.parseFloat(request.getParameter("price"));
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = null;
		try {
			publishDate = dateFormat.parse(request.getParameter("publish_date"));
		} catch (ParseException e) {
			e.printStackTrace();
			throw new ServletException("Error parsing publish date (format is MM/dd/yyyy)");
		}
		
		book.setTitle(title);
		book.setAuthor(author);
		book.setDescription(description);
		book.setIsbn(isbn);
		book.setPublishDate(publishDate);
		
		Category category = categoryDAO.get(categoryId);
		book.setCategory(category);
		
		book.setPrice(price);
		
		Part part = request.getPart("book_img");
		
		if (part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageBytes = new byte[(int) size];
			
			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			
			book.setImage(imageBytes);
		}
	}

	public void updateBook() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("bookId"));
		String title = request.getParameter("title");
		
		Book existedBook = bookDAO.findByTitle(title);
		
		if (existedBook != null && existedBook.getBookId() != bookId) {
			String message = "Could not update book because the title " + title + " exists already.";
			listBooks(message);
		}
		 
		readBookFields(existedBook);
		Book updatedBook = bookDAO.update(existedBook);

		if (updatedBook.getBookId() == bookId) {
			String message = "A book has been updated successfully!";
			listBooks(message);
		} 
		
	}

	public void deleteBook() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		
		Book book = bookDAO.get(bookId);
		if (book == null) {
			String message = "Could not find book with ID " + bookId + ", or it might have been deleted";
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else if (book.getReviews() != null) {
			String message = "Could not delete book with ID " + bookId + " because it has reviews";
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else {
			bookDAO.delete(bookId);
			String message = "A book has been deleted successfully";
			listBooks(message);
		}
		
		
	}

	public void listBooksByCategory() throws ServletException, IOException {
		Integer catId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(catId);
//		List<Category> listCategory = categoryDAO.listAll();
		List<Book> listBooks = bookDAO.listByCategory(catId);
		
		if (listBooks.size() == 0) {
			String message = "Sorry, the category " + category.getName() + " is not available now";
			request.setAttribute("msg", message);
		}
		
		request.setAttribute("category", category);
		request.setAttribute("listBooks", listBooks);
//		request.setAttribute("listCategory", listCategory);
		String bookPage = "frontend/books_by_category.jsp";
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(bookPage);
		requestDispatcher.forward(request, response);
	}

	public void viewBookDetail() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		Book selectedBook = bookDAO.get(bookId);
		
		String description = selectedBook.getDescription();
		Integer descLength = description.length();
		Integer maxView = 460;
		String teaser = "";
		String more = "";
		if (descLength > maxView) {
			teaser = description.substring(0, maxView);
			more = description.substring(maxView, descLength);
		} else {
			teaser = description;
		}
		
		Integer numOfReview = selectedBook.getReviews().size();
		request.setAttribute("book", selectedBook);
		request.setAttribute("teaser", teaser);
		request.setAttribute("more", more);
		request.setAttribute("numOfReview", numOfReview);
		
		String detailPage = "frontend/book_detail.jsp";
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(detailPage);
		requestDispatcher.forward(request, response);
		
		
	}

	public void searchBook() throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		List<Book> result = null;
		
		if (keyword.equals("")) {
			result = bookDAO.listAll();
		} else {
			result = bookDAO.searchBook(keyword);
			System.out.println(keyword);
		}
		
		request.setAttribute("results", result);
		request.setAttribute("keyword", keyword);
		
		String searchPage = "frontend/search_results.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(searchPage);
		requestDispatcher.forward(request, response);
		
	}

}
