<%-- 
    Document   : Agregar
    Created on : 27/10/2020, 02:06:46 AM
    Author     : WPelico
--%>
<%@page import="servlets.ClienteAdd"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Cliente</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <%@include file="/css/headlib.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>Registrar Cliente</h1>
            <hr>
            <form action="/Clientes/ClienteAdd" method="post" class="form-control" style="width: 35rem; min-height: 32rem">
                <label>Nombres: </label>
                <input type="text" name="nombres" placeholder="Nombres del cliente" class="form-control" required=""/><br>
                <label>Apellidos: </label>
                <input type="text" name="apellidos" placeholder="Apellidos del cliente" class="form-control" required=""/><br>
                <label>DPI: </label>
                <input type="text" name="dpi" placeholder="DPI del cleinte" class="form-control" required=""/><br>
                <label>Teléfono: </label>
                <input type="text" name="telefono" placeholder="Teléfono del cliente" class="form-control" required=""/><br>
                <label>Dirección: </label>
                <input type="text" name="direccion" placeholder="Direccion del cliente" class="form-control" required=""/><br>
                <a href="../index.html">Cancelar</a>
                <input type="submit" value="Guardar" name="guardar" class="btn btn-primary btn-lg"/>
            </form>
        </div>
        <%@include file="/js/scripts.jsp" %>
    </body>
</html>