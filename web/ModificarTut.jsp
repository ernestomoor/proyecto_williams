<%-- 
    Document   : ModificarTut
    Created on : 17-dic-2015, 20:31:16
    Author     : Wolf
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="onbuild.Acceso"%>
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

    } else if (priv.equals("1")) {
        response.sendRedirect("admin.jsp");
    } else {
        response.sendRedirect("loginp.jsp");
    } %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Datos Tutor</title>
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
    
        <form action="ModificarTut" name="forma">
            <select name="xd" id="seleccion">
                <%
                    Acceso eliminar = new Acceso();
                    PreparedStatement ps = null;
                    ResultSet rs = null; 
                    String nick[];
                    ps = eliminar.iniCon().prepareStatement("SELECT * FROM Usuario where tipoUsu=4");
                    rs = ps.executeQuery();

                while (rs.next()) { %>
                <option> <% out.print(rs.getString("Nick")); %> </option>
                <% }%>
            </select>
            <br>
            <br>
            <input type="text" name="nomt" placeholder="Nombre tutor"/><br>
            <input type="text" name="appt" placeholder="Apellido paterno tutor"/><br>
            <input type="text" name="apmt" placeholder="Apellido materno tutor"/><br>
            <input type="text" name="calle" placeholder="calle"/><br>
            <input type="text" name="ne" placeholder="numero exterior"/><br>
            <input type="text" name="ni" placeholder="numero interior"/><br>
            <input type="text" name="col" placeholder="colonia"/><br>
            <input type="text" name="cp" placeholder="codigo postal"/><br>
            <input type="text" name="del" placeholder="delegacion"/><br>
            <input type="text" name="cd" placeholder="ciudad"/><br>
            <input type="tel" name="tel" placeholder="telefono"/><br>
            <input type="text" name="nickt" placeholder="Nickname"/><br>
            <input type="text" name="rela" placeholder="Paciente asignado"/><br>
            <input type="password" name="clat" placeholder="Clave Tutor"/><br>
            <input type="submit" id="boton" value="Modificar">
        </form>
            
            
            </center>
    </body>
</html>
