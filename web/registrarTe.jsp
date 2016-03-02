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

            <input type="text" name="ter_nombre" placeholder="Nombre"/><br>
            <input type="text" name="ter_paterno" placeholder="Apellido Paterno"/><br>
            <input type="text" name="ter_materno" placeholder="Apellido Materno"/><br>
            <input type="text" name="ter_cedula" placeholder="Cedula Prof"/><br>
            <input type="text" name="ter_nick" placeholder="Nickname"/><br>
            <input type="password" name="ter_clave" placeholder="Contraseña"/><br>
            <p>Horario</p>
            Lunes: <input type="text" name="hlun" placeholder="00:00-00:00"/><br>
            Martes: <input type="text" name="hmar" placeholder="00:00-00:00"/><br>
            Miercoles: <input type="text" name="hmie" placeholder="00:00-00:00"/><br>
            Jueves: <input type="text" name="hjue" placeholder="00:00-00:00"/><br>
            Viernes: <input type="text" name="hvie" placeholder="00:00-00:00"/><br>
            Sábado: <input type="text" name="hsab" placeholder="00:00-00:00"/><br>
            Domingo: <input type="text" name="hdom" placeholder="00:00-00:00"/><br>
            <input type="hidden" value="2" name="ter_privilegio"/>
            <input type="submit" value="Registrar Terapeuta"  id="boton" /><br>
        </form>
        
    </center>
</body>
</html>
