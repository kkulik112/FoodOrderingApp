package com.ztus;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

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
		String urlSuccess = "/RegisterSuccess.jsp";
		String urlFail = "/register.jsp";
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean userExists = RegisterDAO.alreadyExists(email);
		
		if(!userExists) {
			System.out.println("Creating user: " + email);
			RegisterDAO.addUser(email, password);
	
			request.setAttribute("registered", "true");
			request.setAttribute("email", email);
			getServletContext()
			.getRequestDispatcher(urlSuccess)
			.forward(request, response);
		} else {
			System.out.println("This account already exists!");
			request.setAttribute("error", "This user already exists!");
			request.setAttribute("registered", "false");
			getServletContext()
			.getRequestDispatcher(urlFail)
			.forward(request, response);
		}		
	}
	
	protected void addUser(String email, String password) {
		Connection con;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/projekt";
			String user = "admin";
			String pw = "haslo";
			con = DriverManager.getConnection(url, user, pw);
			Statement s = con.createStatement();
			String query = "INSERT INTO customer " + "(email, password, cust_id) " + "VALUES ('" + email + "', '" + password + "', NULL)";
			System.out.println(query);
			s.executeUpdate(query);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
