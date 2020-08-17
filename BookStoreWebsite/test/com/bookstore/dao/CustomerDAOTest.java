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
		customer.setEmail("amy.fowler@gmail.com");
		customer.setFirstname("Amy");
		customer.setLastname("Folwer");
		customer.setCity("Pasadena");
		customer.setState("California");
		customer.setCountry("United States");
		customer.setAddressLine1("351 S. Hudson Ave");
		customer.setRegisterDate(new Date());
		customer.setZipcode("91109");
		customer.setPassword("biology");
		customer.setPhone("6263963600");
		
		Customer createdCustomer = customerDAO.create(customer);
		assertNotNull(createdCustomer);
	}

	@Test
	void testUpdateCustomer() {
		Integer customerId = 5;
		Customer customer = customerDAO.get(customerId);
		
		customer.setPhone("6267955309");
		
		Customer createdCustomer = customerDAO.update(customer);
		
		assertEquals(createdCustomer.getPhone(), "6267955309");
		
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
	
	@Test
	void checkLoginSucceed() {
		String email = "tom@gmail.com";
		String password = "password...";
		
		Customer customer = customerDAO.checkLogin(email, password);
		assertNotNull(customer);
	}
	
	@Test
	void checkLoginFail() {
		String email = "jonny@gmail.com";
		String password = "password...";
		
		Customer customer = customerDAO.checkLogin(email, password);
		assertNull(customer);
	}

}
