<%-- 
    Document   : registrarPT
    Created on : 13-dic-2015, 18:14:30
    Author     : Wolf
--%>

<%@page import="onbuild.Acceso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<%HttpSession sesion = request.getSession();
    String nom = sesion.getAttribute("usuario") + "";
    String priv = sesion.getAttribute("privilegio") + "";

    if (priv.equals("3")) {
        response.sendRedirect("paciente.jsp");

    } else if (priv.equals("4")) {
        response.sendRedirect("tutor.jsp");

    } else if (priv.equals("2")) {

    } else if (priv.equals("1")) {
        response.sendRedirect("admin.jsp");
    } else {
        response.sendRedirect("loginp.jsp");
    } %>

<%-- 
Otenemos la cedula del terapeuta para poder hacer la relación
--%>
<%
    Acceso conex = new Acceso();
    String terapeuta[] = conex.consultarDatosTerapeuta(nom);
    String nombre = terapeuta[0];
    String paterno = terapeuta[1];
    String materno = terapeuta[2];
    String cedula = terapeuta[3];
%>

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
                            <a href="#"><i class="fa fa-dashboard fa-fw"></i> MENU DEL TERAPEUTA</a>
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
                        <br>
                        <div class="panel panel-default">
                            <div class="panel-heading">Registro de un paciente</div>
                            <div class="panel-body">
                                <div class="row">
                                    <center><h2>Datos del paciente</h2></center>
                                    <form role="form" action="RegistrarP" name="" method="post">
                                        <div class="form-group row">
                                            <label for="nom" class="col-sm-2 form-control-label"> Nombre</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="name" name="nom" placeholder="Nombre"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="app" class="col-sm-2 form-control-label">Apellido Paterno</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="app" name="app" placeholder="Apellido Paterno"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="apm" class="col-sm-2 form-control-label">Apellido Materno</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="apm" name="apm" placeholder="Apellido Materno"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="curp_paciente" class="col-sm-2 form-control-label">CURP</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="curp_paciente" name="curp_paciente" placeholder="CURP"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="fecn" class="col-sm-2 form-control-label">Fecha de Nacimiento</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="date" id="fecn"min="1980-01-01" max="2011-12-31" />
                                        </div>
                                        </div>
                                       <div class="form-group row">
                                            <label for="esc" class="col-sm-2 form-control-label">Escolaridad</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="esc" name="esc" placeholder="Escolaridad"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="sex" class="col-sm-2 form-control-label">Sexo</label>
                                        <div class="col-lg-8">
                                            <div class="radio">
                                                <label> <input type="radio" value="Masculino" name="sex"/> Masculino</label>
                                            </div>
                                            <div class="radio">
                                                <label> <input type="radio" value="Femenino" name="sex"/> Femenino</label>
                                            </div>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="edad" class="col-sm-2 form-control-label">Edad (años)</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="number" id="edad" name="edad"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="lat" class="col-sm-2 form-control-label">Lateralidad</label>
                                        <div class="col-lg-8">
                                            <div class="radio">
                                                <label> <input type="radio" value="Zurdo" name="lat"/> Zurdo</label>
                                            </div>
                                            <div class="radio">
                                                <label> <input type="radio" value="Diestro" name="lat"/> Diestro</label>
                                            </div>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="user" class="col-sm-2 form-control-label">Nombre de usuario</label>
                                        <div class="col-lg-4">
                                        <input class="form-control" type="text" id="user" name="nick" placeholder="usuario"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="pass" class="col-sm-2 form-control-label">Contraseña</label>
                                        <div class="col-lg-4">
                                        <input class="form-control" type="text" id="pass" name="cla" placeholder="contraseña"/>
                                        </div>
                                        </div>
                                        <!--Se establece el numero 3 para privilegios de paciente-->
                                        <input type="hidden" name="priv_paciente" value="3"/>
                                       
                                        <center><h2>Datos del tutor</h2></center>
                                        <div class="form-group row">
                                            <label for="nomt" class="col-sm-2 form-control-label">Nombre del tutor</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="nomt" name="nomt" placeholder="Nombre tutor"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="apt" class="col-sm-2 form-control-label">Apellido Paterno</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="appt" name="appt" placeholder="Apellido paterno"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="apmt" class="col-sm-2 form-control-label">Apellido Materno</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="apmt" name="apmt" placeholder="Apellido materno tutor"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="curp_tutor" class="col-sm-2 form-control-label">CURP (Tutor)</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="curp_tutor" name="curp_tutor" placeholder="CURP"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="calle" class="col-sm-2 form-control-label">Calle</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="calle" name="calle" placeholder="calle"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="ne" class="col-sm-2 form-control-label">No. Exterior</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="ne" name="ne" placeholder="numero exterior"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="ni" class="col-sm-2 form-control-label">No. Interior</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="ni" name="ni" placeholder="numero interior"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="col" class="col-sm-2 form-control-label">Colonia</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="col" name="col" placeholder="colonia"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="del" class="col-sm-2 form-control-label">Delegación</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" type="text" id="del" name="del" placeholder="delegacion"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="cp" class="col-sm-2 form-control-label">Código Postal</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="cp" name="cp" placeholder="codigo postal"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="cd" class="col-sm-2 form-control-label">Ciudad</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" type="text" id="cd" name="cd" placeholder="ciudad"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="tel" class="col-sm-2 form-control-label">Telefono</label>
                                        <div class="col-lg-8">
                                        <input class="form-control" type="text" id="tel" name="tel" placeholder="telefono"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="nickt" class="col-sm-2 form-control-label">Nombre de usuario</label>
                                        <div class="col-lg-4">
                                        <input class="form-control" type="text" id="nickt" name="nickt" placeholder="usuario"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="clat" class="col-sm-2 form-control-label">Contraseña</label>
                                        <div class="col-lg-4">
                                        <input class="form-control" type="text" id="clat" name="clat" placeholder="contraseña"/>
                                        </div>
                                        </div>
                                        <input type="hidden" name="priv_tutor" value="4"/>
                                        <input type="hidden" name="cedula" value="<%=cedula%>">
                                        <div class="form-group row">
                                            <label for="boton" class="col-sm-2 form-control-label"></label>
                                        <div class="col-lg-4">
                                         <button type="submit" class="btn btn-warning">Registrar información</button>
                                        </div>
                                        </div>

                                    </form>
                                </div>

                            </div>
                        </div>



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
