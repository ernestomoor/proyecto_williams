<%-- 
    Document   : loginprueba
    Created on : 2/12/2015, 12:07:10 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%HttpSession sesion = request.getSession();
    String nom = sesion.getAttribute("usuario") + "";
    String priv = sesion.getAttribute("privilegio") + "";

    if (priv.equals("3")) {
        response.sendRedirect("paciente.jsp");

    } else if (priv.equals("4")) {
        response.sendRedirect("tutor.jsp");

    } else if (priv.equals("2")) {
        response.sendRedirect("terapeuta.jsp");
    } else if (priv.equals("1")) {
        response.sendRedirect("admin.jsp");
    } else {

    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Williams</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <center>
        <header id="fondo_superior">
            <center><img src="css/logo.png" id="logo"/></center>

        </header>
    </center>
    <hr style="background-color: #0073CA; height: 20px;">
    <hr style="background-color: #E39F2F; height: 20px; margin: -10px">


    <form action="IniciarSesion" method="post">
        <center>
            <table>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Necesitas iniciar sesion para acceder al sistema
                    </td>
                </tr>
                <tr>
                    <td> <center><input type="text" name="curp" placeholder="Nombre de usuario"/></center></td>
                </tr>
                <tr>
                    <td><center><input type="password" name="pass" placeholder="Paswword"/></center></td>
                </tr>
                <tr>
                    <td><center><input type="submit" id="boton" value="Iniciar Sesion" /></center></td>
                </tr>

            </table>
        </center>
    </form>

</body>
</html>
