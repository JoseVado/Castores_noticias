<%-- 
    Document   : index
    Created on : 3 ene 2024, 23:13:08
    Author     : pepe_
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <title>Inicio</title>
    </head>

    <div class="container mt-5">
        <a href="CrearNota.jsp">
            <button type="button" class="btn btn-primary">
                Nueva nota
            </button>
        </a>
    </div>



    <div class="container mt-2">
        <h2>Noticias</h2>

        <%
            Conexion conn = new Conexion();
            Connection reg = conn.getConnection();
            
            Statement st = reg.createStatement();
            ResultSet rs = st.executeQuery("SELECT p.apePaterno, p.apeMaterno, p.nombre, n.nota, n.fechaNota, n.idNota FROM personal p INNER JOIN registro r ON p.idPersonal = r.idPersonal INNER JOIN nota n ON n.idRegistro = r.idRegistro;");
            while (rs.next()) {
        %>

        <div class="card">
            <h6>Creado por: <% out.print(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3));%></h6>
            <h6>El dia <%= rs.getString(5)%></h6>
            <h3><%= rs.getString(4)%></h3>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <a href="Comentarios.jsp?idNoticia=<%= rs.getString(6)%>" >
                    <button class="btn btn-primary me-md-2" type="button" >
                        Comentarios
                    </button>
                </a>

            </div>
        </div>

        <%
            }
        %>

    </div>
</body>
</html>
