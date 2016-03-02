<%-- 
    Document   : ConsultarExpediente
    Created on : 26/02/2016, 06:57:32 AM
    Author     : sergio
--%>

<%@page import="onbuild.Acceso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expediente</title>
    </head>
    <body>
        <h1>Consulta un expediente</h1>
        <%
            //Declaración de variables
            String curpPaciente=request.getParameter("curpPaciente");
            String estudios;
            String diagnostico;
            String observaciones;
           
        %>
        
        <%
            //Pedimos datos para consultar
        %>
        <form name="consultarExp" action="ConsultarExpediente.jsp" method="get">
            CURP del paciente: <input type="text" name="curpPaciente" placeholder="CURP del Paciente">
            <input type="submit" value="Consultar"/>
         </form>   
        <%
            //invocamos la consulta a través del metodo
            Acceso conex=new Acceso();
            String expediente[]=conex.consultarExpediente(curpPaciente);
            
            //Asignamos lo obtenido a las variables
            estudios=expediente[0];
            diagnostico=expediente[1];
            observaciones=expediente[2];
        %>    
           
        <h2>Estudios </h2>
        <p><%=estudios%></p>
        <h2>Diagnostico </h2>
        <p><%=diagnostico%></p>
        <h2>Observaciones</h2>
        <p><%=observaciones%></p>
        
    </body>
</html>
