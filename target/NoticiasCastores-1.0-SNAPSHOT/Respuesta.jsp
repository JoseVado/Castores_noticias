<%-- 
    Document   : Respuesta
    Created on : 4 ene 2024, 12:54:59
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

        <title>Respuesta</title>
    </head>
    <body>
        <%
            String idNoticia = request.getParameter("idNoticia");
            String idPadre = request.getParameter("idPadre");
        %>

        <div class="container mt-5">
            <h1>Escriba la respuesta</h1>
            <form action="Respuesta.jsp" method="post" >
                <div class="mb-3">
                    <input  class="form-control" id="respuesta" required="required" name="respuesta">
                    <input type="hidden" id="idNoticia" name="idNoticia" value="<%=idNoticia%>" >
                    <input type="hidden" id="idPadre" name="idPadre" value="<%=idPadre%>" >
                </div>
                <button type="submit" class="btn btn-primary" name="subir">Responder</button>
            </form>
        </div>

        <%
            if (request.getParameter("subir") != null) {
                //Aqui como no se tiene una sección de iniciar seción
                //todo lo que se suba se subira a mi nombre
                String respuesta = request.getParameter("respuesta");
                idNoticia = request.getParameter("idNoticia");
                idPadre = request.getParameter("idPadre");
                try {
                    Conexion conn = new Conexion();
                    Connection reg = conn.getConnection();

                    Statement st = reg.createStatement();
                    st.executeUpdate("INSERT INTO comentario (fechaComentario,comentario,padreID,idRegistro) VALUES"
                            + " (NOW(), '" + respuesta + "'," + idPadre + ",1);");
                    st.executeUpdate("INSERT INTO NotaComentario(idNota,idComentario) VALUES (" + idNoticia + ",last_insert_id());");
                    request.getRequestDispatcher("Comentarios.jsp?idNoticia=" + idNoticia).forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                };
            };
        %>
    </body>
</html>
