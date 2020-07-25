package com.bookstore.dao;

import static org.junit.Assert.assertThrows;
import static org.junit.jupiter.api.Assertions.*;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.persistence.EntityNotFoundException;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

class BookDAOTest {
	private static BookDAO bookDAO;
	@BeforeAll
	public static void setUpBeforeClass() throws Exception {
		bookDAO = new BookDAO();
		
	}

	@AfterAll
	public static void tearDownAfterClass() throws Exception {
		bookDAO.close();
	}

	@Test
	void testCreateBook() throws ParseException, MalformedURLException, IOException {
		Book newBook = new Book();
		Category category = new Category("Front End");
		category.setCategoryId(1);
		newBook.setCategory(category);
		
		newBook.setTitle("Web Design Playground: HTML & CSS the Interactive Way (1st Edition)");
		newBook.setAuthor("Paul McFedries");
		newBook.setDescription("Web Design Playground takes you step by step from writing your first line of HTML to creating interesting and attractive web pages.");
		newBook.setPrice(39.99f);
		newBook.setIsbn("1617294403");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/19/2019");
		newBook.setPublishDate(publishDate);
		
		// open an online image
		String imageUrl = "https://www.amazon.com/images/I/41-6F+RDbIL._SX397_BO1,204,203,200_.jpg";
		BufferedImage img = ImageIO.read(new URL(imageUrl));
		
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ImageIO.write(img, "jpg", out);
		byte[] imagesBytes = out.toByteArray();
		
		newBook.setImage(imagesBytes);
		
		Book createdBook = bookDAO.create(newBook);
		assertTrue(createdBook.getBookId() > 0);
		
	}

	@Test
	void testUpdateBook() throws ParseException, MalformedURLException, IOException {
		Book book = new Book();
		book.setBookId(1);
		Category category = new Category("Front End");
		category.setCategoryId(1);
		book.setCategory(category);
		
		book.setTitle("Web Design Playground: HTML & CSS the Interactive Way (1st Edition)");
		book.setAuthor("Paul McFedries");
		book.setDescription("Web Design Playground takes you step by step from writing your first line of HTML to creating interesting and attractive web pages.");
		book.setPrice(25.99f);
		book.setIsbn("1617294403");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/19/2019");
		book.setPublishDate(publishDate);
		
		// open an online image
		String imageUrl = "https://www.amazon.com/images/I/41-6F+RDbIL._SX397_BO1,204,203,200_.jpg";
		BufferedImage img = ImageIO.read(new URL(imageUrl));
		
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ImageIO.write(img, "jpg", out);
		byte[] imagesBytes = out.toByteArray();
		
		book.setImage(imagesBytes);
		
		Book updatedBook = bookDAO.update(book);
		assertEquals(book.getTitle(), updatedBook.getTitle());
	}
	
	@Test
	void testGetBook() {
		Integer bookId = 2;
		Book book = bookDAO.get(bookId);
		assertNotNull(book);
	}

	@Test
	void testGetBookFail() {
		Integer bookId = 100;
		Book book = bookDAO.get(bookId);
		assertNull(book);
	}
	
	@Test
	void testDeleteBook() {
		Integer bookId = 1;
		Book deletedBook = bookDAO.delete(bookId);
		assertEquals(deletedBook.getBookId(), bookId);
	}

	@Test
	void testDeleteBookFail() {
		assertThrows(EntityNotFoundException.class, () -> { 
			Integer bookId = 100;
			bookDAO.delete(bookId);
		});
	}

	@Test
	void testListAll() {
		List<Book> listBooks = bookDAO.listAll();
		assertFalse(listBooks.isEmpty());
	}

	@Test
	void testFindByTitleNotExist() {
		String title = "Core Java";
		Book book = bookDAO.findByTitle(title);
		assertNull(book);
	}
	
	@Test
	void testFindByTitleExist() {
		String title = "Web Design Playground: HTML & CSS the Interactive Way (1st Edition)";
		Book book = bookDAO.findByTitle(title);
		assertNotNull(book);
	}
	
	@Test
	void testCount() {
		long totalBooks = bookDAO.count();
		List<Book> listBooks = bookDAO.listAll();
		assertEquals(listBooks.size(), totalBooks);
	}
	
	@Test
	void testDeleteBookSuccess() {
		Integer bookId = 1;
		Book deletedBook = bookDAO.delete(bookId);
		assertEquals(deletedBook.getBookId(), bookId);
	}
	
	@Test
	void testListByCategory() {
		Integer categoryId = 1;
		List<Book> listBooks = bookDAO.listByCategory(categoryId);
		
		assertTrue(listBooks.size() > 0);
	}
	
	@Test
	void testListNewBooks() {
		List<Book> listNewBooks = bookDAO.listNewBook();
		assertTrue(listNewBooks.size() <= 4);
	}
	
	@Test
	void testSearchBookByTitle() {
		String keyword = "Web";
		List<Book> books = bookDAO.searchBook(keyword);
		assertEquals(books.size(), 1);
	}
	
	@Test
	void testSearchBookByAuthor() {
		String keyword = "Knight";
		List<Book> books = bookDAO.searchBook(keyword);
		assertEquals(books.size(), 1);
	}
	
	@Test
	void testSearchBookByDescription() {
		String keyword = "relationship between material goods";
		List<Book> books = bookDAO.searchBook(keyword);
		assertEquals(books.size(), 1);
	}

}
