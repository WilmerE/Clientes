<%-- 
    Document   : Agregar
    Created on : 27/10/2020, 02:06:46 AM
    Author     : WPelico
--%>
<%@page import="java.sql.*"%>
<%@page import="java.awt.TrayIcon.MessageType"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <form action="" method="post" class="form-control" style="width: 35rem; height: 30rem">
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
<%
    Connection conn;
    String NombreServicio, CodServicio;
    String urlDatabase =  "jdbc:postgresql://localhost:5432/Clientes";
    PreparedStatement ps;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(urlDatabase, "postgres", "root");
            NombreServicio=request.getParameter("NomServ");
            CodServicio=request.getParameter("CodServ");
            if(NombreServicio!=null && CodServicio!=null){
                ps=conn.prepareStatement("insert into tipo_servicio (nombre, cod_servicio) values('"+NombreServicio+"','"+CodServicio+"')");
                ps.executeUpdate();
                JOptionPane.showMessageDialog(null, "Se Agrego Correctamete");
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            System.out.println("Ocurrio un error : "+e.getMessage());
        }  
%>