import java.sql.*;

public class DBConnection {
    
    private static Connection conn;
    
    public static Connection getConnection() {
        String dbUrl = "jdbc:mysql://localhost:3306/test";
        String dbUser = "root";
        String dbPassword = "root";
        
        try {
            // Load the MySQL driver
            Class.forName("com.mysql.jdbc.Driver");
            // Create the database connection
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        return conn;
    }
    
    public static void closeConnection(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
