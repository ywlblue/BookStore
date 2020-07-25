package com.bookstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.persistence.PersistenceException;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.entity.Users;

class UserDAOTest {
	private static UserDAO userDAO;

	@BeforeAll
	public static void setUpBeforeClass() throws Exception {
		userDAO = new UserDAO();
	}

	@AfterAll
	public static void tearDownAfterClass() throws Exception {
		userDAO.close();
	}

	@Test
	void testCreateUsers() {
		// create a new user entity
		Users newUser = new Users();
		newUser.setEmail("jonnyrock@gmail.com");
		newUser.setFullname("Jonny Rock");
		newUser.setPassword("iamabigrock");

		newUser = userDAO.create(newUser);

		assertTrue(newUser.getId() > 0);
	}

	@Test
	public void testCreateUsersFieldsNotSet() {
		// create a new user entity
		assertThrows(PersistenceException.class, () -> { 
			Users newUser = new Users();
			newUser = userDAO.create(newUser);
			assertTrue(newUser.getId() > 0);
		});
	}

	@Test
	void testUpdateUsers() {
		Users newUser = new Users();
		newUser.setId(2);
		newUser.setEmail("anderson@gmail.com");
		newUser.setFullname("Anderson Winston");
		newUser.setPassword("addwinergo");

		newUser = userDAO.update(newUser);
		String expected = "Anderson Winston";
		String actual = newUser.getFullname();

		assertEquals(expected, actual);
	}

	@Test
	void testGetUser() {
		Integer userId = 1;
		Users firstUser = userDAO.get(userId);

		assertNotNull(firstUser);
	}

	@Test
	public void testGetNoUser() {
		Integer userId = 99;
		Users firstUser = userDAO.get(userId);

		assertNull(firstUser);
	}

	@Test
	public void testDeleteUsers() {
		Integer userId = 3;
		Users deletedUser = userDAO.delete(userId);

		assertNotNull(deletedUser);
	}

	@Test
	void testFindByEmail() {
		String email = "isweilanyu@gmail.com";
		Users user = userDAO.findByEmail(email);

		assertNotNull(user);
	}

	@Test
	void testListAll() {
		List<Users> listUsers = userDAO.listAll();

		assertTrue(listUsers.size() > 0);
	}

	@Test
	void testCount() {
		List<Users> listUsers = userDAO.listAll();
		long totalUsers = userDAO.count();

		assertEquals(listUsers.size(), totalUsers);
	}
	
	@Test
	void testLoginSuccess() {
		String email = "isweilanyu@gmail.com";
		String password = "helloworld";
		boolean loginResult = userDAO.checkLogin(email, password);
		
		assertTrue(loginResult);
	}
	
	@Test
	void testLoginFail() {
		String email = "abcjon@gmail.com";
		String password = "abc987";
		boolean loginResult = userDAO.checkLogin(email, password);
		
		assertFalse(loginResult);
	}

}
