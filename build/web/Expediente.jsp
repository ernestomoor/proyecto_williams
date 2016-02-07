<%-- 
    Document   : Expediente
    Created on : 11-ene-2016, 21:21:03
    Author     : Wolf
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="onbuild.Acceso"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%HttpSession sesion=request.getSession();
String nom= sesion.getAttribute("usuario")+"";
String priv= sesion.getAttribute("privilegio")+"";
String nickt=sesion.getAttribute("nick")+"";
                  
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expediente</title>
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
            Expediente de paciente:
            
                <%
                   Acceso ac=new Acceso();
                   PreparedStatement ps;
                   ResultSet rs;
                   String rel="";
                   ps=ac.iniCon().prepareStatement("select * from terapeuta where nick=?");
                   ps.setString(1, nickt);
                   rs=ps.executeQuery();
                   while(rs.next()){
                       rel=rs.getString("RP");
                   }
                   ac.iniCon().close();
                   ps=ac.iniCon().prepareStatement("select * from sesiont where NP=?");
                   ps.setString(1, rel);
                   rs=ps.executeQuery();
                   while(rs.next()){
                       %>
                       <table>
                           
                       <tr>
                           <td>
                               <% out.print("Estudios: "+rs.getString("Estudios")); %>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <% out.print("Diagnosticos: "+rs.getString("Diagnosticos")); %>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <% out.print("Observacones:"+rs.getString("Observaciones")); %>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <% out.print("Folio: "+rs.getInt("idSest")); %>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <% out.print("Paciente: "+rs.getString("NP")); %>
                           </td>
                       </tr>
                       </table>
                
                <%
                       
                   }
                   ac.iniCon().close();
                %>
                
                
            
           
    </center>
    </body>
</html>
