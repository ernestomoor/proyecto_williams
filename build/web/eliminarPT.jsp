<%-- 
    Document   : eliminarPT
    Created on : 13-dic-2015, 16:13:42
    Author     : Wolf
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="onbuild.Acceso" %>
<%HttpSession sesion=request.getSession();
String nom= sesion.getAttribute("usuario")+"";
String priv= sesion.getAttribute("privilegio")+"";
                  
                   if(priv.equals("3")){
                       response.sendRedirect("paciente.jsp");
                   
                   }else if(priv.equals("4")){
                       response.sendRedirect("tutor.jsp");
                   
                   }else if(priv.equals("1")){
                       response.sendRedirect("admin.jsp");
                   }else if(priv.equals("2")){
                       
                   }else{
                       response.sendRedirect("loginp.jsp");
                   }
               
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Paciente y Tutor <% out.println(sesion.getAttribute("usuario")); %></title>
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
        Terapeuta: <% out.print(nom); %>
        <br>
            <br>
        <form action="adiospa" name="forma">
            
            
            <select name="muere" id="seleccion">
            <%
                Acceso eliminar = new Acceso();
                
                
                
                
                Statement s;
    PreparedStatement ps = null;
    ResultSet rs = null;
    int tera=0;
    String nick[];
    ps = eliminar.iniCon().prepareStatement("SELECT * FROM Usuario natural join Tutor where tipoUsu=4");
    rs = ps.executeQuery();
    
    while (rs.next()){ %>
    
    <option><% out.print(rs.getString("Nick")); %></option>
            
            
            
            <% } %>
            </select>
            <br/>
            
                <p>
            <%
    ps = eliminar.iniCon().prepareStatement("SELECT * FROM Usuario natural join Tutor where tipoUsu=4");
    rs = ps.executeQuery();
            while(rs.next()){
            %>
            <% out.print(rs.getString("Nick")); %> | <% out.print(rs.getString("Nombre")); %> | <% out.print(rs.getString("App")); %> | <% out.print(rs.getString("Apm")); %> | <% out.print(rs.getString("Relacion")); %><br>
            
            <% } %></p>
        <input type="submit" value="Eliminar paciente tutor seleccionado" id="boton" >
        </form>
            
        </center>
    </body>
</html>
