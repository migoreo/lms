import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginService {
    public static boolean authenticateUser(String admin, String pass) {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, admin);
            statement.setString(2, pass);

            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next(); // If a matching record is found, the login is valid
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // If an exception occurs or no matching record is found, the login is invalid
    }
}
