package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderItemDAO;
import dao.OrdersDAO;
import model.OrderItem;
import model.Orders;

@WebServlet(
		  name = "UserOrdini", value = "/UserOrdini")
public class UserOrdini extends HttpServlet{

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
		HttpSession session = request.getSession();	
		String userSession = session.getAttribute("email").toString();
		
		if(userSession.equals("email1@gmail.com") || userSession.equals("email2@gmail.com")) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connessione = DriverManager.getConnection(db_url,user_db,pass_db);
				
				OrdersDAO ODAO = new OrdersDAO(connessione);
				List<Orders> ordini = ODAO.getAllOrdersByCustomer(request.getParameter("email").toString());
							
				OrderItemDAO OIDAO = new OrderItemDAO(connessione);
				HashMap<Integer, List<OrderItem>> mappa = new HashMap<>();
				for(Orders o:ordini) {
					mappa.put(o.getId(), OIDAO.getOrderItemsByOrderId(o.getId()));
				}
				request.setAttribute("HashMap", mappa);
				request.getRequestDispatcher("/admin_ordini_view.jsp").forward(request, resp);
				return;
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connessione = DriverManager.getConnection(db_url,user_db,pass_db);
			
			OrdersDAO ODAO = new OrdersDAO(connessione);
			List<Orders> ordini = ODAO.getAllOrdersByCustomer(userSession);
						
			OrderItemDAO OIDAO = new OrderItemDAO(connessione);
			HashMap<Integer, List<OrderItem>> mappa = new HashMap<>();
			for(Orders o:ordini) {
				mappa.put(o.getId(), OIDAO.getOrderItemsByOrderId(o.getId()));
			}
			request.setAttribute("HashMap", mappa);
			request.getRequestDispatcher("/user_ordini.jsp").forward(request, resp);
			return;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
