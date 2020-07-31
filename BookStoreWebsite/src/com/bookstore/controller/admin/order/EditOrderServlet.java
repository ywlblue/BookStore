package com.bookstore.controller.admin.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.OrderServices;

/**
 * Servlet implementation class EditOrderServlet
 */
@WebServlet("/admin/edit_order")
public class EditOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		OrderServices orderServices = new OrderServices(request, response);
		orderServices.showEditOrderForm();
	}

}
