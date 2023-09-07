package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;

@WebServlet(
		  name = "RimuoviCarrello", value = "/RimuoviCarrello")

public class RimuoviCarrello extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		final String db_url = "jdbc:mysql://localhost:3306/Librerie";
		final String user_db = "root";
		final String pass_db = "admin";
		Connection connessione;
		String isbn = request.getParameter("isbn");
				
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connessione = DriverManager.getConnection(db_url,user_db,pass_db);
			
			CartDAO CartDAO = new CartDAO(connessione);
			CartDAO.deleteCart(isbn, session.getAttribute("email").toString());
			
			request.getRequestDispatcher("/carrello.jsp").forward(request, response);
			return;
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Errore1");
		}
		System.out.println("Errore");
	}
}
