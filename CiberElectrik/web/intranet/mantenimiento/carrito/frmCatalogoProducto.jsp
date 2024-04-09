<%-- 
    Document   : frmCatalogoProducto
    Created on : 28-mar-2021, 20:35:09
    Author     : RODOLFO
--%>

<%@page import="CiberElectrik.imp.ImpProducto"%>
<%@page import="CiberElectrik.dao.DaoProducto"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%-- Autor:Rodolfo Delgado  --%>
    <head>
        <%
//Sirve para obtener la raiz del proyecto
            String raiz = request.getContextPath();
// Es implementar el metodo
            DaoProducto daoProducto = new ImpProducto();

        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon " href="# "/>
        <link href="<%= raiz%>/intranet/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= raiz%>/intranet/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="<%= raiz%>/intranet/js/jquery-3.3.1.slim.min.js"  type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/popper.min.js" type="text/javascript"></script>
           <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
       
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

        <title>Mostrar Producto</title>
         <script>
            $(document).ready(function() {
                $("#txtBus").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#myTable tr").filter(function() {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });

        </script>
    </head>
    <body >
        <div class="container">
            <h1 style="text-align: center">Catalogo Producto</h1>
            <div class="form-horizontal" role="form">
                    <div class="table-responsive">
              <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            
                    
                       <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                            
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        
                    <li class="nav-item active">
                        <a class="nav-link" href="Controla?accion=Nuevo"><i class="fas fa-home"></i> Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./Controlador?accion=home"><i class="fas fa-plus-circle"></i> Ofertas del Dia</a>
                    </li>                   
                    <li class="nav-item">
                        <a class="nav-link" href="Controla?accion=Carrito"><i class="fas fa-cart-plus">(<label style="color: darkorange">${contador}</label>)</i> Carrito</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="./Controlador?accion=NuevoProducto">Productos</a>
                    </li> 
                           </ul>
                      <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <!--<form class="form-inline my-2 my-lg-0">-->
                    <input style="width:400px" class="form-control mr-sm-2" name="txtBuscar"  id="txtBuscar">
                    <button class="btn btn-outline-info my-2 my-sm-0" id="btnBuscar"><i class="fas fa-search"></i> Buscar</button>
                    <!-- </form>       -->                 
                </ul>                                
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie">${logueo}</i> </a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a class="dropdown-item" href="#"><img src="image/user.png" alt="60" height="60"/></a>                        
                       <!--  <a class="dropdown-item" href="#">${logueo}</a>-->
                       <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${correo}</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Controlador?accion=MisCompras">Mis Compras</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Controla?accion=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>     
                </div>
               </nav>
                
             <!--       <div class="form-group">
                        <label for="txtBus">Ingrese un valor de Busqueda </label>
                        <input type="text" class="form-control " id="txtBus" name="txtBus" placeholder="Buscar..." required>

                    </div>-->
                    <table style="text-align: center" class="table table-bordered table-striped table-hover">
                        <p></p>
                        <tbody  >
                            <%
                                int salto=0;
                                for (int i = 0; i < daoProducto.MostrarProducto().size(); i++) {
                            %>
                        <th > <img src="image/<% out.println(daoProducto.MostrarProducto().get(i).getFoto());%>" width="140px" height="140px"><p>
                                <label > Codigo:<% out.println(daoProducto.MostrarProducto().get(i).getCodigo());%></label> <br>
                               <label>  Descripcion:<% out.println(daoProducto.MostrarProducto().get(i).getNombre());%></label><br>
                                <label> Precio:  <% out.println(daoProducto.MostrarProducto().get(i).getPrecio());%></label><br>
                                <label> Stock:<% out.println(daoProducto.MostrarProducto().get(i).getCantidad());%></label><p>
                             
                     
                                

                                <a href="<%= raiz %>/Controla?accion=agregarCarrito&x=<% out.println(daoProducto.MostrarProducto().get(i).getCodigo());%>" class="btn btn-success">Agregar Carrito</a>
                                <a href="<%= raiz %>/Controla?accion=Comprar&x=<% out.println(daoProducto.MostrarProducto().get(i).getCodigo());%> " class="btn btn-danger">Añadir</a>
                            </th>
                             <% 
                             salto++;
                             if(salto==4){
                             %>
                             <tr>
                            <% 
                                salto=0;
                                     }
                              }
                            %>
                        </tbody>
                    </table>
                </div>
              <!-- Modal Iniciar Session o Registrarse -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="container col-lg-9">                   
                    <div class="modal-content">                   
                        <div class="pr-2 pt-1">                         
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                            </button>                    
                        </div>
                        <div class="text-center">                         
                            <img src="image/user.png" width="100" height="100">                         
                        </div>
                        <div class="modal-header text-center">                      
                            <ul class="nav nav-pills">                           
                               <!-- <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                                </li>
                                <!--
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                                </li>        -->                  
                            </ul>  
                        </div>
                        <div class="modal-body"> 
                            <div class="tab-content" id="pills-tabContent">
                                <!-- Iniciar Session -->
                                <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                    <form action="Controla">
                                        <div class="form-group">
                                            <label>Usuario</label>
                                            <input type="text" name="txtemail" class="form-control" >
                                        </div>
                                        <div class="form-group">
                                            <label>Clave</label>
                                            <input type="password" name="txtpass" class="form-control" >
                                        </div>                                   
                                        <button type="submit" name="accion" value="Validar" class="btn btn-outline-danger btn-block">Iniciar</button>
                                    </form>
                                </div>
                                <!-- Registrarse -->
                                <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                                    <form action="Controla">                               
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Leo Perez">
                                        </div>
                                        <div class="form-group">
                                            <label>Dni</label>
                                            <input type="text" maxlength="8" name="txtdni" class="form-control" placeholder="01245678">
                                        </div>
                                        <div class="form-group">
                                            <label>Direccion</label>
                                            <input type="text" name="txtdire" class="form-control" placeholder="Chiclayo - La Victoria">
                                        </div>
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                  
                                        <button type="submit" name="accion" value="Registrar" class="btn btn-outline-danger btn-block">Crear Cuenta</button>
                                    </form>
                                </div>                          
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>


            </div>
        </div>
                        
                         <script>
                            $(document).ready(function (){
                                $("#txtBus").on("keyup", function(){
                                    var value=$(this).val().toLowerCase();
                                    $("#myTable tr").filter(function (){
                                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                    });
                                });
                            });
                        </script>
    </body>
              <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>