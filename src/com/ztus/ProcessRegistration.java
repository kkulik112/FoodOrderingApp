package com.ztus;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProcessRegistration")
public class ProcessRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProcessRegistration() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String urlSuccess = "/RegisterSuccess.jsp";
			String urlFail = "/register.jsp";
			String email = request.getParameter("email");
			String confirm = request.getParameter("confirm");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String lastname = request.getParameter("lastname");
			String phonenumber = request.getParameter("phonenumber");
			String province = request.getParameter("province");
			String country = request.getParameter("country");
			String city = request.getParameter("city");
			String zipcode = request.getParameter("zipcode");
			String hash = Hash.hashPassword(password);
			boolean userExists = RegisterDAO.alreadyExists(email);
			
			if(!password.equals(confirm)){
				System.out.println("Password didn't match!");
				request.setAttribute("error", "Password didn't match!");
				getServletContext().getRequestDispatcher(urlFail).forward(request, response);
				} else {
					
			if(!userExists) {
				System.out.println("Creating user: " + email);
				RegisterDAO.addUser(email,hash,name,lastname,phonenumber,province,country,city,zipcode);
		
				request.setAttribute("registered", "true");
				request.setAttribute("email", email);
				getServletContext()
				.getRequestDispatcher(urlSuccess)
				.forward(request, response);
				
			}else {
				System.out.println("User already exists!");
				request.setAttribute("error", "This user already exists!");
				request.setAttribute("registered", "false");
				getServletContext()
				.getRequestDispatcher(urlFail)
				.forward(request, response);
				}	
			}
		}catch(Throwable theException) {
			System.out.println(theException);
			}
		}
	}