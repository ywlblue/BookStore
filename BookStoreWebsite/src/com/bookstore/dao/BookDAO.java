package com.bookstore.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.bookstore.entity.Book;
import com.bookstore.entity.Users;

public class BookDAO extends JpaDAO<Book> implements GenericDAO<Book> {

	public BookDAO() {
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
	
	public List<Book> listByCategory(Integer catId) {
		return super.findWithNamedQuery("Book.findByCategory", "catId", catId);
	}
	
	public List<Book> listNewBook() {
		return super.findWithNamedQuery("Book.listNew", 0, 4);
	}
	
	public List<Book> searchBook(String keyword) {
		return super.findWithNamedQuery("Book.search", "keyword", keyword);
	}
	
	public long countByCategory(int categoryId) {
		return super.countWithNamedQuery("Book.countByCategory", "catId", categoryId);
	}

}
