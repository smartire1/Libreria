package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Customer;

public class CustomerDAO {
    private Connection connection;

    public CustomerDAO(Connection connection) {
        this.connection = connection;
    }

    public void addCustomer(Customer customer) throws SQLException {
        String query = "INSERT INTO Customer (email, nome, cognome, pwd, adminRole) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, customer.getEmail());
        statement.setString(2, customer.getNome());
        statement.setString(3, customer.getCognome());
        statement.setString(4, customer.getPassword());
        statement.setBoolean(5, customer.getRole());
        statement.executeUpdate();
        statement.close();
    }

    public Customer getCustomerByEmail(String email) throws SQLException {
        String query = "SELECT * FROM Customer WHERE email = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, email);
        ResultSet resultSet = statement.executeQuery();

        Customer customer = null;
        if (resultSet.next()) {
            String nome = resultSet.getString("nome");
            String cognome = resultSet.getString("cognome");
            String password = resultSet.getString("pwd");
            boolean role = resultSet.getBoolean("adminRole");

            customer = new Customer(email, nome, cognome, password, role);
        }

        resultSet.close();
        statement.close();

        return customer;
    }

    public List<Customer> getAllCustomers() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        String query = "SELECT * FROM Customer";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            String email = resultSet.getString("email");
            String nome = resultSet.getString("nome");
            String cognome = resultSet.getString("cognome");
            String password = resultSet.getString("pwd");
            boolean role = resultSet.getBoolean("adminRole");

            Customer customer = new Customer(email, nome, cognome, password, role);
            customers.add(customer);
        }

        resultSet.close();
        statement.close();

        return customers;
    }

    public void updateCustomer(Customer customer) throws SQLException {
        String query = "UPDATE Customer SET nome = ?, cognome = ?, pwd = ? WHERE email = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, customer.getNome());
        statement.setString(2, customer.getCognome());
        statement.setString(3, customer.getPassword());
        statement.setString(4, customer.getEmail());
        statement.setBoolean(5, false);
        statement.executeUpdate();
        statement.close();
    }

    public void deleteCustomer(String email) throws SQLException {
        String query = "DELETE FROM Customer WHERE email = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, email);
        statement.executeUpdate();
        statement.close();
    }
}

