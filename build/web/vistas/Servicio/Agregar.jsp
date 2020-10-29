<%-- 
    Document   : Agregar
    Created on : 27/10/2020, 02:06:46 AM
    Author     : WPelico
--%>
<%@page import="servlets.ServicioAdd"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Servicio</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <%@include file="/css/headlib.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>Registrar Servicio</h1>
            <hr>
            <form action="/Clientes/ServicioAdd" method="post" class="form-control" style="width: 35rem; height: 30rem">
                <label>Nombre: </label>
                <input type="text" name="NomServ" placeholder="Nombre del servicio" class="form-control"/><br>
                <label>Código: </label>
                <input type="text" name="CodServ" placeholder="Código del servicio" class="form-control"/><br>
                <a href="../index.html">Cancelar</a>
                <input type="submit" value="Guardar" name="guardar" class="btn btn-primary btn-lg"/>
            </form>
        </div>
        <%@include file="/js/scripts.jsp" %>
    </body>
</html>