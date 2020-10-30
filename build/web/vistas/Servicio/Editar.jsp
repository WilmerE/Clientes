<%-- 
    Document   : Editar
    Created on : 28/10/2020, 01:55:27 PM
    Author     : WPelico
--%>

<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.sql.*"%>
<%@page import="lib.ServicioConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Registro</title>
        <%@include file="/css/headlib.jsp" %>
    </head>
    <body>
        <%! ServicioConsultas conexion = new ServicioConsultas();%>
        <div class="container">
            <h1>Editar Servicio</h1>
            <hr>
            <form action="/Clientes/ServicioUpdate" method="post" class="form-control" style="width: 35rem; height: 30rem">
                <%
                    int servicio_id = Integer.parseInt(request.getParameter("id"));
                    ResultSet rs;
                    Statement st;
                    try{ 
                        st = conexion.getConexion().createStatement();
                        rs = st.executeQuery("SELECT * FROM servicio WHERE id = "+ servicio_id);
                        rs.next();  
                %>
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                <label>Nuevo Nombre</label>
                <input type="text" name="NomServ" placeholder="Nombre del servicio" value="<%= rs.getString("nombre") %>" class="form-control" required=""/><br>
                <label>Nuevo Código</label>
                <input type="text" name="CodServ" placeholder="Código del servicio" value="<%= rs.getString("codigo") %>" class="form-control" required=""/><br>
                <a href="../index.html">Cancelar</a>
                <input  class="btn btn-primary btn-lg" type="submit" name="editar" value="Editar">
            </form>
        </div>
        <%
            }catch(Exception e){}
        %>
    <%@include file="/js/scripts.jsp" %>
    </body>
</html>
