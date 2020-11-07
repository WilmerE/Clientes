<%-- 
    Document   : ProductoSelect
    Created on : 5/11/2020, 09:30:45 PM
    Author     : WPelico
--%>

<%@page import="java.sql.*"%>
<%@page import="lib.ProductoConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="conexiontent-Type" conexiontent="text/html; charset=UTF-8">
        <title>Seleccionar Producto</title>
        <%@include file="/css/headlib.jsp" %>
        <link href="../../css/inicio.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%! ProductoConsultas conexion = new ProductoConsultas();%>
        <%  ResultSet Productos = conexion.SelectProduto(); %>
        <main>
            <div class="caja">
                <form action="/Clientes/TurnoCreate" method="post">
                    <img src="../../img/electrocomp-mono.png" width="60%" class="logo">
                    <div class="caja-header">
                        <h1>¡BIENVENIDO!</h1>
                        <h4>Seleccione el producto que desea.</h4>
                    </div>
                    <input type="hidden" name="tipo-atecion" value="producto">
                    <ul>
                        <% while (Productos.next()) { %>
                            <li> <input type="submit" name="producto_id" class="btn" value="<%= Productos.getInt("id") %>"> <%= Productos.getString("nombre") %> </li>
                        <% } %>
                    </ul>
                    <% Productos.close(); %>
                </form>
            </div>
        </main>
    <%@include file="/js/scripts.jsp" %>
    <% if(request.getParameter("error") != null){ %>
    <script>
        $( document ).ready(function() {
            swal("Sistema", "Turno no generado", "error");
        });
    </script>
    <% } %>
</body>
</html>
