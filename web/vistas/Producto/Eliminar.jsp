<%-- 
    Document   : Eliminar
    Created on : 28/10/2020, 01:54:31 PM
    Author     : WPelico
--%>

<%@ page import= "java.sql.*"%>
<%@page import="lib.ProductoConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Registro</title>
    </head>
    <body>
        <%! ProductoConsultas conexion = new ProductoConsultas();%>
        <%
            int producto_id = Integer.parseInt(request.getParameter("id"));
            conexion.DeleteServicio(producto_id);
            response.sendRedirect("Lista.jsp?succes=True");
        %>
    </body>
</html>
