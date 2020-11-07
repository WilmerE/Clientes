<%-- 
    Document   : ServicioSelect
    Created on : 5/11/2020, 09:23:56 PM
    Author     : WPelico
--%>
<%@page import="java.sql.*"%>
<%@page import="lib.ServicioConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="conexiontent-Type" conexiontent="text/html; charset=UTF-8">
        <title>Seleccionar Servicio</title>
        <%@include file="/css/headlib.jsp" %>
        <link href="../../css/inicio.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%! ServicioConsultas conexion = new ServicioConsultas();%>
        <%  ResultSet Servicios = conexion.SelectServicio(); %>
        <main>
            <div class="caja">
                <form action="/Clientes/TurnoCreate" method="post">
                    <img src="../../img/electrocomp-mono.png" width="60%" class="logo">
                    <div class="caja-header">
                        <h1>¡BIENVENIDO!</h1>
                        <h4>Seleccione el servicio que desea.</h4>
                    </div>
                    <input type="hidden" name="tipo-atecion" value="servicio">
                    <ul>
                        <% while (Servicios.next()) { %>
                        <li> <input type="submit" name="servicio_id" class="btn" value="<%= Servicios.getInt("id") %>"><%= Servicios.getString("nombre") %> </li>
                        <% } %>
                    </ul>
                    <% Servicios.close(); %>
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