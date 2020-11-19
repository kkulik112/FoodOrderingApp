package com.ztus;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProcessLogin")
public class ProcessLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProcessLogin() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String url = "/menu.jsp";
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Customer customer = new Customer();
		customer.setEmail(email);
		customer.setPassword(password);
		
		customer = LoginDAO.login(customer);
		
		if(customer.isValid()) {
			HttpSession session = request.getSession(true);
			session.setAttribute("currentSessionCustomer", customer);
			request.setAttribute("user_email", email);
			request.setAttribute("exists", "true");
			getServletContext()
			.getRequestDispatcher(url)
			.forward(request, response);
			//response.sendRedirect("/menu.jsp");
		} else {
			request.setAttribute("exists", "false");
			getServletContext()
			.getRequestDispatcher("/index.jsp")
			.forward(request, response);
			//response.sendRedirect("/invalidLogin.jsp");
		}
		
		/*
		request.setAttribute("user_email", email);
		getServletContext()
		.getRequestDispatcher(url)
		.forward(request, response);
		*/
		}catch(Throwable theException) {
			System.out.println(theException);
		}
	}

}
