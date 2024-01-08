<%-- 
    Document   : Comentarios
    Created on : 4 ene 2024, 03:36:06
    Author     : pepe_
--%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.util.Stack"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="Comentarios.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <title>Comentarios</title>
    </head>
    <body>
        <div class="container mt-5">
            <a href="index.jsp">
                <button type="button" class="btn btn-primary">Regresar</button>
            </a>
            <%
                String idNoticia = request.getParameter("idNoticia");
                Conexion conn = new Conexion();
                Connection reg = conn.getConnection();

                Statement st = reg.createStatement();
                ResultSet rs = st.executeQuery("SELECT p.apePaterno, p.apeMaterno, p.nombre, n.nota, n.fechaNota, n.idNota FROM personal p INNER JOIN registro r ON p.idPersonal = r.idPersonal INNER JOIN nota n ON n.idRegistro = r.idRegistro WHERE n.idNota = " + idNoticia);

                while (rs.next()) {
            %>

            <div class="card">
                <h6>Creado por: <% out.print(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3));%></h6>
                <h6>El dia <%= rs.getString(5)%></h6>
                <h3><%= rs.getString(4)%></h3>
            </div>

            <%

                }
                rs = st.executeQuery("SELECT c.idComentario, c.fechaComentario, c.comentario, c.padreID, p.nombre,p.apePaterno,p.apeMaterno,r.esInterno "
                        + "FROM NotaComentario nc "
                        + "INNER JOIN comentario c ON nc.idComentario = c.idComentario "
                        + "INNER JOIN registro r ON r.idRegistro = c.idRegistro "
                        + "INNER JOIN personal p ON r.idPersonal = p.idPersonal "
                        + "WHERE nc.idNota = " + idNoticia + " "
                        + "ORDER BY c.idComentario");
                ControlComentario cc = new ControlComentario();
                while (rs.next()) {
                    cc.agregar(new Comentario(
                            Integer.parseInt(rs.getString(1)),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4) == null ? 0 : Integer.parseInt(rs.getString(4)),
                            rs.getString(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getString(8).equals("1")));
                }

                Stack<Comentario> pila = new Stack<>();
                for (int i = cc.getApoyo().getHijos().size() - 1; i >= 0; i--) {
                    pila.push(cc.getApoyo().getHijos().get(i));
                }
                while (!pila.isEmpty()) {
                    Comentario temp = pila.pop();
            %>
            <div class="card">
                <p>
                    <%=temp.esInterno()%>
                </p>
                <h6>
                    <% out.println(temp.getNombre() + " "
                            + temp.getApePaterno() + " "
                            + temp.getApeMaterno() + " "
                            + temp.getFechaComentario());%>
                </h6>
                <h5><%= temp.getComentario()%></h5>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="Respuesta.jsp?idNoticia=<%=idNoticia%>&idPadre=<%=temp.getIdComentario()%>" >
                        <button class="btn btn-primary me-md-2" type="button" >
                            Responder
                        </button>
                    </a>

                </div>
            </div>

            <%
                    for (int i = temp.getHijos().size() - 1; i >= 0; i--) {
                        pila.push(temp.getHijos().get(i));
                    }
                }

            %>

            <div>
                <a href="Respuesta.jsp?idNoticia=<%=idNoticia%>" >
                    <button class="btn btn-primary me-md-2" type="button" >
                        Responder
                    </button>
                </a>

            </div>
        </div>
    </body>
</html>
