<%-- 
    Document   : VentanillaServicio
    Created on : 7/11/2020, 09:43:09 AM
    Author     : WPelico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventanilla Servicio</title>
        <%@include file="/css/headlib.jsp" %>
        <link href="../../css/ventanillaproducto.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <aside>
            <div class="turnos">
                <h1>Turnos de productos: </h1>
                <ul class="list-group">
                    
                </ul>
            </div>
        </aside>
        <section>
        </section>
        <%@include file="/js/scripts.jsp" %>
        <script>
        $( document ).ready(function() {
            var turnos = [];
            
            window.setInterval(function(){
                llamar_turno();
            }, 10000);
                
            function llamar_turno(){
                $.ajax(
                        '/Clientes/TurnoViewServicio'
                ).done(function(data) {
                    data = data.replace(",]", "]");
                    data = JSON.parse(data).turnos;
                    
                    $(".list-group").empty();
                    $.each(data, function( index, value ) {
                        let row = "<li class=\"list-group-item\">" + value.servicio +" --- Turno: <b>" + value.turno +"</b><a href=\"Atendido.jsp?id="+value.id+"\" class=\"btn\">Atendido</a></li>";
                        $(".list-group").append(row);
                    });
                    turnos = data;
                }).fail(function(jqXHR) {
                    //Ver estado en consola
                    console.log(jqXHR.statusText);
                });
            }
        });
    </script>
    <% if(request.getParameter("succes") != null){ %>
        <script>
            $( document ).ready(function() {
                swal("Sistema", "Cliente fue Atendido!", "success");
            });
        </script>
    <% } %>
    </body>
</html>
