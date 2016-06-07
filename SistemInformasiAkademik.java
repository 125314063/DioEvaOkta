package bean;

import connection.DataBaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SistemInformasiAkademik {

    private String password;
    private String mata_kuliah;
    private int nim;

    public SistemInformasiAkademik() {
        this.nim = nim;
        this.password = password;
    }

    public String login() throws SQLException {
        String pw = "";
        DataBaseConnection dbConn = new DataBaseConnection();
        dbConn.getConnection();
        Connection conn = dbConn.connection;
        Statement statement = conn.createStatement();
        String query = "select * from mahasiswa where nim = " + getNim();

        ResultSet rs = statement.executeQuery(query);
        while (rs.next()) {
            pw = rs.getString("password");
        }
        conn.close();
        return pw;
    }
   
    public String biodata(String kolom) throws SQLException {
        DataBaseConnection dbConn = new DataBaseConnection();
        dbConn.getConnection();
        Connection conn = dbConn.connection;
        Statement statement = conn.createStatement();
        String query = "select * from mahasiswa where nim = " + getNim();

        ResultSet rs = statement.executeQuery(query);
        String pw = "";
        while (rs.next()) {
            pw = rs.getString(kolom);
        }
        conn.close();
        return pw;
    }

    public ResultSet mataKuliah() throws SQLException {
        DataBaseConnection dbConn = new DataBaseConnection();
        dbConn.getConnection();
        Connection conn = dbConn.connection;
        Statement statement = conn.createStatement();
        String query = "select * from mata_kuliah";

        ResultSet rs = statement.executeQuery(query);
        return rs;
    }

    public ResultSet info(String kolom) throws SQLException {
        DataBaseConnection dbConn = new DataBaseConnection();
        dbConn.getConnection();
        Connection conn = dbConn.connection;
        Statement statement = conn.createStatement();
        String query = "select j.kode_mata_kuliah, m.mata_kuliah, m.sks, j.kelas, "
                + "j.dosen, j.ruang, j.hari, j.jam, m.tarif from jadwal j, mata_kuliah m "
                + "where j.kode_mata_kuliah = m.kode_mata_kuliah and "
                + "j.kode_mata_kuliah = '" + kolom + "'";

        ResultSet rs = statement.executeQuery(query);
        return rs;
    }

    public ResultSet jadwal() throws SQLException {
        DataBaseConnection dbConn = new DataBaseConnection();
        dbConn.getConnection();
        Connection conn = dbConn.connection;
        Statement statement = conn.createStatement();
        String query = "select * from jadwal where kode_mata_kuliah = '"
                + getMata_kuliah() + "'";

        ResultSet rs = statement.executeQuery(query);
        return rs;
    }

    public ResultSet hapus(String kode) throws SQLException {
        DataBaseConnection dbConn = new DataBaseConnection();
        dbConn.getConnection();
        Connection conn = dbConn.connection;
        Statement statement = conn.createStatement();
        String query = "delete from krs where kode_mata_kuliah = '" + kode + "'";

        ResultSet rs = statement.executeQuery(query);
        return rs;
    }

    public ResultSet insert(int nim, String kode, String kelas) throws SQLException {
        DataBaseConnection dbConn = new DataBaseConnection();
        dbConn.getConnection();
        Connection conn = dbConn.connection;
        Statement statement = conn.createStatement();
        String query = "insert into krs (nim, kode_mata_kuliah, kelas)"
                + "  values (" + nim + ", '" + kode + "', '" + kelas + "')";

        ResultSet rs = statement.executeQuery(query);
        return rs;
    }

    public ResultSet tampilKRS(int nim) throws SQLException {
        DataBaseConnection dbConn = new DataBaseConnection();
        dbConn.getConnection();
        Connection conn = dbConn.connection;
        Statement statement = conn.createStatement();
        String query = "select k.nim, k.kode_mata_kuliah, m.mata_kuliah, m.sks, m.tarif,"
                + "j.kelas, j.dosen, j.hari, j.jam, j.ruang from krs k, jadwal j, "
                + "mata_kuliah m where k.nim = " + nim + " and "
                + "k.kode_mata_kuliah = m.kode_mata_kuliah "
                + "and k.kode_mata_kuliah = j.kode_mata_kuliah and k.kelas = j.kelas";

        ResultSet rs = statement.executeQuery(query);
        return rs;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMata_kuliah() {
        return mata_kuliah;
    }

    public void setMata_kuliah(String mata_kuliah) {
        this.mata_kuliah = mata_kuliah;
    }

    public int getNim() {
        return nim;
    }

    public void setNim(int nim) {
        this.nim = nim;
    }
}
