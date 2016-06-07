package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {

    private String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
    private String user = "hr";
    private String password = "hr";
    public Connection connection = null;

    public DataBaseConnection() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection(jdbcURL, user, password);
            System.out.println("Koneksi Berhasil, lanjutkan");
        } catch (ClassNotFoundException ex) {
            System.out.println("message: " + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("message: " + ex.getMessage());
        }
    }

    public boolean isConnected() {
        return connection != null;
    }

    public boolean getClosed() {
        if (isConnected()) {
            try {
                connection.close();
                connection = null;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return true;
        } else {
            return false;
        }
    }

    public String getJdbcURL() {
        return jdbcURL;
    }

    public void setJdbcURL(String jdbcURL) {
        this.jdbcURL = jdbcURL;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConn(Connection connection) {
        this.connection = connection;
    }

    public static void main(String[] args) throws SQLException {
        DataBaseConnection conn = new DataBaseConnection();
    }
}
