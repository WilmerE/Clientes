<%-- 
    Document   : Lista
    Created on : 3/11/2020, 03:34:05 AM
    Author     : WPelico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Turnos</title>
        <%@include file="/css/headlib.jsp" %>
        <link href="../../css/turnosview.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="header">
            <img src="../../img/electrocomp-mono.png" width="30%" class="logo">
        </div>
        <section>
            <div class="turnos">
                <h1>Turnos en cola: </h1>
                <ul class="list-group">
                    
                </ul>
            </div>
        </section>
        <aside class="contenedor">
            <div class="widget">
                <div class="fecha">
                    <p id="diaSemana" class="diaSemana"></p>
                    <p id="dia" class="dia"></p>
                    <p>de</p>
                    <p id="mes" class="mes"></p>
                    <p>del</p>
                    <p id="anio" class="anio"></p>
                </div>
                <div class="reloj">
                    <p id="horas" class="horas"></p>
                    <p>:</p>
                    <p id="minutos" class="minutos"></p>
                    <p>:</p>
                    <div class="cajaSegundos">
                        <p id="ampm" class="ampm"></p>
                        <p id="segundos" class="segundos"></p>
                    </div>
                </div>
            </div>
        </aside>
        <footer>
            <marquee>
                <h1>Por favor verifica siempre tu número de turno. Recuerda que también contamos con lo mejores planes de pago.</h1>
            </marquee>
        </footer>
        <%@include file="/js/scripts.jsp" %>
        <script src="../../js/reloj.js"></script>
        <script>
        $( document ).ready(function() {
            var turnos = [];
            
            window.setInterval(function(){
                llamar_turno();
            }, 10000);
                
            function llamar_turno(){
                $.ajax(
                        '/Clientes/TurnoView'
                ).done(function(data) {
                    data = data.replace(",]", "]");
                    data = JSON.parse(data).turnos;
                    
                    $(".list-group").empty();
                    $.each(data, function( index, value ) {
                        let row = "<li class=\"list-group-item\">" + value.atencion +" --- Turno: <b>" + value.turno +"</b></li>";
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
    </body>
</html>
