package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Products;

public class ProductsDAO {
    private Connection connection;

    public ProductsDAO(Connection connection) {
        this.connection = connection;
    }

    public void addProduct(Products product) throws SQLException {
        String query = "INSERT INTO Products (isbn, titolo, prezzo, casaEditrice, img) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, product.getIsbn());
        statement.setString(2, product.getTitolo());
        statement.setDouble(3, product.getPrezzo());
        statement.setString(4, product.getCasaEditrice());
        statement.setString(5, product.getImg());
        statement.executeUpdate();
        statement.close();
    }

    public Products getProductByIsbn(String isbn) throws SQLException {
        String query = "SELECT * FROM Products WHERE isbn = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, isbn);
        ResultSet resultSet = statement.executeQuery();

        Products product = null;
        if (resultSet.next()) {
            String titolo = resultSet.getString("titolo");
            Double prezzo = resultSet.getDouble("prezzo");
            String casaEditrice = resultSet.getString("casaEditrice");
            String img = resultSet.getString("img");

            product = new Products(isbn, titolo, prezzo, casaEditrice, img);
        }

        resultSet.close();
        statement.close();

        return product;
    }

    public List<Products> getAllProducts() throws SQLException {
        List<Products> products = new ArrayList<>();
        String query = "SELECT * FROM Products";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            String isbn = resultSet.getString("isbn");
            String titolo = resultSet.getString("titolo");
            Double prezzo = resultSet.getDouble("prezzo");
            String casaEditrice = resultSet.getString("casaEditrice");
            String img = resultSet.getString("img");

            Products product = new Products(isbn, titolo, prezzo, casaEditrice, img);
            products.add(product);
        }

        resultSet.close();
        statement.close();

        return products;
    }

    public void updateProduct(Products product) throws SQLException {
        String query = "UPDATE Products SET titolo = ?, prezzo = ?, casaEditrice = ? WHERE isbn = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, product.getTitolo());
        statement.setDouble(2, product.getPrezzo());
        statement.setString(3, product.getCasaEditrice());
        statement.setString(4, product.getIsbn());
        statement.executeUpdate();
        statement.close();
    }

    public void deleteProduct(String isbn) throws SQLException {
        String query = "DELETE FROM Products WHERE isbn = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, isbn);
        statement.executeUpdate();
        statement.close();
    }
}
