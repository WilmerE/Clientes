<%-- 
    Document   : Agregar
    Created on : 27/10/2020, 02:06:46 AM
    Author     : WPelico
--%>
<%@page import="servlets.ProductoAdd"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Producto</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <%@include file="/css/headlib.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>Registrar Producto</h1>
            <hr>
            <form action="/Clientes/ProductoAdd" method="post" class="form-control" style="width: 35rem; height: 30rem">
                <label>Nombre: </label>
                <input type="text" name="nombre" placeholder="Nombre del producto" class="form-control" required=""/><br>
                <label>Código: </label>
                <input type="text" name="codigo" placeholder="Código del producto" class="form-control" required=""/><br>
                <a href="../index.html">Cancelar</a>
                <input type="submit" value="Guardar" name="guardar" class="btn btn-primary btn-lg"/>
            </form>
        </div>
        <%@include file="/js/scripts.jsp" %>
    </body>
</html>