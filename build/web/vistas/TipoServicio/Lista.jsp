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
         <div class="container"> 
            <div> 
                <h1 style="float: left;">Servicios</h1>
                <div style="float: right; margin-top: 1rem;">
                    <a href="Agregar.jsp" class="btn btn-primary btn-sm">
                        Agregar registro <i class="fas fa-plus"></i>
                    </a>
                </div>
            </div>
             <br><br><hr>
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive"> 
            <table id="data" class="table table-striped table-bordered" style="width:100%">
                <thead class="thead-dark">
                    <tr>
                        <th> Nombre</th>
                        <th> Código de Servicio</th>
                        <th colspan="2"><b>Opciones</b></th>
                    </tr>   
                </thead>
                <tbody>
                <% while (Servicios.next()) { %>
                <tr>
                    <td> <%= Servicios.getString("nombre") %> </td>
                    <td> <%= Servicios.getString("codigo") %> </td>
                    <td align="center">
                        <a href="Editar.jsp?cod=<%= Servicios.getInt("cod")%>" class="btn btn-primary btn-sm">
                            <i class="fas fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td align="center">
                        <a href="Eliminar.jsp?cod=<%= Servicios.getInt("cod")%>" class="btn btn-danger btn-sm eliminar" data-title="<%= Servicios.getString("nombre")%>">
                            <i class="fas fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <% } %>
                <% Servicios.close(); %>
                </tbody>
            </table>
            </div>
            </div>
            </div>
        </div>
    </main>
    <%@include file="/js/scripts.jsp" %>
</body>
<% if(request.getParameter("succes") != null){ %>
    <script>
        $( document ).ready(function() {
            swal("Sistema", "Consulta exitosa!", "success");
        });
    </script>
<% } %>
<script>
    $( document ).ready(function() {
        $('a.eliminar').confirm({
            content: "Está seguro de eliminarlo?",
        });
        $('a.eliminar').confirm({
            buttons: {
                info: {
                    btnClass: 'btn-info',
                    action: function(){
                        location.href = this.$target.attr('href');
                    }
                },
            }
        });
    });
</script>
</html>