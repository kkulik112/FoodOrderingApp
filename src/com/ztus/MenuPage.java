package com.ztus;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MenuPage")
public class MenuPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MenuPage() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		ArrayList<MenuItem> menuItems = MenuDAO.getMenuItems();
		System.out.println(menuItems.toString());
		HttpSession session = request.getSession();
		
		session.setAttribute("menuItems", menuItems);
		
		String url = "/menu.jsp";
		getServletContext()
		.getRequestDispatcher(url)
		.forward(request, response);
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}

}
