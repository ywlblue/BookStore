package com.bookstore.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.entity.Customer;

class CustomerDAOTest {
	private static CustomerDAO customerDAO;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		customerDAO = new CustomerDAO();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		customerDAO.close();
	}

	@Test
	void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEmail("tom@gmail.com");
		customer.setFullname("Tom Eagar");
		customer.setCity("New York");
		customer.setCountry("United States");
		customer.setAddress("100 Maple street");
		customer.setRegisterDate(new Date());
		customer.setZipcode("10000");
		customer.setPassword("password");
		customer.setPhone("5139478821");
		
		Customer createdCustomer = customerDAO.create(customer);
		assertNotNull(createdCustomer);
	}

	@Test
	void testUpdateCustomer() {
		Customer customer = new Customer();
		customer.setCustomerId(1);
		customer.setEmail("tom@gmail.com");
		customer.setFullname("Tom Eagar");
		customer.setCity("New York");
		customer.setCountry("United States");
		customer.setAddress("100 Maple street");
		customer.setRegisterDate(new Date());
		customer.setZipcode("10503");
		customer.setPassword("password...");
		customer.setPhone("5139478821");
		
		Customer createdCustomer = customerDAO.update(customer);
		assertEquals(createdCustomer.getZipcode(), "10503");
		
	}

	@Test
	void testGetObject() {
		Integer customerId = 1;
		Customer customer = customerDAO.get(customerId);
		assertNotNull(customer);
	}

	@Test
	void testDeleteObject() {
		Integer customerId = 1;
		Customer customer = customerDAO.delete(customerId);
		assertEquals(customer.getCustomerId(), customerId);
	}

	@Test
	void testListAll() {
		List<Customer> customerList = customerDAO.listAll();
		assertTrue(customerList.size() > 0);
	}

	@Test
	void testCount() {
		List<Customer> customerList = customerDAO.listAll();
		long count = customerDAO.count();
		assertEquals(customerList.size(), count);
	}

}
