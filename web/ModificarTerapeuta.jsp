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

<%HttpSession sesion=request.getSession();
String nom= sesion.getAttribute("usuario")+"";
String priv= sesion.getAttribute("privilegio")+"";
                  
                   if(priv.equals("3")){
                       response.sendRedirect("paciente.jsp");
                   
                   }else if(priv.equals("4")){
                       response.sendRedirect("tutor.jsp");
                   
                   }else if(priv.equals("2")){
                       
                   }else if(priv.equals("1")){
                       response.sendRedirect("admin.jsp");
                   }else{
                       response.sendRedirect("loginp.jsp");
                   } %>


<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Proyecto Williams</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->


    </head>
    
      <body>
      
                        <%Acceso conex = new Acceso();
                          String []terapeuta1=conex.consultarDatosTerapeuta(nom);
                        
                          String nombre=terapeuta1[0];
                          String paterno=terapeuta1[1];
                          String materno=terapeuta1[2];
                          String cedula=terapeuta1[3];
                          
                        %>
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Programa de intervención Neuropsicolígica para Personas con Sindrome de Williams</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">

                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-clock-o fa-fw"></i> Tienes una sesion en: 
                                    <span class="pull-right text-muted small">4 minutos</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-clock-o fa-fw"></i> Tienes una sesion en:
                                    <span class="pull-right text-muted small">12 minutos</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-clock-o fa-fw"></i> Tienes una sesion en
                                    <span class="pull-right text-muted small">50 minutos</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-clock-o fa-fw"></i> Tienes sesion en
                                    <span class="pull-right text-muted small">2 horas</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                     
                        <li>
                            <a class="text-center" href="#">
                                <strong>Ver la agenda</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="ModificarTerapeuta.jsp?cedula=<%=cedula%>"><i class="fa fa-user fa-fw"></i>Perfil de <%=nombre%></a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Configuración</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="CerrarSesion"><i class="fa fa-sign-out fa-fw"></i>salir</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->
<!---------------------------------------------------------------------------------------------------------------------------------------------------->
<!--BARRA DE NAVEGACION VERTICAL-->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Buscar...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                            <!-- /input-group -->
                        </li>


                        <li>
                            <a href="terapeuta.jsp"><i class="fa fa-dashboard fa-fw"></i> MENU DEL TERAPEUTA</a>
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-calendar fa-fw"></i> Agenda<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="Agenda.jsp">Sesiones</a>
                                </li>
                       
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
             			<li>
                            <a href="#"><i class="fa fa-user fa-fw"></i> Paciente<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="registrarPT.jsp">Registro</a>
                                </li>
                                <li>
                                    <a href="ConsultarPaciente.jsp">Consulta</a>
                                </li>
                                <li>
                                    <a href="Expediente.jsp">Expedientes</a>
                                </li>
                            </ul>
                        </li>
						     
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <!--CONTENIDO PRINCIPAL-->
                        
                            <div class="panel panel-primary">
                                <div class="panel-heading"> Perfil del terapeuta</div> 
                        
                        
        <%--Declaramos todas las variables para terapeuta--%>
        <%
        
        String nick;
        String clave;
        String lunes;
        String martes;
        String miercoles;
        String jueves;
        String viernes;
        String sabado;
        String Domingo;
        int privilegios;        
        %>

<%--Consultamos la información del terapeuta por cedula--%>
        <%
       
            String terapeuta[] = conex.consultarTerapeutaPorCedula(cedula);
        %>
       <center>
                <h2>
                    <%=terapeuta[0]%>
                    <%=terapeuta[1]%>
                    <%=terapeuta[2]%>
                </h2>
                <h3>
                   Cédula: <%=terapeuta[3]%>
                   <br>Nickname: <%=terapeuta[4]%>
                   <br>Contraseña: <%=terapeuta[5]%>
                   
                </h3>  
                 </center>  
        </div>
                   <div class="panel panel-primary"><div class="panel-heading"> Horario</div>
                  <center>  
                   <form class="form-inline" action="ModificarHorario" method="get">   
                       <table class="table">
                           <thead>
                    <tr>
                        <th>
                            LUNES
                        </th>
                        <th>
                            MARTES
                        </th>
                        <th>
                            MIERCOLES
                        </th>
                        <th>
                            JUEVES
                        </th>
                        <th>
                            VIERNES
                        </th>
                        <th>
                            SABADO
                        </th>    
                    </tr>
                           </thead>
                    <tr>
                        
                        <td>
                            <input class="form-control" type="text" name="lunes" placeholder="00:00 - 00:00" size="10" value="<%=terapeuta[6]%>"/> 
                        </td>
                        <td>
                            <input class="form-control" type="text" name="martes" placeholder="00:00 - 00:00" size="10" value="<%=terapeuta[7]%>"/> 
                        </td>
                        <td>
                            <input class="form-control" type="text" name="miercoles" placeholder="00:00 - 00:00" size="10" value="<%=terapeuta[8]%>"/>  
                        </td>
                        <td>
                            <input class="form-control" type="text" name="jueves" placeholder="00:00 - 00:00" size="10" value="<%=terapeuta[9]%>"/>  
                        </td>
                        <td>
                            <input class="form-control" type="text" name="viernes" placeholder="00:00 - 00:00" size="10" value="<%=terapeuta[10]%> "/> 
                        </td>
                        <td>
                            <input class="form-control" type="text" name="sabado" placeholder="00:00 - 00:00" size="10" value="<%=terapeuta[11]%>"/>  
                        </td>     
                    </tr>
                </table>
                        
                        <input type="hidden" name="cedula"value="<%=cedula%>">
                        <button class="btn btn-primary" type="submit"/> Actualizar Horario </button>
        </form>
                        
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body> 
</html>
