package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Fattura;

public class FatturaDAO {

    private Connection connection;

    public FatturaDAO(Connection connection) {
        this.connection = connection;
    }


    public void create(Fattura fattura) {
        String sql = "INSERT INTO Fattura (isbn, titolo, prezzo, quantita) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, fattura.getIsbn());
            statement.setString(2, fattura.getTitolo());
            statement.setString(3, fattura.getPrezzo());
            statement.setInt(4, fattura.getQuantita());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Fattura read(int id) {
        String sql = "SELECT * FROM Fattura WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Fattura fattura = new Fattura();
                fattura.setId(resultSet.getInt("id"));
                fattura.setIsbn(resultSet.getString("isbn"));
                fattura.setTitolo(resultSet.getString("titolo"));
                fattura.setPrezzo(resultSet.getString("prezzo"));
                fattura.setQuantita(resultSet.getInt("quantita"));
                return fattura;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void update(Fattura fattura) {
        String sql = "UPDATE Fattura SET isbn = ?, titolo = ?, prezzo = ?, quantita = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, fattura.getIsbn());
            statement.setString(2, fattura.getTitolo());
            statement.setString(3, fattura.getPrezzo());
            statement.setInt(4, fattura.getQuantita());
            statement.setInt(5, fattura.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM Fattura WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Fattura> getAll() {
        List<Fattura> fatture = new ArrayList<>();
        String sql = "SELECT * FROM Fattura";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Fattura fattura = new Fattura();
                fattura.setId(resultSet.getInt("id"));
                fattura.setIsbn(resultSet.getString("isbn"));
                fattura.setTitolo(resultSet.getString("titolo"));
                fattura.setPrezzo(resultSet.getString("prezzo"));
                fattura.setQuantita(resultSet.getInt("quantita"));
                fatture.add(fattura);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fatture;
    }
}

