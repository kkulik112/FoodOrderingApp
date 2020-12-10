package com.ztus;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProcessCart")
public class ProcessCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProcessCart() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		String cartItem = request.getParameter("cartItem");
		Customer currentCustomer = (Customer) request.getSession().getAttribute("currentSessionCustomer");
		MenuItem item;
		String url = "/menu.jsp";
		try {
			item = MenuDAO.getMenuItem(cartItem.strip());
			currentCustomer.addToCart(item);
			System.out.println("cartItem: " + cartItem);
			System.out.println(currentCustomer.getCart().toString());
			getServletContext()
			.getRequestDispatcher(url)
			.forward(request, response);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		*/
		
		Customer customer = (Customer) request.getSession().getAttribute("currentSessionCustomer");
		String receivedItemName = request.getParameter("name"); 
		String operation = request.getParameter("operation");
		try {
			MenuItem receivedObject = MenuDAO.getMenuItem(receivedItemName);
			if(operation.equals("add")) {
				customer.getCart().addItem(receivedObject);
				//response.sendRedirect("/MenuPage");
				
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		System.out.println("in process cart...");
		System.out.println("cart:" + customer.getCart().toString());
		System.out.println("Cart count:" + customer.getCart().getSize());
		

	}

}
