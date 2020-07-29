package com.bookstore.controller.frontend.shoppingcart;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Map;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.entity.Book;

class ShoppingCartTest {
	private static ShoppingCart cart;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		cart = new ShoppingCart();
		Book book = new Book(2);
		book.setPrice(20);

		cart.addItem(book);
		cart.addItem(book);
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@Test
	void testAddItem() {
		Map<Book, Integer> items = cart.getItems();
		Integer quantity = items.get(new Book(2));
		
		assertEquals(2, quantity);
	}

	@Test
	void testRemoveItem() {
		cart.removeItem(new Book(2));
		assertTrue(cart.getItems().isEmpty());
	}
	
	@Test
	void testRemoveItem2() {
		Book book4 = new Book(4);
		cart.addItem(book4);
		cart.removeItem(new Book(4));
		assertNull(cart.getItems().get(book4));
	}
	
	@Test
	void testGetTotalQuantity() {
		Book book4 = new Book(4);
		cart.addItem(book4);
		cart.addItem(book4);
		cart.addItem(book4);
		
		assertEquals(5, cart.getTotalQuantity());
	}
	
	@Test
	void testGetTotalAmount() {
		assertEquals(40.0f, cart.getTotalAmount(), 0.0f);
	}
	
	@Test
	void testClear() {
		cart.clear();
		assertEquals(0, cart.getTotalQuantity());
	}
	
	@Test
	void testUpdateCart() {
		ShoppingCart cart = new ShoppingCart();
		Book book1 = new Book(2);
		Book book2 = new Book(5);
		
		cart.addItem(book1);
		cart.addItem(book2);
		
		int[] bookIds = {2, 5};
		int[] quantities = {3, 4};
		cart.updateCart(bookIds, quantities);
		
		assertEquals(7, cart.getTotalQuantity());
	}

}
