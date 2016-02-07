<%-- 
    Document   : ModificarTerapeuta
    Created on : 21-dic-2015, 16:18:29
    Author     : Wolf
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="onbuild.Acceso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
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
    }%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ModificarPaciente" name="forma">
            <select name="xd">
                <%
                    Acceso eliminar = new Acceso();
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    String nick[];
                    ps = eliminar.iniCon().prepareStatement("SELECT * FROM Usuario where tipoUsu=2");
                    rs = ps.executeQuery();
                    while (rs.next()) { %>
                <option> <% out.print(rs.getString("Nick")); %> </option>
                <% }%>
            </select>
            <br>
            <br>
            <input type="text" name="nomte" placeholder="Nombre"/><br>
            <input type="text" name="appte" placeholder="Apellido Paterno"/><br>
            <input type="text" name="apmte" placeholder="Apellido Materno"/><br>
            <input type="text" name="cedu" placeholder="Cedula Prof"/><br>
            <input type="password" name="clate" placeholder="Clave"/><br>
            <input type="text" name="nickte" placeholder="Nickname"/><br>
            <input type="submit" value="Modificar">
        </form>
    </body>
</html>
