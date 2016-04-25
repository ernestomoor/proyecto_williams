<%-- 
    Document   : index
    Created on : 17-dic-2015, 19:11:34
    Author     : Wolf
--%>

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
        response.sendRedirect("admin.jsp");
    } else {

    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de inicio Williams</title>
        
      
        <link rel="stylesheet" href="css/principal.css">
        
    </head>
    <body>
    <center>
        <header id="fondo_superior">
            <center><img src="css/logo.png" id="logo"/></center>

        </header>
    </center>
    <hr style="background-color: #0073CA; height: 20px;">
    <hr style="background-color: #E39F2F; height: 20px; margin: -10px">

<div>
    <form action="IniciarSesion" method="post" class="col-lg-4 col-lg-offset-3">
        <center>
            <table>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Necesitas iniciar sesion para acceder al sistema
                    </td>
                </tr>
                <tr>
                    <td> <center><input type="text" name="nick" placeholder="Usuario"/></center></td>
                </tr>
                <tr>
                    <td><center><input type="password" name="pass" placeholder="Pasword"/></center></td>
                </tr>
                <tr>
                    <td><center><input type="submit" id="boton" value="Iniciar Sesion" /></center></td>
                </tr>

            </table>
        </center>
    </form>
</div> 
   
</body>
</html>
