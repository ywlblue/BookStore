package com.bookstore.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Users;

public class CustomerServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CustomerDAO customerDAO;

	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		customerDAO = new CustomerDAO();
	}

	public void listCustomers() throws ServletException, IOException {
		listCustomers(null);
	}

	public void listCustomers(String message) throws ServletException, IOException {
		List<Customer> listCustomers = customerDAO.listAll();

		request.setAttribute("listCustomers", listCustomers);

		if (message != null) {
			request.setAttribute("created_msg", message);
		}

		String customerPage = "customers/customers_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(customerPage);
		requestDispatcher.forward(request, response);

	}

	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		
		// check whether email has been used
		if (customerDAO.findByEmail(email) != null) {
			String message = "Could not create customer. A customer with email " + email + " already exists.";
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);

		} else {
			// list all customers if new customer created successfully
			// otherwise, the response will be submitted to message.jsp
			String message = "A cusomer has been created successfully!";
			Customer newCustomer = new Customer();
			readCustomerFields(newCustomer);
			newCustomer.setRegisterDate(new Date());
			
			customerDAO.create(newCustomer);
			listCustomers(message);
		}

	}

	public void editCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);

		String editPage = "edit_customer.jsp";
		request.setAttribute("customer", customer);

		CommonUtility.generateCountryList(request);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
		
	}

	public void updateCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");
		
		Customer customerByEmail = customerDAO.findByEmail(email);
		
		if (customerByEmail != null && customerByEmail.getCustomerId() != customerId) {
			String message = "Could not update the customer with ID " + customerId + 
					" because there is an existing customer having the same id.";
			request.setAttribute("error_msg", message);
			String errorPage = "message.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(errorPage);
			requestDispatcher.forward(request, response);
		} else {
			
			Customer customerById = customerDAO.get(customerId);
			readCustomerFields(customerById);
			
			customerDAO.update(customerById);
			String message = "The customer has been updated successfully!";
			listCustomers(message);
		}
		
	}

	public void deleteCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		System.out.println(customerId);
		
		Customer customer = customerDAO.get(customerId);
		
		if (customer == null) {
			String message = "Could not find customer with ID " + customerId + ", or it might have been deleted";
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else if (customer.getReviews() != null) {
			String message = "Could not delete book with ID " + customerId + " because he/she posted reviews for books";
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else {
			customerDAO.delete(customerId);
			String message = "A customer has been deleted successfully";
			listCustomers(message);
		}
		
	}
	
	public void readCustomerFields(Customer customer) {
		String email = request.getParameter("email");
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address1 = request.getParameter("addressLine1");
		String address2 = request.getParameter("addressLine2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipCode = request.getParameter("zip_code");
		String country = request.getParameter("country");
		
		if (email != null || email.equals("")) {
			customer.setEmail(email);
		}
		
		customer.setFirstname(firstName);
		customer.setLastname(lastName);
		if (password != null || password.equals("")) {
			customer.setPassword(password);
		}
		
		customer.setPhone(phone);
		customer.setAddressLine1(address1);
		customer.setAddressLine2(address2);
		customer.setCity(city);
		customer.setState(state);
		customer.setZipcode(zipCode);
		customer.setCountry(country);
		
	}

	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		
		// check whether email has been used
		if (customerDAO.findByEmail(email) != null) {
			String message = "Could not register. Email " + email + "has been registered by other customers.";
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/message.jsp");
			dispatcher.forward(request, response);

		} else {
			// list all customers if new customer created successfully
			// otherwise, the response will be submitted to message.jsp
			String message = "Register successfully!";
			

			Customer newCustomer = new Customer();
			readCustomerFields(newCustomer);
			newCustomer.setRegisterDate(new Date());
			customerDAO.create(newCustomer);
			
			request.setAttribute("msg", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/message.jsp");
			dispatcher.forward(request, response);
		}
		
	}
	
	public void showLogin() throws ServletException, IOException {
		String loginForm = "frontend/login_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(loginForm);
		dispatcher.forward(request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Customer customer = customerDAO.checkLogin(email, password);
		if (customer == null) {
			String message = "Login Failed. Please check your email and password";
			request.setAttribute("error-msg", message);
			showLogin();
		} else {
			HttpSession session = request.getSession();
			Object objRedirectURL = session.getAttribute("redirectURL");
			request.getSession().setAttribute("loggedCustomer", customer);
			if (objRedirectURL != null) {
				String redirectURL = (String) objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			} else {
				showCustomerProfile();
			}
					
		}
		
	}

	public void showCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer)request.getSession().getAttribute("loggedCustomer");
		request.setAttribute("customer", customer);
		CommonUtility.generateCountryList(request);
		String profilePage = "frontend/customer_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(profilePage);
		dispatcher.forward(request, response);
		
	}

	public void updateProfile() throws ServletException, IOException {
		Customer customer = (Customer)request.getSession().getAttribute("loggedCustomer");
		readCustomerFields(customer);
		
		customerDAO.update(customer);
		showCustomerProfile();
		
	}

	public void showNewCustomerForm() throws ServletException, IOException {
		CommonUtility.generateCountryList(request);
		
		String customerForm = "add_customer.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(customerForm);
		dispatcher.forward(request, response);
		
	}
	
	public void showRegisterForm() throws ServletException, IOException {
		CommonUtility.generateCountryList(request);
		
		String registerForm = "frontend/register_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(registerForm);
		dispatcher.forward(request, response);
	}

	public void editCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer)request.getSession().getAttribute("loggedCustomer");
		request.setAttribute("customer", customer);
		CommonUtility.generateCountryList(request);
		String registerForm = "frontend/edit_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(registerForm);
		dispatcher.forward(request, response);
	}
	

}
