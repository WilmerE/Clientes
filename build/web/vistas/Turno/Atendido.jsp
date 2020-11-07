<%-- 
    Document   : Atendido
    Created on : 7/11/2020, 08:54:58 AM
    Author     : WPelico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lib.TurnoConsultas"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! TurnoConsultas conexion = new TurnoConsultas();%>
        <%
            int turno_id = Integer.parseInt(request.getParameter("id"));
            conexion.TurnoAtendido(turno_id);
            response.sendRedirect("VentanillaProducto.jsp?succes=True");
        %>
    </body>
</html>