<%-- 
    Document   : Error
    Created on : 26/02/2016, 05:51:10 AM
    Author     : sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//Declaramos variables
String mensaje;    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de error</title>
    </head>
    <body>
        <h1>Se encontror un error mientras se ejecutaba la acción</h1>
        <h2>Datos de la operación: </h2>
        <%
        mensaje=request.getParameter("mensaje");
        out.print(mensaje);
        %>
    </body>
</html>
