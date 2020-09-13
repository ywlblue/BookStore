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
	private UserDAO userDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public UserServices(HttpServletRequest request, HttpServletResponse response) {
		userDAO = new UserDAO();
		this.request = request;
		this.response = response;
	}

	public void listUser() throws ServletException, IOException {
		listUser(null);
	}

	public void listUser(String message) throws ServletException, IOException {
		List<Users> usersList = userDAO.listAll();

		request.setAttribute("listUsers", usersList);

		if (message != null) {
			request.setAttribute("created_msg", message);
		}

		String usersPage = "users/users_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(usersPage);
		requestDispatcher.forward(request, response);

	}

	public void createUser() throws ServletException, IOException {

		String email = request.getParameter("email");
		String fullName = request.getParameter("full_name");
		String password = request.getParameter("password");

		// check whether email has been used
		if (userDAO.findByEmail(email) != null) {
			String message = "Could not create user. A user with email " + email + " already exists.";
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);

		} else {
			// list all users if new user created successfully
			// otherwise, the response will be submitted to message.jsp
			String message = "User has been created successfully!";

			Users newUser = new Users(email, fullName, password);
			userDAO.create(newUser);
			listUser(message);
		}

	}

	public void editUser() throws ServletException, IOException {
		Integer userId = Integer.parseInt(request.getParameter("id"));
		Users user = userDAO.get(userId);

		String editPage = "edit_user.jsp";
		request.setAttribute("user", user);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateUser() throws ServletException, IOException {
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		String email = request.getParameter("email");
		String fullName = request.getParameter("full_name");
		String password = request.getParameter("password");

		Users userById = userDAO.get(userId);
		Users userByEmail = userDAO.findByEmail(email);

		// ID not found
		if (userById == null) {
			String message = "Could not find user with ID " + userId;
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);

		} else if (userByEmail != null && userByEmail.getId() != userById.getId()) {
			// check whether email has been used
			String message = "Could not update user. A user with email " + email + " already exists.";
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);

		} else {
			String message = "User with email " + email + " has been update successfully!";
			Users newUser = new Users(userId, email, fullName, password);
			userDAO.update(newUser);
			listUser(message);
		}

	}

	public void deleteUser() throws ServletException, IOException {
		Integer userId = Integer.parseInt(request.getParameter("id"));

		Users userById = userDAO.get(userId);

		if (userById == null) {
			String message = "Could not find user with ID " + userId;
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);

		} else if (userId == 1) {
			String message = "The default admin user account cannot be deleted!";
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
			
		} else {

			userDAO.delete(userId);

			String message = "User has been deleted successfully!";
			listUser(message);
		}
	}
	
	public void login() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		boolean loginResult = userDAO.checkLogin(email, password);
		
		if (loginResult) {
			Users user = userDAO.findByEmail(email);
			String username = user.getFullname();
			System.out.println(username);
			request.getSession().setAttribute("username", username);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/");
			dispatcher.forward(request, response);
		} else {
			String message = "Login Failed";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			
		}
	}
}
