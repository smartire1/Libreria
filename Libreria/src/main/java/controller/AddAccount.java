package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDAO;
import model.Customer;

@WebServlet(
		  name = "AddAccount", value = "/AddAccount")

public class AddAccount extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		final String db_url = "jdbc:mysql://localhost:3306/Librerie";
		final String user_db = "root";
		final String pass_db = "admin";
		Connection connessione;
		List<Customer> customer;
		

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connessione = DriverManager.getConnection(db_url,user_db,pass_db);
			CustomerDAO CustomerDAO = new CustomerDAO(connessione);
			customer = CustomerDAO.getAllCustomers();
			
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			
			
			for(Customer c: customer) {
				if(c.getEmail().equals(email)) {
					request.setAttribute("Message", "email già presente nel sistema");
		            request.getRequestDispatcher("/signin.jsp").forward(request, response);	
		            return;
				}
			}
			
			Customer toAdd = new Customer(email, nome, cognome, pass, false);
			CustomerDAO.addCustomer(toAdd);
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("nome", nome);
			session.setAttribute("cognome", cognome);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
}