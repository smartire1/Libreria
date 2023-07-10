package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Orders;

public class OrdersDAO {
    private Connection connection;

    public OrdersDAO(Connection connection) {
        this.connection = connection;
    }

    public void createOrder(int id, String customer) throws SQLException {
        String query = "INSERT INTO Orders (OrderID, Customer) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.setString(2, customer);
            statement.executeUpdate();
        }
    }
    
    public int getLastId() throws SQLException {
    	String query = "SELECT OrderID FROM Orders ORDER BY OrderID DESC LIMIT 1";
    	try(Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query)) {
    		if(resultSet.next()) return resultSet.getInt("OrderID");
    		else return 0;
    	} catch(Exception e) {
    		e.printStackTrace();
    		return -1;
    	}
    }

    public List<Orders> getAllOrders() throws SQLException {
        List<Orders> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders";
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int orderId = resultSet.getInt("OrderID");
                String customer = resultSet.getString("Customer");
                Orders order = new Orders(customer);
                order.setId(orderId);
                orders.add(order);
            }
        }
        return orders;
    }
    
    public List<Orders> getAllOrdersByCustomer(String customer) throws SQLException {
        List<Orders> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE Customer = ?";
        
        try (PreparedStatement statement = connection.prepareStatement(query)) {
        	statement.setString(1, customer);
        	ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int orderId = resultSet.getInt("OrderID");
                Orders order = new Orders(customer);
                order.setId(orderId);
                orders.add(order);
            }
        }
        return orders;
    }

    public void updateOrder(int orderId, String customer) throws SQLException {
        String query = "UPDATE Orders SET Customer = ? WHERE OrderID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, customer);
            statement.setInt(2, orderId);
            statement.executeUpdate();
        }
    }

    public void deleteOrder(int orderId) throws SQLException {
        String query = "DELETE FROM Orders WHERE OrderID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, orderId);
            statement.executeUpdate();
        }
    }
}

