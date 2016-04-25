<%-- 
Document   : admin
Created on : 6/12/2015, 08:00:05 PM
Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
        response.sendRedirect("terapeuta.jsp");
    } else if (priv.equals("1")) {

    } else {
        response.sendRedirect("loginp.jsp");
    }

%>

<%--Parametros recibidos--%>
<%    String cedula = request.getParameter("cedula");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DetallesTerapeuta</title>
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
                                <input type="button" value="Consultar Terapeutas" onclick="location.href = 'ConsultarTerapeutas.jsp'" id="boton"/>                 
                                <input type="button" value="Inicio" onclick="window.location.href = 'InicioAdministrador.jsp'" id="boton"/>                               
                                <input type="submit" value="Cerrar Sesion" id="boton">
                            </form>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
        <P>Bienvenido Administrador: <% out.println(sesion.getAttribute("usuario"));%></P>

        <h2>TERAPEUTA</h2>

        <%--Consultamos la información del terapeuta--%>
        <%
            Acceso conex = new Acceso();
            String terapeuta[] = conex.consultarTerapeutaPorCedula(cedula);
        %>
        <div><center>
                <h2>
                    <%=terapeuta[0]%>
                    <%=terapeuta[1]%>
                    <%=terapeuta[2]%>
                </h2>
                <h3>
                    Cedula: <%=terapeuta[3]%>
                </h3>
                <table>
                    </tr>
                    <tr>
                        <td>
                            LUNES
                        </td>
                        <td>
                            MARTES
                        </td>
                        <td>
                            MIERCOLES
                        </td>
                        <td>
                            JUEVES
                        </td>
                        <td>
                            VIERNES
                        </td>
                        <td>
                            SABADO
                        </td>    
                    <tr>
                        <td>
                            <%=terapeuta[6]%>
                        </td>
                        <td>
                            <%=terapeuta[7]%>
                        </td>
                        <td>
                            <%=terapeuta[8]%> 
                        </td>
                        <td>
                            <%=terapeuta[9]%> 
                        </td>
                        <td>
                            <%=terapeuta[10]%> 
                        </td>
                        <td>
                            <%=terapeuta[11]%> 
                        </td>     
                    </tr>
                </table>
            </center>
    </center>
</div>

<div>
    <h2>PACIENTES</h2>
    <table>
        <tr id="tabla">
            <td>
                Nombre
            </td>
            <td>
                A.Paterno
            </td>
            <td>
                A. Materno
            </td>
            <td>
                CURP
            </td>
            <td>
                F.Nacimiento
            </td>
            <td>
                Escolaridad
            </td>
            <td>
                Sexo
            </td>
            <td>
                Edad
            </td>
            <td>
                Lateralidad
            </td>
            <td>
                Nick
            </td>
            <td>
                Clave
            </td>
            <td>
                Privilegio
            </td>
        </tr>
        <%
            PreparedStatement ps;
            ResultSet rs;
            Acceso ac = new Acceso();
            String strSql ="select "+
                    "p.* " +
                    "from terapeuta_paciente tp " + 
                    "inner join paciente p on " +
                    "tp.Curp_paciente = p.Curp_paciente "+
                    "inner join terapeuta t on " +
                    "tp.Cedula = t.Cedula " +
                    "where t.Cedula = "+cedula+";";
 
        ps = ac.iniCon().prepareStatement(strSql);
            rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <tr id="tabla">
            <td>
                <% out.print(rs.getString("Nombre")); %>
            </td>
            <td>
                <% out.print(rs.getString("App")); %>
            </td>
            <td>
                <% out.print(rs.getString("Apm"));%>
            </td>
            <td>
                <a href="DetallesTerapeuta.jsp?curp=<%=rs.getString("Curp_paciente")%>"</a><%out.print(rs.getString("curp_paciente")); %>
            </td>
            <td>
                <% out.print(rs.getString("FNac")); %>
            </td>
            <td>
                <% out.print(rs.getString("Escolaridad")); %>
            </td>
            <td>
                <% out.print(rs.getString("Sexo")); %>
            </td>
            <td>
                <% out.print(rs.getString("Edad")); %>
            </td>
            <td>
                <% out.print(rs.getString("Lateralidad")); %>
            </td>
            <td>
                <% out.print(rs.getString("Nick")); %>
            </td>
            <td>
                <% out.print(rs.getString("Clave")); %>
            </td>
            <td>
                <% out.print(rs.getString("Id_priv")); %>
            </td>
        </tr>
        <% }%>
    </table>



</div>


</body>
</html>
