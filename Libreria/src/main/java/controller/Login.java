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
		  name = "Login", value = "/Login")

public class Login extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
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
			
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			
			for(Customer c: customer) {
				if(c.getEmail().equals(email) && c.getPassword().equals(pass) && c.getRole()) {
					HttpSession session = request.getSession();
					session.setAttribute("nome", c.getNome());
					session.setAttribute("cognome", c.getCognome());
					session.setAttribute("email", email);
					session.setAttribute("admin", true);
					request.getRequestDispatcher("/index_admin.jsp").forward(request, response);
					return;
				}
				
				if(c.getEmail().equals(email) && c.getPassword().equals(pass)) {
					HttpSession session = request.getSession();
					session.setAttribute("nome", c.getNome());
					session.setAttribute("cognome", c.getCognome());
					session.setAttribute("email", email);
					request.getRequestDispatcher("/index.jsp").forward(request, response);
					return;
				}
			}
			
		} catch(Exception e) {
			System.out.print("Eccezione catturata\n");
			e.printStackTrace();
		}

		System.out.println("Password sbagliata o utente non esistente");
        request.setAttribute("errorMessage", "Password errata o utente inesistente");
        request.getRequestDispatcher("/login.jsp").forward(request, response);	
        return;
		
		/*		
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connessione = DriverManager.getConnection(db_url,user_db,pass_db);
				Statement cmd = connessione.createStatement();
				String nome = request.getParameter("email");
				String pass = request.getParameter("pass");
				String query = "select * from Customer";
				ResultSet ris = cmd.executeQuery(query);
				
				while(ris.next()){
					
					if ((ris.getString("email").equals(nome)) && (ris.getString("pwd").equals(pass))){
						System.out.println("Accesso Riuscito");
						HttpSession session = request.getSession();
						session.setAttribute("email", nome);
						request.getRequestDispatcher("/index.jsp").forward(request, response);
						return;
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.print("Accesso non riuscito");	*/
	}
	
	
}
