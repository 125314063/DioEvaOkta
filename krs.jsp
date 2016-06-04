<%-- 
    Document   : krs
    Created on : Jun 3, 2014, 4:43:52 PM
    Author     : Pace
--%>

<%@page import="org.apache.jasper.JasperException"%>
<%@page import="bean.SistemInformasiAkademik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="connection.DataBaseConnection"%>
<%@page import="java.io.IOException" %>
<%@page import="java.sql.*" %>

<jsp:useBean id="sia" scope="session" class="bean.SistemInformasiAkademik"/>
<!DOCTYPE html>
<%
    connection.DataBaseConnection conn = new connection.DataBaseConnection();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kartu Rencana Studi</title>
    </head>
   <body style="background-image:url(tis.jpg)">
         <marquee direction ='right' scrollamount='5'><font color='orangered' size='15'>KARTU RENCANA STUDI MAHASISWA</font></marquee>
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
        <table border>
            <tr>
                <th>Kode</th>
                <th>Mata Kuliah</th>
                <th></th>
            </tr>
            <%
                int i = 1;
                ResultSet rs = sia.mataKuliah();
                ResultSet jadwal = sia.jadwal();

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
                <td><% out.println(rs.getString("mata_kuliah"));%></td>
                <td>
                    <form action="Servlet3" method="get">
                        <input type="submit" name="info" value="Info"/>
                        <input type="hidden" name="kode" value="<%=rs.getString("kode_mata_kuliah")%>"/> 
                    </form>
                </td>
            </tr>

            <%
                    i++;
                }
            %>
        </table><br><br>
        <br><br>
        <a href="halamanUtama.jsp"/>Kembali ke halaman utama
         </center>
    </body>
</html>
