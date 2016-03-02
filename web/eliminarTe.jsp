<%-- 
    Document   : eliminarTe
    Created on : 13-dic-2015, 13:16:09
    Author     : Wolf
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="onbuild.Acceso" %>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar terapeuta</title>
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

        <form action="EliminarTerapeuta" name="forma">
            <br>
            <br>
            <select name="muere" id="seleccion">
                <%
                    Acceso eliminar = new Acceso();

                    Statement s;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    int tera = 0;
                    String nick[];
                    //ps = eliminar.iniCon().prepareStatement("SELECT * FROM Usuario natural join Terapeuta where tipoUsu=2");
                    ps = eliminar.iniCon().prepareStatement("SELECT * FROM terapeuta");
                    rs = ps.executeQuery();

                while (rs.next()) { %>

                <option><% out.print(rs.getString("Nick")); %></option>



                <% } %>
            </select>
            <br/>

            <p>
                <%
                    ps = eliminar.iniCon().prepareStatement("SELECT * FROM Usuario natural join Terapeuta where tipoUsu=2");
                    rs = ps.executeQuery();
                    while (rs.next()) {
                %>
                <% out.print(rs.getString("Nick")); %> | <% out.print(rs.getString("Nombre")); %> | <% out.print(rs.getString("App")); %> | <% out.print(rs.getString("Apm")); %> | <% out.print(rs.getString("Cedula")); %><br>

                <% }%></p>
            <input type="submit" value="Eliminar terapeuta seleccionado"  id="boton">
        </form>

    </center>
</body>
</html>
