<%-- 
    Document   : ResponderCitas
    Created on : 29-dic-2015, 0:32:05
    Author     : Wolf
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="onbuild.Acceso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%HttpSession sesion = request.getSession();
    String nom = sesion.getAttribute("usuario") + "";
    String priv = sesion.getAttribute("privilegio") + "";
    String nick=sesion.getAttribute("nick")+"";
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
                                <input type="button" value="Agenda" onclick="window.location.href = 'Agenda.jsp'" id="boton"/>
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
        <h2>Seleccione una cita pendiente</h2>
        <form action="ResponderCitas" method="post">
            
        <%
            Acceso ac=new Acceso();
            PreparedStatement ps;
            ResultSet rs;
            //HttpSession sesion=request.getSession();
            String usu=sesion.getAttribute("usuario")+"";
            ps=ac.iniCon().prepareStatement("SELECT * FROM sesiones WHERE Cedula=? AND Stat=0");
            ps.setString(1,nick);
            rs=ps.executeQuery();
            while(rs.next()){
        %>
         <% out.println("Paciente: "+rs.getString("NP")); %> | <% out.println("Fecha: "+rs.getString("fecha")); %>
            | <% out.println("Hora: "+rs.getString("Hora")); %> | <% out.println("idSesion: "+rs.getInt("idSesion")); %>
        <%
            }
        %>
            
            <br>
            <input type="number" name="idsesion" placeholder="Cita">
            <br>
            si <input type="radio" value="0" name="respuesta"><br>
            no <input type="radio" value="1" name="respuesta"><br>
            cambiar <input type="radio" value="2" name="respuesta"><br>
            <%
            //respuestas, 0 si, 1 no, 2 cambiar
            %>
            <input type="text" placeholder="Confirmar fecha" name="fecha"><br>
            <input type="text" placeholder="Confirmar hora" name="hora"><br>
            <br>
            <input type="submit" value="Enviar" id="boton">
        </form>
        </center>
    </body>
</html>
