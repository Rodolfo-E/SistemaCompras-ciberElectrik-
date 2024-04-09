<%-- 
    Document   : frmMenuPrincipal
    Created on : 14-mar-2021, 14:46:26
    Author     : RODOLFO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
                <%
//Sirve para obtener la raiz del proyecto
String raiz=request.getContextPath();
// Es implementar el metodo

       
        %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sistema CiberElectrik</title>
                      
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome -->
        <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- Ionicons -->
        <link href="../bower_components/Ionicons/css/ionicons.min.css" rel="stylesheet" type="text/css"/>
        <!-- Theme style -->
        <link href="../dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>


        <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
              page. However, you can choose any other skin. Make sure you
              apply the skin class to the body tag so the changes take effect. -->
   <!--     <link rel="stylesheet" href="../dist/css/skins/skin-blue.min.css">-->
   <link href="../dist/css/skins/skin-blue.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>

    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <!-- Main Header -->
            <header class="main-header">
                <a href="logo.png" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels
                    <img src="logo.png" style="height: 60px;width:60px;" class="user-image" alt="User Image"> -->
                    <span class="logo-mini"> <img  src="logo.png"><b>S</b>BL</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg" > <b><img src="logo.png " style="height: 50px;width: 50px;">CiberElectrik </b></span>
                </a>

                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                    <img src="miperfil.jpg" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs"> ${usu}</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="miperfil.jpg" class="img-circle" alt="User Image">

                                        <p>                    
                                            Bienvenido - ${usu}
                                            <small>Usted es,${per} </small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="../intranet/ingreso/frmIngreso.jsp" class="btn btn-default btn-flat">Cerrar Session</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">

                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">

                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="miperfil.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Bienvenido,  ${usu} </p>
                            <!-- Status -->
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- search form (Optional) 
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->

                    <!-- Sidebar Menu -->
                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header">INICIO</li>
                        <!-- Optionally, you can add icons to the links -->
                        <li class="active"><a href="<%= raiz %>/Control?menu=Producto&accion=catalogo" target="myFrame"><i class="fa fa-cart-arrow-down"></i> <span>Catalogo</span></a></li>
                        <li class="treeview">
                            <a href="#"><i class="glyphicon glyphicon-th-large"></i> <span>Mantenimiento</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="<%= raiz %>/Control?menu=Categoria&accion=mostrar" target="myFrame"><i class="fa fa-archive"></i>Categorias</a></li>
                                <li><a href="#"><i class="fa fa-tags"></i>Marcas</a></li>
                                <li><a href="<%= raiz %>/Control?menu=Producto&accion=mostrar" target="myFrame"><i class="fa fa-cube"></i>Productos</a></li>
                                  <li><a href="<%= raiz %>/Control?menu=Proveedor&accion=mostrar" target="myFrame"><i class="fa fa-cube"></i>Proveedor</a></li>
                                  <li><a href="<%= raiz %>/Control?menu=Usuario&accion=mostrar" target="myFrame"><i class="fa fa-cube"></i>Usuario</a></li>
                                 <li><a href="<%= raiz %>/Control?menu=Distrito&accion=mostrar" target="myFrame"><i class="fa fa-cube"></i>Distritos</a></li>
                                <li><a href="<%= raiz %>/Control?menu=Cliente&accion=mostrar" target="myFrame"><i class="fa fa-users"></i>Clientes</a></li>
                                

                            </ul>
                        </li>
                      <!--  <li class="treeview">
                            <a href="#"  ><i class="fa fa-cart-arrow-down"></i> <span>Catalogo</span>
                                  <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                                    <ul class="treeview-menu">
                                <li><a href="<%= raiz %>/Control?menu=Producto&accion=catalogo" target="myFrame"><i class="fa fa-cart-arrow-down"></i>Mi Catalogo</a></li>
                              
                            </ul>
                        </li>-->
                        <li class="treeview">
                            <a href=><i class="fa fa-cart-arrow-down"></i> <span>Ventas</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="<%= raiz %>/Control?menu=Carrito&accion=mostrar" target="myFrame"><i class="fa fa-cart-arrow-down"></i>Nueva Venta</a></li>
                                  
                 
                                <li><a href="#"><i class="fa fa-tags"></i>Administrar Ventas</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-area-chart"></i> <span>Reportes</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-bar-chart"></i>Reportes Ventas</a></li>
                                <li><a href="<%= raiz %>/intranet/mantenimiento/distrito/rptDistrito.jsp" target="myFrame"><i class="fa fa-bar-chart"></i>Reportes Distrito</a></li>
                                <li><a href="<%= raiz %>/intranet/mantenimiento/usuario/rptUsuario.jsp"  target="myFrame"><i class="fa fa-bar-chart"></i>Reportes Usuario</a></li>
                                               <li><a href="<%= raiz %>/intranet/mantenimiento/categoria/rptCategoria.jsp" target="myFrame"><i class="fa fa-bar-chart"></i>Reportes Categoria</a></li>
                                                    <li><a href="<%= raiz %>/intranet/mantenimiento/proveedor/rptProveedor.jsp" target="myFrame"><i class="fa fa-bar-chart"></i>Reportes Proveedor</a></li>
                                                            <li><a href="<%= raiz %>/intranet/mantenimiento/producto/rptProducto.jsp" target="myFrame"><i class="fa fa-bar-chart"></i>Reportes Producto</a></li>
                                                <li><a href="<%= raiz %>/intranet/mantenimiento/cliente/rptCliente.jsp" target="myFrame"><i class="fa fa-bar-chart"></i>Reportes Cliente</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
            </aside>

        
         <div class="content-wrapper">
               
                <!--   <section class="content-header">
                    <h1>
                        Page Header
                        <small>Optional description</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li class="active">Panel Administrativo</li>
                    </ol>
                </section>-->

             <!--   <section class="content"  -->
                    <div class="m-4" style="height: 590px; ">
                        
                      <iframe  name="myFrame" style="height: 100%; width: 100%; border: none" ></iframe>
                      
                      </div>
                <!--        <div class="row">
                        <div class="col-lg-3 col-xs-6">
                       
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3>150</h3>

                                    <p>Nuevos Clientes</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                                <a href="#" class="small-box-footer">Más info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                       
                        <div class="col-lg-3 col-xs-6">
                         
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3>53<sup style="font-size: 20px">%</sup></h3>

                                    <p>Bounce Rate</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-stats-bars"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        
                        <div class="col-lg-3 col-xs-6">
                     
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3>44</h3>

                                    <p>User Registrations</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-add"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        
                        <div class="col-lg-3 col-xs-6">
                         
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3>65</h3>

                                    <p>Unique Visitors</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-pie-graph"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                      
                    </div>-->
           <!--     </section>-->
                
            </div> 
            <!-- /.content-wrapper -->

            <!-- Main Footer -->
            <footer class="main-footer">
                <!-- To the right -->
                <div class="pull-right hidden-xs">
                   Sistema CiberElectrik
                </div>
                <!-- Default to the left -->
                <strong>Copyright &copy; 2020 <a href="#">Rodolfo Delgado</a>.</strong> Todos los derechos reservados.
            </footer>

            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <!-- jQuery 3 -->
        
        <script src="../bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
      
        <script src="../dist/js/adminlte.min.js" type="text/javascript"></script>
        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. -->
          <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>

