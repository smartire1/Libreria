package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.OrderItem;

public class OrderItemDAO {
    private Connection connection;

    public OrderItemDAO(Connection connection) {
        this.connection = connection;
    }

    public void createOrderItem(int orderId, String isbn, String titolo, Double prezzo, String casaEditrice, int quantity, String data) throws SQLException {
        String query = "INSERT INTO OrderItems (OrderID, isbn, titolo, prezzo, casaEditrice, Quantity, dataOrdine) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, orderId);
            statement.setString(2, isbn);
            statement.setString(3, titolo);
            statement.setDouble(4, prezzo);
            statement.setString(5, casaEditrice);
            statement.setInt(6, quantity);
            statement.setString(7, data);
            statement.executeUpdate();
        }
    }

    public List<OrderItem> getOrderItemsByOrderId(int orderId) throws SQLException {
        List<OrderItem> orderItems = new ArrayList<>();
        String query = "SELECT * FROM OrderItems WHERE OrderID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, orderId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int orderItemId = resultSet.getInt("OrderItemID");
                    String isbn = resultSet.getString("ISBN");
                    int quantity = resultSet.getInt("Quantity");
                    String titolo = resultSet.getString("titolo");
                    Double prezzo = resultSet.getDouble("prezzo");
                    String casaEditrice = resultSet.getString("casaEditrice");
                    String data = resultSet.getString("dataOrdine");
                    OrderItem orderItem = new OrderItem(orderItemId, orderId, isbn, titolo, prezzo, casaEditrice, quantity, data);
                    orderItems.add(orderItem);
                }
            }
        }
        return orderItems;
    }
    
    public List<OrderItem> getAllOrderItems() throws SQLException {
        List<OrderItem> orderItems = new ArrayList<>();
        String query = "SELECT * FROM OrderItems";
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int orderItemId = resultSet.getInt("OrderItemID");
                int orderId = resultSet.getInt("OrderID");
                String isbn = resultSet.getString("ISBN");
                int quantity = resultSet.getInt("Quantity");
                String titolo = resultSet.getString("titolo");
                Double prezzo = resultSet.getDouble("prezzo");
                String casaEditrice = resultSet.getString("casaEditrice");
                String data = resultSet.getString("dataOrdine");
                OrderItem orderItem = new OrderItem(orderItemId, orderId, isbn, titolo, prezzo, casaEditrice, quantity, data);
                orderItems.add(orderItem);
            }
        }
        return orderItems;
    }


    public void updateOrderItem(int orderItemId, int quantity) throws SQLException {
        String query = "UPDATE OrderItems SET Quantity = ? WHERE OrderItemID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, quantity);
            statement.setInt(2, orderItemId);
            statement.executeUpdate();
        }
    }

    public void deleteOrderItem(int orderItemId) throws SQLException {
        String query = "DELETE FROM OrderItems WHERE OrderItemID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, orderItemId);
            statement.executeUpdate();
        }
    }
}

