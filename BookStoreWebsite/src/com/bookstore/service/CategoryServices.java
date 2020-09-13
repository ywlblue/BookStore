package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;
import com.bookstore.entity.Users;

public class CategoryServices {
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public CategoryServices( HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		categoryDAO = new CategoryDAO();
	}

	public void listCategory() throws ServletException, IOException {
		listCategory(null);
	}

	public void listCategory(String message) throws ServletException, IOException {

		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		String categoryPage = "categories/categories_list.jsp";

		if (message != null) {
			request.setAttribute("created_msg", message);
		}

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(categoryPage);
		requestDispatcher.forward(request, response);

	}

	public void createCategory() throws ServletException, IOException {

		// create new category based on user input
		String catName = request.getParameter("category_name");
		Category newCat = new Category(catName);

		// check for category name

		if (categoryDAO.findByName(catName) != null) {
			// category has existed, go to error page
			String message = "Could not create category. The category " + catName + " already exists!";
			request.setAttribute("error_msg", message);

			String categoryPage = "message.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(categoryPage);
			requestDispatcher.forward(request, response);

		} else {
			Category category = categoryDAO.create(newCat);

			listCategory("Category created successfully!");
		}

	}

	// set up the edit page
	public void editCategory() throws ServletException, IOException {
		Integer catId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(catId);

		String editPage = "edit_category.jsp";
		request.setAttribute("category", category);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	// do all update stuffs
	public void updateCategory() throws ServletException, IOException {

		Integer catId = Integer.parseInt(request.getParameter("id"));
		String catName = request.getParameter("category_name");
		Category cat = new Category(catId, catName);
		if (categoryDAO.get(catId) == null) {
			String message = "Could not find category with ID " + catId;
			request.setAttribute("error_msg", message);

			String categoryPage = "message.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(categoryPage);
			requestDispatcher.forward(request, response);

		} else if (categoryDAO.findByName(catName) != null && catId != cat.getCategoryId()) {
			// category has existed, go to error page
			String message = "Could not update category. The category " + catName + " already exists!";
			request.setAttribute("error_msg", message);

			String categoryPage = "message.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(categoryPage);
			requestDispatcher.forward(request, response);

		} else {
			Category category = categoryDAO.update(cat);

			listCategory("Category has been updated successfully!");
		}

	}

	public void deleteCategory() throws ServletException, IOException {
		Integer catId = Integer.parseInt(request.getParameter("id"));
		Category cat = categoryDAO.get(catId);
		
		BookDAO bookDAO = new BookDAO();
		long numberOfBooks = bookDAO.countByCategory(catId);

		if (cat == null) {
			String message = "Could not find category with ID " + catId;
			request.setAttribute("error_msg", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else {
			String message = "";
			if (numberOfBooks > 0) {
				message = "Could not delete the category (ID: %d) because it currently contains some books"; 
				message = String.format(message, catId);
			} else {
				categoryDAO.delete(catId);
				message = "Category has been deleted successfully!";
			}
			listCategory(message);
			
		}

	}

}
