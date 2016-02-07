<%-- 
    Document   : registrarTe
    Created on : 6/12/2015, 08:32:32 PM
    Author     : user
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

    } else {
        response.sendRedirect("loginp.jsp");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Terapeutas</title>
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
                                <input type="button" value="Registrar Terapeuta" onclick="window.location.href = 'registrarTe.jsp'" id="boton"/>
                                <input type="button" value="Eliminar Terapeuta" onclick="window.location.href = 'eliminarTe.jsp'" id="boton"/>
                                <input type="button" value="Consultar Terapeutas" onclick="location.href = 'ConsultarTerapeutas.jsp'" id="boton"/>
                                <input type="submit" value="Cerrar Sesion" id="boton">
                            </form>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
        <br>
        <br>
        <br>
        <br>
        Administrador: <% out.println(sesion.getAttribute("usuario"));%>    
        <br>
        <br>
        <form action="RegistrarTe" name="" method="post">

            <input type="text" name="nomte" placeholder="Nombre"/><br>
            <input type="text" name="appte" placeholder="Apellido Paterno"/><br>
            <input type="text" name="apmte" placeholder="Apellido Materno"/><br>
            <input type="text" name="cedu" placeholder="Cedula Prof"/><br>
            <input type="password" name="clate" placeholder="Clave"/><br>
            <input type="text" name="nickte" placeholder="Nickname"/><br>

            <input type="submit" value="Registrar Terapeuta"  id="boton" /><br>
        </form>
        
    </center>
</body>
</html>
