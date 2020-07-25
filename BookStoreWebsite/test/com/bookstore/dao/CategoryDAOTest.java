package com.bookstore.dao;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.entity.Category;

public class CategoryDAOTest{
	
	private static CategoryDAO categoryDAO;
	
	@BeforeAll
	public static void setUpBeforeClass() throws Exception {
		categoryDAO = new CategoryDAO();
	}

	@AfterAll
	public static void tearDownAfterClass() throws Exception {
		categoryDAO.close();
	}


	@Test
	public void testCreateCategory() {
		Category newCat = new Category("Novel");
		Category category = categoryDAO.create(newCat);
		
		assertTrue(category != null && category.getCategoryId() > 0);
	}

	@Test
	void testUpdateCategory() {
		Category cat = new Category("History");
		cat.setCategoryId(2);
		Category category = categoryDAO.update(cat);
		
		assertEquals(cat.getName(), category.getName());
	}

	@Test
	void testGetObject() {
		Integer catId = 1;
		Category cat = categoryDAO.get(catId);
		
		assertNotNull(cat);
	}

	@Test
	void testDeleteObject() {
		Integer catId = 3;
		categoryDAO.delete(catId);
		Category cat = categoryDAO.get(catId);
		assertNull(cat);
	}

	@Test
	void testListAll() {
		List<Category> listCategory = categoryDAO.listAll();
		assertTrue(listCategory.size() > 0);
	}

	@Test
	void testCount() {
		List<Category> listCategory = categoryDAO.listAll();
		long count = categoryDAO.count();
		assertEquals(listCategory.size(), count);
	}
	
	@Test
	void testFindByName() {
		Category category = categoryDAO.findByName("Novel");
		assertNotNull(category);
	}

}
