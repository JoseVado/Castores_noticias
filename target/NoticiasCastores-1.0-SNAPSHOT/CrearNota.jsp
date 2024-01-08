<%--
    Document   : CrearNota
    Created on : 4 ene 2024, 03:44:44
    Author     : pepe_
--%>

<%@page import="Conexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <title>Crear notas</title>
    </head>
    <body>
        <div class="container mt-5">
            <a href="index.jsp">
                <button type="button" class="btn btn-primary">Regresar</button>
            </a>
            
            <h1>Escriba la nota</h1>
            <form action="CrearNota.jsp" method="post" >
                <div class="mb-3">
                    <input  class="form-control" id="nota" required="required" name="nota">
                </div>
                <button type="submit" class="btn btn-primary" name="subir">Subir nota</button>
            </form>
        </div>

        <%
            if (request.getParameter("subir") != null) {
                //Aqui como no se tiene una sección de iniciar seción
                //todo lo que se suba se subira a mi nombre
                String nota = request.getParameter("nota");
                try {
                    Conexion conn = new Conexion();
                    Connection reg = conn.getConnection();

                    Statement st = reg.createStatement();
                    st.executeUpdate("INSERT INTO Nota (fechaNota,nota,idRegistro) VALUES (CURRENT_DATE(), '" + nota + "',1)");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                };
            };
        %>
    </body>
</html>
