
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
        <title>Biodata</title>
    </head>
    <body style="background-image:url(tis.jpg)">
         <marquee direction ='right' scrollamount='5'><font color='orangered' size='15'>BIODATA MAHASISWA</font></marquee>
    <hr width=150% align=center size=5% color="orangered">
    <center>
        <%
            int nim = (Integer)session.getAttribute("nim");
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
        <a href="halamanUtama.jsp"/>Kembali ke halaman utama
        </center>
    </body>
</html>