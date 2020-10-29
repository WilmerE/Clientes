<%-- 
    Document   : Lista
    Created on : 28/10/2020, 06:00:23 PM
    Author     : WPelico
--%>

<%@page import="java.sql.*"%>
<%@page import="lib.ServicioConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="conexiontent-Type" conexiontent="text/html; charset=UTF-8">
        <title>Servicios</title>
        <%@include file="/css/headlib.jsp" %>
    </head>
    <body>
        <%! ServicioConsultas conexion = new ServicioConsultas();%>
        <%  ResultSet Servicios = conexion.SelectServicio(); %>
        <main>
         <div class="conexiontainer">
            <div> 
                <h1>Servicios</h1>
            </div>
            <hr>
            <table class="table table-bordered table-hover table-sm" >
                <thead class="thead-dark">
                    <tr>
                        <td> Nombre</td>
                        <td> Código de Servicio</td>
                        <td colspan="2" ><b>Opciones</b></td>
                    </tr>   
                </thead>
                <% while (Servicios.next()) { %>
                <tr>
                    <td> <%= Servicios.getString("nombre") %> </td>
                    <td> <%= Servicios.getString("codigo") %> </td>
                    <td>
                        <a href="Editar.jsp?cod=<%= Servicios.getInt("cod")%>" class="btn btn-primary btn-sm">
                            <i class="fas fa-pencil-alt"></i>
                        </a>
                        <a href="/Clientes/vistas/TipoServicio/Agregar.jsp" class="btn btn-primary btn-sm">
                            <i class="fas fa-plus"></i>
                        </a>
                    </td>
                </tr>
                <% } %>
                <% Servicios.close(); %>
            </table>
        </div>
    </main>
    <%@include file="/js/scripts.jsp" %>
</body>
<% if(request.getParameter("succes") != null){ %>
    <script>
        $( document ).ready(function() {
            swal("Sistema", "Servicio Agregado Correctamente!", "success");
        });
    </script>
<% } %>
</html>