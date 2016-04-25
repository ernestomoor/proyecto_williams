<%-- 
    Document   : ConsultarTerapeutas
    Created on : 12-ene-2016, 23:09:31
    Author     : Wolf
--%>

<%@page import="onbuild.Acceso"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%HttpSession sesion=request.getSession();
String nom= sesion.getAttribute("usuario")+"";
String priv= sesion.getAttribute("privilegio")+"";
                  
                   if(priv.equals("3")){
                       response.sendRedirect("paciente.jsp");
                   
                   }else if(priv.equals("4")){
                       response.sendRedirect("tutor.jsp");
                   
                   }else if(priv.equals("2")){
                       response.sendRedirect("terapeuta.jsp");
                   }else if(priv.equals("1")){
                       
                   }else{
                       response.sendRedirect("loginp.jsp");
                   }
               
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Terapeutas</title>
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
            <br>
        <br>
        <br>
        <br>
        Administrador: <% out.println(sesion.getAttribute("usuario"));%>
        <br>
        <br>
        <h3> Da click en la cédula del terapeuta para ver los detalles</h3>
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
                    Cédula
                </td>
                <td>
                    Nick
                </td>
                <td>
                    Clave
                </td>
                <td>
                    Lunes
                </td>
                <td>
                    Martes
                </td>
                <td>
                    Miercoles
                </td>
                <td>
                    Jueves
                </td>
                <td>
                    Viernes
                </td>
                <td>
                    Sábado
                </td>
                <td>
                    Domingo
                </td>
                <td>
                    Privilegios
                </td>
            </tr>
        <%
        PreparedStatement ps;
        ResultSet rs;
        Acceso ac=new Acceso();
        
        ps=ac.iniCon().prepareStatement("SELECT * FROM terapeuta");
        rs=ps.executeQuery();
        while(rs.next()){
        %>
        <tr id="tabla">
                <td>
                    <% out.print(rs.getString("Nombre")); %>
                </td>
                <td>
                    <% out.print(rs.getString("App")); %>
                </td>
                <td>
                    <% out.print(rs.getString("Apm")); %>
                </td>
                <td>
                    <a href="DetallesTerapeuta.jsp?cedula=<%=rs.getString("cedula")%>"</a><%out.print(rs.getString("cedula")); %>
                </td>
                <td>
                    <% out.print(rs.getString("Nick")); %>
                </td>
                <td>
                    <% out.print(rs.getString("Clave")); %>
                </td>
                <td>
                    <% out.print(rs.getString("HLun")); %>
                </td>
                <td>
                    <% out.print(rs.getString("HMar")); %>
                </td>
                <td>
                    <% out.print(rs.getString("HMie")); %>
                </td>
                <td>
                    <% out.print(rs.getString("HJue")); %>
                </td>
                <td>
                    <% out.print(rs.getString("HVie")); %>
                </td>
                <td>
                    <% out.print(rs.getString("HSab")); %>
                </td>
                <td>
                    <% out.print(rs.getString("HDom")); %>
                </td>
                <td>
                    <% out.print(rs.getString("Id_priv")); %>
                </td>
            </tr>
        <% } %>
        </table>
        </center>
    </body>
</html>
