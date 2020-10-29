<%-- 
    Document   : Editar
    Created on : 28/10/2020, 01:55:27 PM
    Author     : WPelico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                ID:
                <input type="text" readonly="" class="form-control" />
                 Nombres:
                <input type="text" name="txtNom" class="form-control" value=""/><br>
              
                DNI:
                <input type="text" name="txtDNI" class="form-control" value=""/>
                 <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                
                <a href="index.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
