package com.bookstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

public class UserDAOTest {
	private static EntityManagerFactory entityManagerFactory;
	private static EntityManager entityManager;
	private static UserDAO userDAO;
	
	@BeforeClass
	public static void setupClass() {
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
		entityManager = entityManagerFactory.createEntityManager();
		userDAO = new UserDAO(entityManager);
	}

	@Test
	public void testCreateUsers() {
		// create a new user entity
		Users newUser = new Users();
		newUser.setEmail("joebruin@gmail.com");
		newUser.setFullname("Joe Bruin");
		newUser.setPassword("gobruin");

		newUser = userDAO.create(newUser);
		
		assertTrue(newUser.getId() > 0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldsNotSet() {
		// create a new user entity
		Users newUser = new Users();
		newUser = userDAO.create(newUser);
		
		assertTrue(newUser.getId() > 0);
	}
	
	@Test
	public void testUpdateUsers() {
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
	public void testGetUsers() {
		Integer userId = 1;
		Users firstUser = userDAO.get(userId);
		
		assertNotNull(firstUser);
	}
	
	@Test
	public void testGetNoUsers() {
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
	public void testListAll() {
		List<Users> listUsers = userDAO.listAll();
		
		assertTrue(listUsers.size() > 0);
	}
	
	@Test
	public void testCount() {
		long totalUsers = userDAO.count();
		
		assertEquals(3, totalUsers);
	}
	
	@AfterClass
	public static void tearDownClass() {
		entityManager.close();
		entityManagerFactory.close();
	}

}
