package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ShowCatalogo", value = "/ShowCatalogo")
public class ShowCatalogo extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        final String db_url = "jdbc:mysql://localhost:3306/Librerie";
        final String user_db = "root";
        final String pass_db = "admin";
        Connection connessione = null;
        HttpSession session = request.getSession();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connessione = DriverManager.getConnection(db_url, user_db, pass_db);

            String isbn = request.getParameter("Fisbn");
            String casaEditrice = request.getParameter("FcasaEditrice");
            Double prezzo = null;

            if (request.getParameter("Fmaxprice") != null && !request.getParameter("Fmaxprice").isEmpty()) {
                prezzo = Double.parseDouble(request.getParameter("Fmaxprice"));
            }

            String query = "SELECT * FROM Products WHERE 1=1";
            if (isbn != null && !isbn.isEmpty()) {
                query += " AND isbn = ?";
            }
            if (casaEditrice != null && !casaEditrice.isEmpty()) {
                query += " AND casaEditrice = ?";
            }
            if (prezzo != null) {
                query += " AND prezzo <= ?";
            }

            PreparedStatement pstmt = connessione.prepareStatement(query);
            int parameterIndex = 1;

            if (isbn != null && !isbn.isEmpty()) {
                pstmt.setString(parameterIndex++, isbn);
            }
            if (casaEditrice != null && !casaEditrice.isEmpty()) {
                pstmt.setString(parameterIndex++, casaEditrice);
            }
            if (prezzo != null) {
                pstmt.setDouble(parameterIndex, prezzo);
            }

            ResultSet res = pstmt.executeQuery();
            request.setAttribute("show", res);
            request.setAttribute("Fisbn", isbn);
            request.setAttribute("FcasaEditrice", casaEditrice);
            request.setAttribute("Fmaxprice", prezzo);

            if(null != session.getAttribute("admin")) 
            	request.getRequestDispatcher("/admin_dashboard/admin_prodotti.jsp").forward(request, response);
            else 
            	request.getRequestDispatcher("/catalogo.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connessione != null) {
                    connessione.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
