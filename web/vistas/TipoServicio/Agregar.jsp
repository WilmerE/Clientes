<%-- 
    Document   : Agregar
    Created on : 27/10/2020, 02:06:46 AM
    Author     : WPelico
--%>
<%@page import="controlador.ServicioAdd"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Servicio</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h1>Registrar Servicio</h1>
            <hr>
            <form action="/Clientes/ServicioAdd" method="post" class="form-control" style="width: 35rem; height: 30rem">
                <label>Nombre: </label>
                <input type="text" name="NomServ" class="form-control"/><br>
                <label>Código Servicio: </label>
                <input type="text" name="CodServ" class="form-control"/>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="../index.html">Cancelar</a>
            </form>
        </div>
    </body>
</html>
%>