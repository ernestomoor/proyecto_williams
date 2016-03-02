<%-- 
    Document   : Diagnosticar
    Created on : 11-ene-2016, 21:20:47
    Author     : Wolf
--%>
<%@page import="onbuild.Acceso"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%HttpSession sesion = request.getSession();
    String nom = sesion.getAttribute("usuario") + "";
    String priv = sesion.getAttribute("privilegio") + "";
    String clave = sesion.getAttribute("pass") +"";

    if (priv.equals("3")) {
        response.sendRedirect("paciente.jsp");

    } else if (priv.equals("4")) {
        response.sendRedirect("tutor.jsp");

    } else if (priv.equals("1")) {
        response.sendRedirect("admin.jsp");
    } else if (priv.equals("2")) {

    } else {
        response.sendRedirect("loginp.jsp");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Agenda</title>
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
        <%                String userTerapeuta = nom;
            System.out.println("En agenda, userTerapeuta:" + userTerapeuta);
        %>

        <h1>Agendar sesion</h1>
        <form method="post" action="Agenda">

            <input type="text" placeholder="CURP del paciente" name="curp_paciente"/><br>
            <input type="hidden" name="user_terapeuta" value="<%=userTerapeuta%>"/><br>
            <input type="date" placeholder="dd/mm/aaaa" name="fecha" min="1980-01-01" max="2020-01-01"/><br>
            <input type="text" placeholder="hora" name="hora"/><br>
            Sesion Numero:<input type="text" placeholder="sesion No" name="no_sesion"/></br>
            Observaciones:<input type="text" placeholder="observaciones" name="observaciones"/>
            <input type="submit" value="Agendar" id="boton">
        </form>


        <table>
            <tr id="tabla">
                <td>
                    idSesion
                </td>
                <td>
                    Cedula
                </td>
                <td>
                    Curp_Paciente
                </td>
                <td>
                    Fecha
                </td>
                <td>
                    Hora
                </td>
                <td>
                    No_sesion
                </td>
                <td>
                    Observaciones
                </td>
            </tr>
            <%
                /*Establecemos un conexion para obtener los datos del terapeuta*/
                Acceso conexion = new Acceso();
                String[] terapeuta = conexion.consultarTerapeuta(nom, clave);

               
                /*Preparamos la consulta de todos los registros en sesiones*/
                PreparedStatement ps;
                ResultSet rs;
                Acceso ac = new Acceso();

                ps = ac.iniCon().prepareStatement("SELECT * FROM sesiones where Cedula="+terapeuta[0]);
                rs = ps.executeQuery();
                while (rs.next()) {
            %>

            <tr id="tabla">
                <td>
                    <% out.print(rs.getString("IdSesion")); %>
                </td>
                <td>
                    <% out.print(rs.getString("Cedula")); %>
                </td>
                <td>
                    <% out.print(rs.getString("Curp_paciente")); %>
                </td>
                <td>
                    <% out.print(rs.getString("Fecha")); %>
                </td>
                <td>
                    <% out.print(rs.getString("Hora")); %>
                </td>
                <td>
                    <% out.print(rs.getString("No_sesion")); %>
                </td>
                <td>
                    <% out.print(rs.getString("Observaciones")); %>
                </td>

            </tr>
            <% }%>
        </table>





    </center>
</body>
</html>
