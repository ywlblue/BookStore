package com.bookstore.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		String customerPage = "customer_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(customerPage);
		requestDispatcher.forward(request, response);

	}

	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullName = request.getParameter("full_name");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipCode = request.getParameter("zip_code");
		String country = request.getParameter("country");
		
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

			Customer newCustomer = new Customer(email, fullName, address, city, country, phone, 
												zipCode, password, new Date());
			customerDAO.create(newCustomer);
			listCustomers(message);
		}

	}

	public void editCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);

		String editPage = "edit_customer.jsp";
		request.setAttribute("customer", customer);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
		
	}
	
	public void readCustomerField(Customer customer) {
		
		String email = request.getParameter("email");
		String fullName = request.getParameter("full_name");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipCode = request.getParameter("zip_code");
		String country = request.getParameter("country");
		
		Customer newCustomer = new Customer(email, fullName, address, city, country, phone, 
				zipCode, password, new Date());
		
	}

	public void updateCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");
		
		Customer customerByEmail = customerDAO.findByEmail(email);
		
		if (customerByEmail != null && customerByEmail.getCustomerId() != customerId) {
			String message = "Could not update the customer with ID " + customerId + 
					" because there is an existing customer having the same id.";
		} else {
			
			String fullName = request.getParameter("full_name");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String zipCode = request.getParameter("zip_code");
			String country = request.getParameter("country");
			
			Customer customerById = customerDAO.get(customerId);
			customerById.setEmail(email);
			customerById.setFullname(fullName);
			customerById.setPassword(password);
			customerById.setPhone(phone);
			customerById.setAddress(address);
			customerById.setCity(city);
			customerById.setZipcode(zipCode);
			customerById.setCountry(country);
			
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
		} else {
			customerDAO.delete(customerId);
			String message = "A customer has been deleted successfully";
			listCustomers(message);
		}
		
	}
	

}
