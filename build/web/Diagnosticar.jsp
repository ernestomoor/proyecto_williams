<%-- 
    Document   : Diagnosticar
    Created on : 11-ene-2016, 21:20:47
    Author     : Wolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%HttpSession sesion=request.getSession();
String nom= sesion.getAttribute("usuario")+"";
String priv= sesion.getAttribute("privilegio")+"";
                  
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
        <title>JSP Page</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
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
            <form method="post" action="Diagnosticar">
            <input type="text" name="estudios" placeholder="Estudios" maxlength="1100"><br>
            <input type="text" name="diagnosticos" placeholder="Diagnosticos" maxlength="1100"><br>
            <input type="text" name="observaciones" placeholder="Observaciones" maxlength="1100"><br>
            <input type="text" name="np" placeholder="Nick del Paciente" maxlength="45"><br>
            <input type="submit" value="Enviar" id="boton">
            </form>
    </center>
    </body>
</html>
