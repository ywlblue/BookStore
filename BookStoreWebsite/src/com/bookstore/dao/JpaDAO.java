package com.bookstore.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;

public class JpaDAO<T> {
	protected EntityManager entityManager;

	public JpaDAO(EntityManager entityManager) {
		super();
		this.entityManager = entityManager;
	}
	
	public T create(T entity) {
		entityManager.getTransaction().begin();
		
		entityManager.persist(entity);
		entityManager.flush();
		entityManager.refresh(entity);
		
		entityManager.getTransaction().commit();
		
		return entity;
		
	}
	public T update(T entity) {
		entityManager.getTransaction().begin();
		
		entity = entityManager.merge(entity);
		entityManager.getTransaction().commit();
		
		return entity;
		
	}
	public T get(Class<T> type, Object id) {
		T entity = entityManager.find(type, id);
		if (entity != null) {
			entityManager.refresh(entity);
		}
		return entity;
	}
	
	public T delete(Class<T> type, Object id) {
		T entity = entityManager.find(type, id);
		
		entityManager.getTransaction().begin();
		
		entityManager.remove(entity);
		entityManager.getTransaction().commit();
		return entity;
		
	}
	
	public List<T> findWithNamedQuery(String queryName){
		Query query = entityManager.createNamedQuery(queryName);
		return query.getResultList();
		
	}
	
	public List<T> findWithNamedQuery(String queryName, String paramName, Object paramVal){
		Query query = entityManager.createNamedQuery(queryName);
		query.setParameter(paramName, paramVal);
		return query.getResultList();
		
	}
	
	public long countWithNamedQuery(String queryName) {
		Query query = entityManager.createNamedQuery(queryName);
		return (long) query.getSingleResult();
	}

}
