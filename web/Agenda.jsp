<%-- 
    Document   : Diagnosticar
    Created on : 11-ene-2016, 21:20:47
    Author     : Wolf
--%>
<%@page import="onbuild.Acceso"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%HttpSession sesion = request.getSession();
    String nom = sesion.getAttribute("usuario") + "";
    String priv = sesion.getAttribute("privilegio") + "";
    String clave = sesion.getAttribute("pass") + "";

    if (priv.equals("3")) {
        response.sendRedirect("paciente.jsp");

    } else if (priv.equals("4")) {
        response.sendRedirect("tutor.jsp");

    } else if (priv.equals("1")) {
        response.sendRedirect("admin.jsp");
    } else if (priv.equals("2")) {

    } else {
        response.sendRedirect("loginp.jsp");
    }

%>
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
            String[] terapeuta1 = conex.consultarDatosTerapeuta(nom);

            String nombre = terapeuta1[0];
            String paterno = terapeuta1[1];
            String materno = terapeuta1[2];
            String cedula = terapeuta1[3];

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
                                        <a href="ConsultarExpediente.jsp">Expedientes</a>
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

                            <%--  Se hace un desplegado de las sesiones por fecha solo para el terapeuta--%>
                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Consultar sesiones por fecha
                                </div>
                                <%//Declaramos las variables
                                    String userTerapeuta = nom;
                                    String fecha = request.getParameter("fecha");
                                %>
                                <div class="panel-body"> <!--Panel body 1-->
                                    <div class="row">
                                        <div class="col-lg-3">    
                                            <form role="form" method="get" action="Agenda.jsp">
                                                <label>Fecha </label>
                                                <input class="form-control" type="date" placeholder="dd/mm/aaaa" name="fecha" min="1980-01-01" max="2020-01-01"/><br>
                                                <input type="hidden" name="user_terapeuta" value="<%=userTerapeuta%>"/><br>
                                                <button type="submit" class="btn btn-warning"> Ver sesiones</button>
                                            </form>
                                        </div><!--Col-lg-3-->
                                        <div class="col-lg-9">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                CURP
                                                            </th>
                                                            <th>
                                                                Fecha
                                                            </th>
                                                            <th>
                                                                Hora
                                                            </th>
                                                            <th>
                                                                No_sesion
                                                            </th>
                                                            <th>
                                                                Observaciones
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <%
                                                        /*Establecemos un conexion para obtener los datos del terapeuta*/
                                                        Acceso conexion = new Acceso();
                                                        String[] terapeuta = conexion.consultarTerapeuta(nom, clave);

                                                        /*Preparamos la consulta de todos los registros en sesiones*/
                                                        PreparedStatement ps;
                                                        ResultSet rs;
                                                        Acceso ac = new Acceso();

                                                        String query = "SELECT Curp_paciente, Fecha, Hora, No_Sesion, Observaciones FROM sesiones where Cedula=" + terapeuta[0] + " AND Fecha='" + fecha + "'";
                                                        ps = ac.iniCon().prepareStatement(query);
                                                        rs = ps.executeQuery();
                                                        while (rs.next()) {
                                                    %>

                                                    <tr>
                                                        
                                                        <td>
                                                            <a href="Expediente.jsp?curpPaciente=<%=rs.getString("Curp_paciente")%>"</a><%out.print(rs.getString("Curp_paciente")); %> 
                                                        </td>
                                                        <td>
                                                            <% out.print(rs.getString("Fecha")); %>
                                                        </td>
                                                        <td>
                                                            <% out.print(rs.getString("Hora")); %>
                                                        </td>
                                                        <td>
                                                            <% out.print(rs.getString("No_sesion")); %>
                                                        </td>
                                                        <td>
                                                            <% out.print(rs.getString("Observaciones")); %>
                                                        </td>

                                                    </tr>
                                                    <% }%>
                                                </table>  
                                            </div> <!--Table resposive-->   

                                        </div><!--div class lg 9-->
                                    </div> <!--Row-->   


                                </div><!--Panel Body 1-->
                            </div><!--Body del primer contenedor-->    
                               

                                <%-- 
                                    Despliega el formulario para obtener la información y agendar una sesion
                                    con el terapeuta.
                                --%>    

                            <div class="panel panel-default"> <!--Contenedor 2-->
                                <div class="panel-heading">
                                    Agenda una sesion
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-3">    

                                            <form role="form" method="post" action="Agenda">
                                                <label>CURP</label>
                                                <input class="form-control" placeholder="CURP del paciente" name="curp_paciente"/>
                                                <input type="hidden" name="user_terapeuta" value="<%=userTerapeuta%>"/>
                                                <label>Fecha</label>
                                                <input class="form-control" type="date" placeholder="dd/mm/aaaa" name="fecha" min="1980-01-01" max="2020-01-01"/>
                                                <label>Hora</label>
                                                <input class="form-control" placeholder="00:00" name="hora"/>
                                                <label>No. de Sesion</label>
                                                <input class="form-control" name="no_sesion"/>
                                                <label>Observaciones</label>
                                                <input class="form-control" name="observaciones"/>
                                                <button type="submit" class="btn btn-warning"> Agendar</button>
                                            </form>


                                        </div><!--Col-lg-3-->
                                        <div class="col-lg-9">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                CURP
                                                            </th>
                                                            <th>
                                                                Fecha
                                                            </th>
                                                            <th>
                                                                Hora
                                                            </th>
                                                            <th>
                                                                No_sesion
                                                            </th>
                                                            <th>
                                                                Observaciones
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <%
                                                        /**
                                                         * Se realiza la consulta
                                                         * solo de las sesiones
                                                         * relacionadas entre el
                                                         * Terapeuta y el Paciente.
                                                         */

                                                        ps = ac.iniCon().prepareStatement("SELECT Curp_paciente, Fecha, Hora, No_Sesion, Observaciones FROM sesiones where Cedula=" + terapeuta[0]);
                                                        rs = ps.executeQuery();
                                                        while (rs.next()) {
                                                    %>

                                                    <tr id="tabla">
                                                        <td>
                                                            <a href="Expediente.jsp?curpPaciente=<%=rs.getString("Curp_paciente")%>"</a><%out.print(rs.getString("Curp_paciente")); %> 
                                                        </td>
                                                        <td>
                                                            <% out.print(rs.getString("Fecha")); %>
                                                        </td>
                                                        <td>
                                                            <% out.print(rs.getString("Hora")); %>
                                                        </td>
                                                        <td>
                                                            <% out.print(rs.getString("No_sesion")); %>
                                                        </td>
                                                        <td>
                                                            <% out.print(rs.getString("Observaciones")); %>
                                                        </td>

                                                    </tr>
                                                    <% }%>
                                                </table>  
                                            </div> <!--Table resposive-->   

                                        </div><!--div class lg 9-->
                                    </div> <!--Row-->   


                                </div><!--Panel Body-->   




                            </div>
                            <!-- /.col-lg-12 -->
                        </div><!-- /.row CONTENIDO PRINCIPAL -->

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
