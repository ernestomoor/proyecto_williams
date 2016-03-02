<%-- 
    Document   : tutor
    Created on : 2/12/2015, 01:36:38 PM
    Author     : Alumno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="onbuild.Acceso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%HttpSession sesion = request.getSession();
    String nom = sesion.getAttribute("usuario") + "";
    String nick = sesion.getAttribute("nick") + "";
    String priv = sesion.getAttribute("privilegio") + "";

    if (priv.equals("3")) {
        response.sendRedirect("paciente.jsp");

    } else if (priv.equals("4")) {

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
        <title>Págima del tutor</title>
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
        <h1>Tutor: <% out.println(sesion.getAttribute("usuario")); %></h1>
        <%
            
            /*
            System.out.println(nick);
            Acceso paciente = new Acceso();
            ResultSet rs;
            String rela = "";
            PreparedStatement ps = paciente.iniCon().prepareStatement("select * from tutor where Nick=?");
            ps.setString(1, nick);
            rs = ps.executeQuery();
            while (rs.next()) {
                rela = rs.getString("Relacion");
            }
            paciente.iniCon().close();
            System.out.println(rela);
            ps = paciente.iniCon().prepareStatement("select * from usuario natural join paciente where Nick=?");
            ps.setString(1, rela);
            rs = ps.executeQuery();
            while (rs.next()) {

*/
        %>
        <%
            out.print("Datos del Paciente:");
        %>
        <table>

            <tr>
                <td>
                    <%//out.println("Nombre: " + rs.getString("Nombre"));  %>
                </td>
            </tr>
            <tr>
                <td>
                    <%//out.println("Apellido Paterno: " + rs.getString("App")); %>
                </td>
            </tr>
            <tr>
                <td>
                    <%// out.println("Apellido Materno: " + rs.getString("Apm")); %>
                </td>
            </tr>
            <tr>
                <td>
                    <%// out.println("Apellido Materno: " + rs.getString("Nick")); %>
                </td>
            </tr>
            <tr>
                <td>
                    <%// out.println("Edad: " + rs.getInt("Edad"));  %>
                </td>
            </tr>
            <tr>
                <td>
                    Sexo
                </td>
            </tr>
            <tr>
                <td>
                    Nacimiento
                </td>
            </tr>
            <tr>
                <td>
                    escolaridad
                </td>
            </tr>
            <tr>
                <td>
                    Lateralidad
                </td>
            </tr>

        </table>

        


    </center>
</body>
</html>
