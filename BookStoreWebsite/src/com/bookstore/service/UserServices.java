package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Users;

public class UserServices {
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private UserDAO userDAO;
	private HttpServletRequest request; 
	private HttpServletResponse response;
	
	
	
	public UserServices(HttpServletRequest request, HttpServletResponse response) {
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
		entityManager = entityManagerFactory.createEntityManager();
		userDAO = new UserDAO(entityManager);
		this.request = request;
		this.response = response;
	}
	
	public void listUser() throws ServletException, IOException {
		List<Users> usersList = userDAO.listAll();
		
		request.setAttribute("listUsers", usersList);
		
		String usersPage = "users_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(usersPage);
		requestDispatcher.forward(request, response);
	}

	public void listUser(String message) 
			throws ServletException, IOException {
		List<Users> usersList = userDAO.listAll();
		
		request.setAttribute("listUsers", usersList);
		
		if (message != null) {
			request.setAttribute("created-msg", message);
		}
		
		
		String usersPage = "users_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(usersPage);
		requestDispatcher.forward(request, response);
	}
	
	public void createUser() throws ServletException, IOException{
		
		String email = request.getParameter("email");
		String fullName = request.getParameter("full_name");
		String password = request.getParameter("password");
		
		// check whether email has been used
		if (userDAO.findByEmail(email) != null) {
			String message = "Could not create user. A user with email " 
							+ email + " already exists."; 
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		}
		Users newUser = new Users(email, fullName, password);
		userDAO.create(newUser);
	}
}
