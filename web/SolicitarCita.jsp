<%-- 
    Document   : SolicitarCita
    Created on : 22-dic-2015, 23:28:48
    Author     : Wolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%HttpSession sesion = request.getSession();
    String nom = sesion.getAttribute("usuario") + "";
    String priv = sesion.getAttribute("privilegio") + "";

    if (priv.equals("3")) {
        response.sendRedirect("paciente.jsp");

    } else if (priv.equals("4")) {

    } else if (priv.equals("2")) {
        response.sendRedirect("terapeuta.jsp");
    } else if (priv.equals("1")) {
        response.sendRedirect("admin.jsp");
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
                                <input type="button" value="Solicitar cita" onclick="window.location.href = 'SolicitarCita.jsp'" id="boton"/>
                                <input type="submit" value="Cerrar Sesion" id="boton">
                            </form>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
        <h1>Solicitar cita</h1>
        <form method="post" action="SolicitarCitas">
            <input type="text" placeholder="Nick del paciente" name="np"/><br>
            <input type="text" placeholder="Nick del terapeuta" name="nt"/><br>
            <input type="date" placeholder="dd/mm/aaaa" name="fecha" min="1980-01-01" max="2020-01-01"/><br>
            <input type="text" placeholder="hora" name="hora"/><br>
            <input type="submit" value="solicitar cita" id="boton">
        </form>
    </center>
</body>
</html>
