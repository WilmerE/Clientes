<%-- 
    Document   : Generar
    Created on : 2/11/2020, 07:56:27 PM
    Author     : WPelico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="servlets.TurnoTipo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Generador de Turnos</title>
        <%@include file="/css/headlib.jsp" %>
        <link href="../../css/inicio.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <main>
            <div class="caja">
                <form action="/Clientes/TurnoTipo" method="post">
                    <img src="../../img/electrocomp-mono.png" width="60%" class="logo">
                    <div class="caja-header">
                        <h1>¡BIENVENIDO!</h1>
                        <h4>Seleccione el tipo de atención que desea.</h4>
                    </div>
                    <div class="form-group">
                        <select class="form-control select" name="tipo-atecion" id="tipo-atecion">
                            <option selected>Click para seleccionar</option>
                            <option value="servicio">Servicio</option>
                            <option value="producto">Producto</option>
                        </select>
                    </div>
                    <input type="submit" class="btn" value="Siguiente">
                </form>
            </div>
        </main>
        <%@include file="/js/scripts.jsp" %>
        <% if(request.getParameter("succes") != null){ %>
            <script>
                $( document ).ready(function() {
                    swal("Sistema", "Turno Generado!", "success");
                });
            </script>
        <% } %>
        <% if(request.getParameter("error") != null){ %>
            <script>
                $( document ).ready(function() {
                    swal("Sistema", "Turno no generado", "error");
                });
            </script>
        <% } %>
    </body>
</html>
