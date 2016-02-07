<%-- 
    Document   : paciente
    Created on : 2/12/2015, 01:36:13 PM
    Author     : Alumno
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="onbuild.Acceso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%HttpSession sesion = request.getSession();
    String nom = sesion.getAttribute("usuario") + "";
    String nick = sesion.getAttribute("nick") + "";
    String priv = sesion.getAttribute("privilegio") + "";

    if (priv.equals("3")) {
        

    } else if (priv.equals("4")) {
        response.sendRedirect("tutor.jsp");
    } else if (priv.equals("2")) {
        response.sendRedirect("terapeuta.jsp");
    } else if (priv.equals("1")) {

    } else {
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
                                
                                <input type="submit" value="Cerrar Sesion" id="boton">
                            </form>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
        <h1>Paciente: <% out.println(sesion.getAttribute("usuario")); %></h1>
        


    </center>
    </body>
    
</html>
