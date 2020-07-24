package com.bookstore.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import com.bookstore.entity.Book;
import com.bookstore.entity.Users;

public class BookDAO extends JpaDAO<Book> implements GenericDAO<Book> {

	public BookDAO(EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Book create(Book book) {
		book.setLastUpdateTime(new Date());
		return super.create(book);
	}

	@Override
	public Book update(Book book) {
		book.setLastUpdateTime(new Date());
		return super.update(book);
	}

	@Override
	public Book get(Object bookId) {
		return super.get(Book.class, bookId);
	}

	@Override
	public Book delete(Object bookId) {
		return super.delete(Book.class, bookId);
		
	}

	@Override
	public List<Book> listAll() {
		return super.findWithNamedQuery("Book.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Book.countAll");
	}
	
	public Book findByTitle(String title) {
		List<Book> listBooks = super.findWithNamedQuery("Book.findByTitle", "title", title);
		
		if (listBooks != null && listBooks.size() > 0) {
			return listBooks.get(0);
		}
		return null;
	}

}
