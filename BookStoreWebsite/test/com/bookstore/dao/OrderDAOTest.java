package com.bookstore.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityNotFoundException;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;
import com.bookstore.entity.OrderDetailId;

class OrderDAOTest {
	private static OrderDAO orderDAO;
	
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@Test
	void testCreateBookOrder() {
		BookOrder order = new BookOrder();
		
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.get(3);
		
		order.setCustomer(customer);
		order.setFirstname("Kevin");
		order.setLastname("Kwang");
		order.setRecipientPhone("8069724546");
		order.setAddressLine1("80 Pinsky Rd");
		order.setAddressLine2("Apt A");
		order.setCity("Boston");
		order.setState("Massachusetts");
		order.setCountry("US");
		order.setZipcode("32105");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();
		
		Book book = new Book(2);
		orderDetail.setBook(book);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(79.98f);
		orderDetail.setBookOrder(order);
		
		orderDetails.add(orderDetail);
		order.setOrderDetails(orderDetails);
		order.setTax(7.99f);
		order.setShippingFee(1.99f);
		order.setSubtotal(79.98f);
		order.setPaymentMethod("PayPal");
		order.setStatus("Finished");
		
		BookOrder createdOrder = orderDAO.create(order);
		assertNotNull(createdOrder);
	}
	
	@Test
	void testCreateBookOrder2() {
		BookOrder order = new BookOrder();
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.get(3);
		
		order.setCustomer(customer);
		order.setFirstname("Alan");
		order.setLastname("Walker");
		order.setRecipientPhone("4153166017");
		order.setAddressLine1("2804 Shawn Rd");
		order.setCity("San Francisco");
		order.setState("California");
		order.setCountry("US");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();
		
		Book book = new Book(2);
		orderDetail.setBook(book);
		orderDetail.setQuantity(1);
		orderDetail.setSubtotal(39.99f);
		orderDetail.setBookOrder(order);
		
		orderDetails.add(orderDetail);
		order.setOrderDetails(orderDetails);
		
		order.setSubtotal(39.99f);
		order.setTax(3.99f);
		order.setShippingFee(1.99f);
		order.setSubtotal(45.97f);
		
		order.setPaymentMethod("Credit Card");
		order.setStatus("In Transit");
		
		BookOrder createdOrder = orderDAO.create(order);
		assertNotNull(createdOrder);
	}
	
	@Test
	void testUpdateBookOrderShippingAddress() {
		Integer orderId = 3;
		BookOrder order = orderDAO.get(orderId);
		String shippingAddress = "1256 8th Ave";
		order.setAddressLine1(shippingAddress);
		order.setCity("Los Angeles");
		order.setState("California");
		order.setCountry("US");
		
		orderDAO.update(order);
		
		assertEquals(order.getAddressLine1(), shippingAddress);
	}
	
	@Test
	void testUpdateBookOrder() {
		Integer orderId = 10;
		BookOrder order = orderDAO.get(orderId);
		
		float total = 89.96f;
		order.setTotal(total);
		orderDAO.update(order);
		assertEquals(order.getTotal(), total);
	}

	@Test
	void testGetBookOrder() {
		Integer orderId = 3;
		BookOrder order = orderDAO.get(orderId);
		
		assertEquals(1, order.getOrderDetails().size());
	}
	
	@Test
	void testGetBookOrderByIdAndCustomer() {
		Integer orderId = 6;
		Integer customerId = 1;
		
		BookOrder order = orderDAO.get(orderId, customerId);
		
		assertEquals(1, order.getOrderDetails().size());
	}
	
	
	@Test
	void testDeleteBookOrderFail() {
		assertThrows(EntityNotFoundException.class, () -> { 
			Integer orderId = 99;
			BookOrder order = orderDAO.delete(orderId);
			assertNull(order);
		});
	}

	@Test
	void testDeleteBookOrderSucceed() {
		Integer orderId = 2;
		BookOrder order = orderDAO.get(orderId);
		assertEquals(order.getOrderId(), orderId);
	}

	@Test
	void testListAll() {
		List<BookOrder> listOrder = orderDAO.listAll();
		
		assertTrue(listOrder.size() > 0);
	}

	@Test
	void testCount() {
		long count = orderDAO.count();
		List<BookOrder> listOrder = orderDAO.listAll();
		assertEquals(count, listOrder.size());
	}
	
	@Test
	void testListByCustomerNoOrders() {
		Integer customerId = 4;
		List<BookOrder> listOrder = orderDAO.listByCustomer(customerId);
		assertEquals(0, listOrder.size());
	}
	
	@Test
	void testListByCustomerHasOrders() {
		Integer customerId = 3;
		List<BookOrder> listOrder = orderDAO.listByCustomer(customerId);
		assertEquals(1, listOrder.size());
	}
	
	@Test
	void testListMostRecentSales() {
		List<BookOrder> listOrder = orderDAO.listMostRecentSales();
		assertTrue(listOrder.size() > 0 && listOrder.size() <= 3);
	}

}
