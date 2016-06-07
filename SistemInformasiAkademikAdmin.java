/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import connection.DataBaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author MyWindows
 */
public class SistemInformasiAkademikAdmin {

    private String password;
    private int username;

    public SistemInformasiAkademikAdmin() {
        this.username = username;
        this.password = password;
    }

    public String login1() throws SQLException {
        String pw = "";
        DataBaseConnection dbConn = new DataBaseConnection();
        dbConn.getConnection();
        Connection conn = dbConn.connection;
        Statement statement = conn.createStatement();
        String query = "select * from admin where username = " + getUsername();

        ResultSet rs = statement.executeQuery(query);
        while (rs.next()) {
            pw = rs.getString("pass");
        }
        conn.close();
        return pw;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUsername() {
        return username;
    }

    public void setUsername(int username) {
        this.username = username;
    }
}
