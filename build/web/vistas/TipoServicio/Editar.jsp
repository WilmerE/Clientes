<%-- 
    Document   : Editar
    Created on : 28/10/2020, 01:55:27 PM
    Author     : WPelico
--%>

<%@page import="java.sql.*"%>
<%@page import="lib.ServicioConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Registro</title>
        <%@include file="/css/headlib.jsp" %>
    </head>
    <body>
        <%! ServicioConsultas conexion = new ServicioConsultas();%>
        <div class="container">
            <div class="container-contact100">
                <div class="wrap-contact100">
                    <form class="contact100-form validate-form">
                    <%
                        int servicio_id=Integer.parseInt(request.getParameter("cod"));
                        ResultSet rs=null;
                        Statement st=null;

                        try{ 
                            st = conexion.getConexion().createStatement();
                            rs = st.executeQuery("SELECT * FROM modulo WHERE id= "+ servicio_id +"");
                            rs.next();  
                    %>
                        <div class="wrap-input100 validate-input bg1 rs1-wrap-input100" data-validate="Campo obligatorio">
                            <span class="label-input100">Nombre del Servicio</span>
                            <input class="input100" type="text" name="nombre" placeholder="Nombre" value="<%= rs.getString("nombre") %>">
                        </div>

                        <div class="wrap-input100 validate-input bg1 rs1-wrap-input100" data-validate="Campo obligatorio">
                            <span class="label-input100">Codigo Servicio</span>
                            <input class="input100" type="text" name="descripcion" placeholder="Descripcion" value="<%= rs.getString("codigo") %>">
                        </div>
                        
                        <div class="container-contact100-form-btn">
                            <span class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></span>
                            <input class="contact100-form-btn" type="submit" name="editar" placeholder="Descripcion" value="EDITAR">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%
            }catch(Exception e){}
        %>
    </body>
</html>
