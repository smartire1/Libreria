package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dao.ProductsDAO;
import model.CartItem;
import model.Products;
import java.util.List;

@WebServlet(
		  name = "AggiungiCarrello", value = "/AggiungiCarrello")
public class AggiungiCarrello extends HttpServlet{

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
		Products toAdd;
		String isbn = request.getParameter("isbn");
		String email = request.getParameter("email");
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connessione = DriverManager.getConnection(db_url,user_db,pass_db);
			
			ProductsDAO productsDAO = new ProductsDAO(connessione);
			toAdd = productsDAO.getProductByIsbn(isbn);
			
			CartDAO CartDAO = new CartDAO(connessione);
			
			List<CartItem> control =  CartDAO.getAllCartsByCustomer(email);
			
			int quantita = 0;		
			for(CartItem c: control) {
				if(c.getIsbn().compareTo(isbn)==0) quantita = c.getQuantita();
			}
			if(quantita==0) {
				CartDAO.createCart(new CartItem(toAdd.getIsbn(), toAdd.getTitolo(), toAdd.getPrezzo(), toAdd.getCasaEditrice(), toAdd.getImg(), email, 1));
			}
			else  {
				CartDAO.updateCartQuantita(new CartItem(toAdd.getIsbn(), toAdd.getTitolo(), toAdd.getPrezzo(), toAdd.getCasaEditrice(), toAdd.getImg(), email, quantita+1));
			}
			
//			request.getRequestDispatcher("/catalogo.jsp").forward(request, response);	unused(gestione della richiesta asincrona)
			return;
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Errore1");
		}
		System.out.println("Errore");
	}
	 
}
