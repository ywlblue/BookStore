package com.bookstore.dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.bookstore.entity.Category;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

	public CategoryDAO() {
	}

	@Override
	public Category create(Category category) {
		return super.create(category);
	}

	@Override
	public Category update(Category category) {
		return super.update(category);
	}

	@Override
	public Category get(Object id) {
		return super.get(Category.class, id);
	}

	@Override
	public Category delete(Object id) {
		return super.delete(Category.class, id);
	}

	@Override
	public List<Category> listAll() {
		return super.findWithNamedQuery("Category.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Category.countAll");
	}
	
	public Category findByName(String catName) {
		List<Category> categoryList = super.findWithNamedQuery("Category.findByName", "name", catName);
		
		if (categoryList != null && categoryList.size() > 0) {
			return categoryList.get(0);
		}
		return null;
	}

}
