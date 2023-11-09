public class Main {
    public static void main(String[] args) {
        try (Connection connection = DatabaseConnector.getConnection()) {
            if (connection != null) {
                System.out.println("Database connection successful!");
            } else {
                System.err.println("Database connection failed.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}