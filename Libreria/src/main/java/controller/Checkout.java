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

import model.CartItem;
import dao.CartDAO;
import dao.OrderItemDAO;
import dao.OrdersDAO;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(
		  name = "Checkout", value = "/Checkout")
public class Checkout extends HttpServlet{

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
		List<CartItem> cart;
		HttpSession session = request.getSession();
		String emailSession = session.getAttribute("email").toString();
		DateTimeFormatter form = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		LocalDate dataOdierna = LocalDate.now();
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connessione = DriverManager.getConnection(db_url,user_db,pass_db);
			
			CartDAO cartDAO = new CartDAO(connessione);
			cart = cartDAO.getAllCartsByCustomer(emailSession);
			
			if(cart.isEmpty()) {
				request.setAttribute("ringiaziamenti", "");
				request.getRequestDispatcher("/carrello.jsp").forward(request, response);
				return;
			}
			
			OrdersDAO orderDAO = new OrdersDAO(connessione);
			int lastID = orderDAO.getLastId();
			
			if(lastID >= 0) {
				orderDAO.createOrder(lastID +1, emailSession);
				OrderItemDAO OIDAO = new OrderItemDAO(connessione);
				
				for(CartItem c: cart) {
					OIDAO.createOrderItem(lastID +1, c.getIsbn(), c.getTitolo(), c.getPrezzo(), c.getCasaEditrice(), c.getQuantita(), dataOdierna.format(form));
					cartDAO.deleteCart(c.getIsbn(), emailSession);
				}
				
				
				request.setAttribute("ringiaziamenti", "Grazie per l'acquisto");
				request.getRequestDispatcher("/carrello.jsp").forward(request, response);
				return;
			}
			request.setAttribute("errorMessage", "Errore Database");
			request.getRequestDispatcher("/carrello.jsp").forward(request, response);
			
		//	else if(lastID < 0) da finire

			
		} catch(Exception e) {
			request.setAttribute("errorMessage", "Errore Database");
			request.getRequestDispatcher("/carrello.jsp").forward(request, response);
			e.printStackTrace();
		}
	}

	
}
