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
<%@page import="lib.ClienteConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Registro</title>
        <%@include file="/css/headlib.jsp" %>
    </head>
    <body>
        <%! ClienteConsultas conexion = new ClienteConsultas();%>
        <div class="container">
            <h1>Editar Cliente</h1>
            <hr>
            <form action="/Clientes/ClienteUpdate" method="post" class="form-control" style="width: 35rem; min-height: 32rem">
                <%
                    int cliente_id = Integer.parseInt(request.getParameter("id"));
                    ResultSet rs;
                    Statement st;
                    try{ 
                        st = conexion.getConexion().createStatement();
                        rs = st.executeQuery("SELECT * FROM `cliente` WHERE id = "+ cliente_id);
                        rs.next();  
                %>
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                <div class="form-group">
                    <label>Editar Nombres: </label>
                    <input type="text" name="nombres" placeholder="Nombres del cliente"  value="<%= rs.getString("nombres") %>" class="form-control" required=""/><br>
                </div>
                <div class="form-group">
                    <label>Editar Apellidos: </label>
                    <input type="text" name="apellidos" placeholder="Apellidos del cliente" value="<%= rs.getString("apellidos") %>" class="form-control" required=""/><br>
                </div>
                <div class="form-group">
                    <label>Editar DPI: </label>
                    <input type="text" name="dpi" placeholder="DPI del clinte" value="<%= rs.getString("dpi") %>" class="form-control" required=""/><br>
                </div>
                <div class="form-group">
                    <label>Editar Teléfono: </label>
                    <input type="text" name="telefono" placeholder="Teléfono del cliente" value="<%= rs.getString("telefono") %>" class="form-control" required=""/><br>
                </div>
                <div class="form-group">
                    <label>Editar Dirección: </label>
                    <input type="text" name="direccion" placeholder="Direccion del cliente" value="<%= rs.getString("direccion") %>" class="form-control" required=""/></br>
                </div>
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
