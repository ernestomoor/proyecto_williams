<%-- 
    Document   : ModificarPa
    Created on : 21-dic-2015, 15:46:41
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

    } else if (priv.equals("1")) {

    } else {
        response.sendRedirect("loginp.jsp");
    } %>
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
                    ps = eliminar.iniCon().prepareStatement("SELECT * FROM Usuario where tipoUsu=3");
                    rs = ps.executeQuery();

                    while (rs.next()) { %>
                <option> <% out.print(rs.getString("Nick")); %> </option>
                <% }%>
            </select>
            <br>
            <br>
            <input type="text" name="nom" placeholder="Nombre"/><br>
            <input type="text" name="app" placeholder="Apellido Paterno"/><br>
            <input type="text" name="apm" placeholder="Apellido Materno"/><br>
            <input type="date" name="fecn" min="1980-01-01" max="2011-12-31" /><br>
            <input type="text" name="esc" placeholder="Escolaridad"/><br>
            <br>Sexo:<br>  
            Masculino:<input type="radio" value="Masculino" name="sex"/>
            Femenino:<input type="radio" value="Femenino" name="sex"/><br>
            <input type="number" name="edad" placeholder="edad"/>
            <br>Lateralidad:<br> Zurdo<input type="radio" value="Zurdo" name="lat"/>
            Diestro<input type="radio" value="Diestro" name="lat"/>
            Ambidiestro<input type="radio" value="Ambidiestro" name="lat"/><br>
            <input type="password" name="cla" placeholder="Clave"/><br>
            <input type="text" name="nick" placeholder="Nickname"/><br>
            <input type="text" name="nnick" placeholder="Nuevo Nickname"/><br>
            <input type="submit" value="Modificar">
        </form>
    </body>
</html>
