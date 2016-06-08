
<%@page import="bean.SistemInformasiAkademik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="connection.DataBaseConnection"%>
<%@page import="java.io.IOException" %>
<%@page import="java.sql.*" %>

<jsp:useBean id="sia" scope="application" class="bean.SistemInformasiAkademik"/>
<!DOCTYPE html>
<%
    connection.DataBaseConnection conn = new connection.DataBaseConnection();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mata Kuliah yang Telah Diambil</title>
    </head>
    <body style="background-image:url(tis.jpg)">
         <marquee direction ='right' scrollamount='5'><font color='orangered' size='15'>DAFTAR MATA KULIAH YANG SUDAH DI AMBIL</font></marquee>
    <hr width=150% align=center size=5% color="orangered">
    <center>
        <%
            int nim = (Integer) session.getAttribute("nim");
            sia.setNim(nim);
        %>
        <table>
            <tr>
                <td>NIM</td>
                <td><% out.println(sia.biodata("nim")); %></td>
            </tr>
            <tr>
                <td>Nama Lengkap</td>
                <td><% out.println(sia.biodata("nama_depan") + " "
                            + sia.biodata("nama_tengah") + " "
                            + sia.biodata("nama_belakang")); %></td>
            </tr>
            <tr>
                <td>SKS Maksimal</td>
                <td><% out.println(sia.biodata("sks_maksimal")); %></td>
            </tr>
        </table>
        <br><br>
        <table>
            <tr bgcolor="pink">
                <th>Kode</th>
                <th>Mata Kuliah</th>
                <th>SKS</th>
                <th>Kelas</th>
                <th>Dosen</th>
                <th>Ruang</th>
                <th>Hari</th>
                <th>Jam</th>
                <th>Tarif</th>
                <th>Hapus</th>
            </tr>
            <%
                int i = 1;
                int total = 0;
                int sks = 0;
                ResultSet rs = sia.tampilKRS(nim);
                //ResultSet rs = sia.tampilKRS(nim);
                while (rs.next()) {
                    if (i % 2 == 0) {
            %>
            <tr bgcolor="#F8F8FF" align="center">

                <%
                } else {
                %>
            <tr bgcolor="#D8F0F8" align="center">
                <%
                    }
                %>
                <td><% out.println(rs.getString("kode_mata_kuliah")); %></td>
                <td><% out.println(rs.getString("mata_kuliah")); %></td>
                <td>
                    <%
                        out.println(rs.getString("sks"));
                        sks = (sks + Integer.parseInt(rs.getString("sks")));
                    %>
                </td>
                <td><% out.println(rs.getString("kelas")); %></td>
                <td><% out.println(rs.getString("dosen"));%></td>
                <td><% out.println(rs.getString("ruang")); %></td>
                <td><% out.println(rs.getString("hari")); %></td>
                <td><% out.println(rs.getString("jam"));%></td>
                <td>
                    <%
                        out.println(rs.getString("biaya"));
                        total = (total + Integer.parseInt(rs.getString("biaya")));
                    %>
                </td>
                <td>
                    <form action="Servlet5" method="get">
                        <input type="submit" value="hapus"/>
                        <input type="hidden" name="kode" value="<%=rs.getString("kode_mata_kuliah")%>"/>
                    </form>
                </td>
            </tr>
            <%
                    i++;
                }
            %>
        </table>
        <br><br>
        <table>
            <tr>
                <td>Total sks yang diambil </td>
                <td><%=sks%></td>
            </tr>
            <tr>
                <td>Total yang harus dibayar </td>
                <td><%=total%></td>
            </tr>
        </table>
        <br><br>
        <a href="halamanUtama.jsp"/>Kembali ke halaman utama  ||  
        <a href="krs.jsp"/>Kembali ke KRS
        </center>
    </body>
</html>
