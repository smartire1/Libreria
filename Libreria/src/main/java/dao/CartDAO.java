package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.CartItem;

import java.sql.*;

public class CartDAO {
    private Connection connection;

    public CartDAO(Connection connection) {
        this.connection = connection;
    }

    public void createCart(CartItem cart) throws SQLException {
        String query = "INSERT INTO Cart (isbn , titolo, prezzo, casaEditrice, img, Customer, Quantity) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
        	statement.setString(1, cart.getIsbn());
            statement.setString(2, cart.getTitolo());
            statement.setDouble(3, cart.getPrezzo());
            statement.setString(4, cart.getCasaEditrice());                        
            statement.setString(5, cart.getImg());
            statement.setString(6, cart.getCustomer());
            statement.setInt(7, cart.getQuantita());
            statement.executeUpdate();
        }
    }

    public CartItem getCartByCustomer(String customer) throws SQLException {
        String query = "SELECT * FROM Cart WHERE Customer = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, customer);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                	
                	String isbn = resultSet.getString("isbn");
                	String titolo = resultSet.getString("titolo");
                    Double prezzo = resultSet.getDouble("prezzo");
                    String casa = resultSet.getString("casaEditrice");
                    String img = resultSet.getString("img");
                    String Customer = resultSet.getString("Customer");
                    int quantita = resultSet.getInt("Quantity");
                    CartItem cart = new CartItem(isbn, titolo, prezzo, casa, img, Customer, quantita);
                    return cart;
                }
            }
        }
        return null;
    }

    public List<CartItem> getAllCarts() throws SQLException {
        List<CartItem> carts = new ArrayList<>();
        String query = "SELECT * FROM Cart";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
            	String isbn = resultSet.getString("isbn");
            	String titolo = resultSet.getString("titolo");
                Double prezzo = resultSet.getDouble("prezzo");
                String casa = resultSet.getString("casaEditrice");
                String img = resultSet.getString("img");
                String Customer = resultSet.getString("Customer");
                int quantita = resultSet.getInt("Quantity");
                CartItem cart = new CartItem(isbn, titolo, prezzo, casa, img,  Customer, quantita);
                carts.add(cart);
            }
        }
        return carts;
    }
    
    public List<CartItem> getAllCartsByCustomer(String customer) throws SQLException {
        List<CartItem> carts = new ArrayList<>();
        String query = "SELECT * FROM Cart where Customer = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
        	 statement.setString(1, customer);
        	 try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	            	String isbn = resultSet.getString("isbn");
	            	String titolo = resultSet.getString("titolo");
	                Double prezzo = resultSet.getDouble("prezzo");
	                String casa = resultSet.getString("casaEditrice");
	                String img = resultSet.getString("img");
	                String Customer = resultSet.getString("Customer");
	                int quantita = resultSet.getInt("Quantity");
	                CartItem cart = new CartItem(isbn, titolo, prezzo, casa, img, Customer, quantita);
	                carts.add(cart);
	            }
        	 }
        }
        return carts;
    }

    public void updateCart(CartItem cart) throws SQLException {
        String query = "UPDATE Cart SET isbn = ?, titolo = ?, prezzo = ?, casaEditrice = ?, Quantity = ? WHERE Customer = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
        	statement.setString(1, cart.getIsbn());
            statement.setString(2, cart.getTitolo());
            statement.setDouble(3, cart.getPrezzo());
            statement.setString(4, cart.getCasaEditrice());
            statement.setInt(5, cart.getQuantita());
            statement.setString(6, cart.getCustomer());
            statement.executeUpdate();
        }
    }
    
    public void updateCartQuantita(CartItem cart) throws SQLException {
        String query = "UPDATE Cart SET Quantity = ? WHERE Customer = ? AND isbn = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
        	statement.setInt(1, cart.getQuantita());
        	statement.setString(2, cart.getCustomer());
        	statement.setString(3, cart.getIsbn());
            statement.executeUpdate();
        }
    }
    
    public void updateCartIsbn(CartItem cart) throws SQLException {
        String query = "UPDATE Cart SET titolo = ?, prezzo = ?, casaEditrice = ? WHERE isbn = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
        	statement.setString(4, cart.getIsbn());
            statement.setString(1, cart.getTitolo());
            statement.setDouble(2, cart.getPrezzo());
            statement.setString(3, cart.getCasaEditrice());
            statement.executeUpdate();
        }
    }

    public void deleteCart(String isbn, String email) throws SQLException {
        String query = "DELETE FROM Cart WHERE isbn = ? AND Customer = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, isbn);
            statement.setString(2, email);
            statement.executeUpdate();
        }
    }
    
    public void deleteCartIsbn(String isbn) throws SQLException {
    	String query = "DELETE FROM Cart WHERE isbn = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, isbn);
            statement.executeUpdate();
        }
    }
}


