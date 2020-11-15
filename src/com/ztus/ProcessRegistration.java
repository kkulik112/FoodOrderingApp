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


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/RegisterSuccess.jsp";
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		addUser(email, password);
		Customer cust = new Customer(email, password);
		
		request.setAttribute("cust", cust);
		getServletContext()
		.getRequestDispatcher(url)
		.forward(request, response);
		
		
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
