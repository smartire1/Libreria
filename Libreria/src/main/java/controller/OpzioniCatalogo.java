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
import dao.ProductsDAO;
import model.CartItem;
import model.Products;
import dao.CartDAO;

@WebServlet(
		  name = "OpzioniCatalogo", value = "/OpzioniCatalogo")
public class OpzioniCatalogo extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		final String db_url = "jdbc:mysql://localhost:3306/Librerie";
		final String user_db = "root";
		final String pass_db = "admin";
		Connection connessione;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connessione = DriverManager.getConnection(db_url,user_db,pass_db);
			String ButtonName = request.getParameter("action");
			String isbn = request.getParameter("isbn");
			
			if(ButtonName.compareTo("delete") == 0) {
				ProductsDAO PDAO = new ProductsDAO(connessione);
				CartDAO CDAO = new CartDAO(connessione);
				CDAO.deleteCartIsbn(isbn);
				PDAO.deleteProduct(isbn);
				request.setAttribute("Success", "Prodotto eliminato dal catalogo");
				request.getRequestDispatcher("/admin_prodotti.jsp").forward(request, resp);
				return;
			}
			
			else if(ButtonName.compareTo("edit") == 0) {
				ProductsDAO PDAO = new ProductsDAO(connessione);
				CartDAO CDAO = new CartDAO(connessione);
				CDAO.updateCart(new CartItem(isbn, request.getParameter("titolo"), Double.parseDouble(request.getParameter("prezzo")), request.getParameter("casaEditrice"), "lol"));
				PDAO.updateProduct(new Products(request.getParameter("isbn"), request.getParameter("titolo"),Double.parseDouble(request.getParameter("prezzo")), request.getParameter("casaEditrice")));
				request.setAttribute("Success", "Prodotto aggiornato");
				request.getRequestDispatcher("/admin_prodotti.jsp").forward(request, resp);
				return;
			}
			
			else if(ButtonName.compareTo("insert") == 0) {
				if(request.getParameter("isbn").isEmpty() || request.getParameter("titolo").isEmpty()  || request.getParameter("prezzo").isEmpty()  || request.getParameter("casaEditrice").isEmpty() ) {
					request.setAttribute("ErrorMessage", "Inserisci tutti i campi");
					request.getRequestDispatcher("/admin_inserisci.jsp").forward(request, resp);
					return;
				}
				ProductsDAO PDAO = new ProductsDAO(connessione);
				List<Products> controllo = PDAO.getAllProducts();
				for(Products p: controllo) {
					if(p.getIsbn().equals(isbn)) {
						request.setAttribute("ErrorMessage", "isbn gia presente nel database");
						request.getRequestDispatcher("/admin_inserisci.jsp").forward(request, resp);
						return;
					}
				}
				PDAO.addProduct(new Products(isbn ,request.getParameter("titolo"),Double.parseDouble(request.getParameter("prezzo")),request.getParameter("casaEditrice")));
				request.setAttribute("Success", "Prodotto aggiunto");
				request.getRequestDispatcher("/admin_inserisci.jsp").forward(request, resp);
				return;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
