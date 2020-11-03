<%-- 
    Document   : index
    Created on : 2/11/2020, 01:14:18 AM
    Author     : WPelico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Generador de Turnos</title>
        <%@include file="/css/headlib.jsp" %>
        <link href="css/inicio.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <main>
            <div class="caja">
                <form>
                <div class="caja-header">
                    <img src="img/electrocomp.jpg" width="150rem">
                    <h1>Bienvenido a ElectroComp</h1>
                    <h5>Por favor selesccione el tipo de atención que desea</h5>
                </div>
                <div class="caja-body">
                    <input type="checkbox" name="servicio" id="servicio" value="Servicio" class="btn">
                    <input type="checkbox" name="producto" id="producto" value="Producto" class="btn">
                </div>
                    <input type="submit" value="Confirmar">
                </form>
            </div>
        </main>
        <script>
            var header = document.getElementById("caja-body");
            var btns = header.getElementsByClassName("btn");
            for (var i = 0; i < btns.length; i++) {
                btns[i].addEventListener("click", function() {
                    var current = document.getElementsByClassName("active");
                    current[0].className = current[0].className.replace("active", "");
                    this.className += "active";
                });
            }
        </script>
    </body>
</html>
