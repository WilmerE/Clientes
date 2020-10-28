<%-- 
    Document   : login
    Created on : 26/10/2020, 11:28:44 PM
    Author     : WPelico
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection conn = null;
    String urlDatabase =  "jdbc:postgresql://localhost:5432/Clientes";
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(urlDatabase, "postgres", "root");
            System.out.println("Conexión Exitosa!");
        } catch (Exception e) {
            System.out.println("Ocurrio un error : "+e.getMessage());
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>