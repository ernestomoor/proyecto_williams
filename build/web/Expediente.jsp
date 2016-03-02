<%-- 
    Document   : Expediente
    Created on : 11-ene-2016, 21:21:03
    Author     : Wolf
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="onbuild.Acceso"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%HttpSession sesion=request.getSession();
String nom= sesion.getAttribute("usuario")+"";
String priv= sesion.getAttribute("privilegio")+"";
String nickt=sesion.getAttribute("nick")+"";
                  
                   if(priv.equals("3")){
                       response.sendRedirect("paciente.jsp");
                   
                   }else if(priv.equals("4")){
                       response.sendRedirect("tutor.jsp");
                   
                   }else if(priv.equals("1")){
                       response.sendRedirect("admin.jsp");
                   }else if(priv.equals("2")){
                       
                   }else{
                       response.sendRedirect("loginp.jsp");
                   }
               
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expediente</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        
        <style type="text/css">
            
            #contenedorR{
                margin: 0 auto;
                width: 1000px;
            }
            #paciente{
                float:left;
                width:300px;
        
            }
            #resultados{
                float:left;
                width: 300px;
         
            }
            #diagnostico{
                float: left;
                width: 300px;
          
            }
        </style>
    </head>
    <body>
        <center>
        <header id="fondo_superior">
            <center><img src="css/logo.png" id="logo"/></center>
            
        </header>
        <div id="menu">
                <center>
                    <table>
                        <tr>
                            <td>
                                <form action="CerrarSesion" method="post">
                                <input type="button" value="Registrar Paciente y Tutor" onclick="window.location.href = 'registrarPT.jsp'" id="boton"/>
                                <input type="button" value="Modificar Tutor" onclick="window.location.href = 'ModificarTut.jsp'" id="boton"/>
                                <input type="button" value="solicitudes de citas" onclick="window.location.href = 'ResponderCitas.jsp'" id="boton"/>
                                <input type="button" value="Eliminar Paciente y Tutor" onclick="window.location.href = 'eliminarPT.jsp'" id="boton"/>
                                <input type="button" value="Crear Diagnostico" onclick="window.location.href = 'Diagnosticar.jsp'" id="boton"/>
                                <input type="button" value="Expediente" onclick="window.location.href = 'Expediente.jsp'" id="boton"/>
                                <input type="submit" value="Cerrar Sesion" id="boton">
                                </form>
                            </td>
                        </tr>
                    </table>
                </center>
            </div>
            <br>
            <br>
            
            <h1>Consulta un expediente</h1>
        <%
            //Declaración de variables
            String curpPaciente=request.getParameter("curpPaciente");
            String estudios;
            String diagnostico;
            String observaciones;
           
        %>
        
        <%
            //Pedimos CURP paciente para consultar
        %>
        <form name="consultarExp" action="Expediente.jsp" method="get">
            CURP del paciente: <input type="text" name="curpPaciente" placeholder="CURP del Paciente">
            <input type="submit" value="Consultar"/>
         </form>   
        <%
            /**********************************************************
             * Consulta del Expediente del paciente 
             * (se guarda en un array para mostrarlo mas adelante)
             **********************************************************/ 
             
            Acceso conex=new Acceso();
            String expediente[]=conex.consultarExpediente(curpPaciente);
            
            //Asignamos lo obtenido a las variables
            estudios=expediente[0];
            diagnostico=expediente[1];
            observaciones=expediente[2];
            
            /**********************************************************
             * Consulta los datos del paciente 
             * (se guarda en un array para mostrarlo mas adelante)
             **********************************************************/ 

             String paciente[]=conex.consultarPacientePorCurp(curpPaciente);
             String nombrePaciente=paciente[0];
             String paternoPaciente=paciente[1];
             String maternoPaciente=paciente[2];
             curpPaciente=paciente[3];
             String FNacPaciente=paciente[4];
             String escolaridadPaciente=paciente[5];
             String sexoPaciente=paciente[6];
             String edadPaciente=paciente[7];
             String lateralidadPaciente=paciente[8];
             
//Continuar

        %>  
           
        
        <%//Mostramos imfrmacion%>        
        
        <div id="contenedorR">
        <div id="paciente">
            <h2>Datos del paciente</h2>
        </div>    
        
        <div id="resultados">
            <h2>Resultados de las pruebas</h2>
        </div>    
       
        <div id="diagnostico">
        <h2>Diagnostico</h2>
        <h3>Estudios </h3>
        <p><%=estudios%></p>
        <h3>Diagnostico </h3>
        <p><%=diagnostico%></p>
        <h3>Observaciones</h3>
        <p><%=observaciones%></p>    
        </div>        
        </div>
           
    </center>
    </body>
</html>
