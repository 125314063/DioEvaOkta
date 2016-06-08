
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
        <title>Mata Kuliah</title>
    </head>
    <body style="background-image:url(tis.jpg)">
         <marquee direction ='right' scrollamount='5'><font color='orangered' size='15'>DAFTAR MATA KULIAH</font></marquee>
    <hr width=150% align=center size=5% color="orangered">
    <center>
        <%
            int nim = (Integer) session.getAttribute("nim");
        %>
        <table border>
            <center>
            <tr>
                <th>Kode</th>
                <th>Mata Kuliah</th>
                <th>SKS</th>
                <th>Tarif</th>
            </tr>
            <%
                int i = 1;
                ResultSet rs = sia.mataKuliah();
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
                <td><% out.println(rs.getString("sks")); %></td>
                <td><% out.println(rs.getString("tarif")); %></td>
            </tr>
            <%
                    i++;
                }
            %>
            </center>  
        </table>
        <br><br>
        <a href="halamanUtama.jsp"/>Kembali ke halaman utama
        </center>
    </body>
</html>
