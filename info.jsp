
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
        <title>Info Mata Kuliah</title>
    </head>
    <body>
        <form action="Servlet4" method="get">
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
                    <th>Pilih</th>
                </tr>
                <%
                    int i = 1;
                    ResultSet rs = sia.info(request.getParameter("kode"));
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
                    <td><% out.println(rs.getString("kelas")); %></td>
                    <td><% out.println(rs.getString("dosen"));%></td>
                    <td><% out.println(rs.getString("ruang")); %></td>
                    <td><% out.println(rs.getString("hari")); %></td>
                    <td><% out.println(rs.getString("jam"));%></td>
                    <td>
                        <input type="radio" name="pilih" value="<%=rs.getString("kelas")%>"/>
                        <input type="hidden" name="kode" value="<%=rs.getString("kode_mata_kuliah")%>"/>
                    </td>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>
            <input type="submit" value="Tambah"/>
        </form>
        <br><br>
        <a href="halamanUtama.jsp"/>Kembali ke halaman utama  ||  
        <a href="krs.jsp"/>Kembali ke KRS
    </body>
</html>
