<%-- 
    Document   : frmCarrito
    Created on : 07-abr-2021, 3:58:24
    Author     : RODOLFO
--%>

<%@page import="CiberElectrik.Bean.Fecha"%>
<%@page import="CiberElectrik.imp.ImpProducto"%>
<%@page import="CiberElectrik.dao.DaoProducto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
           <%
//Sirve para obtener la raiz del proyecto
            String raiz = request.getContextPath();
// Es implementar el metodo
            DaoProducto daoProducto = new ImpProducto();

        %>
        <style>
            @media print{
                .btn,.desa,.accion{
                    display: none;
                }
            }
        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="<%= raiz%>/intranet/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= raiz%>/intranet/css/font-awesome.css" rel="stylesheet" type="text/css"/>
             <link href="<%= raiz%>/intranet/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="<%= raiz%>/intranet/js/jquery-3.3.1.slim.min.js"  type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/popper.min.js" type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/bootstrap.min.js" type="text/javascript"></script>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
              
        <title>JSP Page</title>
    </head>
    <body>
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
                        <a class="nav-link" href="Control?menu=Carrito&accion=mostrar"> Seguir Comprando</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="./Controlador?accion=NuevoProducto">Productos</a>
                    </li> 
                           </ul>
                       <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i>${logueo} </a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a class="dropdown-item" href="#"><img src="image/user.png" alt="60" height="60"/></a>                        
                     <!--    <a class="dropdown-item" href="#">${per}</a>
                       <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${per}</a>
                        <div class="dropdown-divider"></div>-->
                        <a class="dropdown-item" href="Controlador?accion=MisCompras">Mis Compras</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Controlador?accion=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>   
                </div>
               </nav>
        
      <div class="container mt-4">
          <div class="d-flex" style="margin-bottom: 10px">
              <!--  
                <label style="margin-right: 5px">Nro Serie:</label>
                <input type="number"  style="width: 100px; padding-bottom: 10px;"   class=" form-control text-center" value="000002">-->
               
                <br>
                <%
                    Fecha fechaSistema = new Fecha();
                %>                     
                <p class="ml-auto"><%= fechaSistema.Fecha()%></p>      
                      
            </div >                    
            <div class="row">             
                <div class="col-lg-9">                 
                    <table class="table">
                        <thead class="thead-light">
                            <tr class="text-center">
                                <th>Item</th>                               
                                <th class="accion">Articulo</th>
                                <th>Descripcion</th>
                                <th>Precio</th>
                                <th>Cantidad</th>                       
                                <th>Total</th>                       
                                <th class="accion">Acciones</th>                       
                            </tr>
                        </thead>
                        <tbody>
                           
                            <c:forEach var="car" items="${carrito}"> 
                                <tr class="text-center tr">
                                    <td>${car.getItem()}</td>                                   
                                    <td class="accion">
                                     <img src="image/${car.getFoto()}" width="130" height="110">
                                    </td>
                                    <td>${car.getDescripcion()}</td>
                                    <td>${car.getPreciocompra()}</td>
                                    <td> 
                             
                                        
                                        <input type="hidden" id="codpro" name="codpro"  value="${car.getCodigoproducto()}">
                                      <input type="number" min="1"  id="Cantidad"   name="Cantidad"  class=" form-control text-center" value="${car.getCantidad()}">
                                         
                                    </td>  
                                    <td>${car.getSubtotal()}</td>                           
                                   <td class="text-center accion">                                         
                                        <!--<input type="hidden" id="codp" name="codp" value="${car.getCodigoproducto()}">-->
                                        <a id="deleteItem" href="Controla?accion=Eliminar&codp=${car.getCodigoproducto()}" class="btn"><i class="fas fa-trash-alt"></i></a>                                            
                                    </td>                                
                                </tr>
                            </c:forEach>
                        
                        </tbody>
                    </table>                    
                </div>
                <div class="col-lg-3">    
                   
                    <div class="card">
                        <div class="card-header accion">
                            <h3>Generar Compra</h3>
                        </div>
                        <div class="card-body">
                          <!--  <label>Subtotal:</label>
                            <a class="form-control text-center"><i class="fas fa-dollar-sign h5" > ${totalPagar}0</i></a>
                            <label>Precio Envio:</label>
                            <a class="form-control text-center"><i class="fas fa-dollar-sign h5"> 0.00</i></a>
                            <label>Descuento:</label>
                            <a class="form-control text-center"><i class="fas fa-dollar-sign h5"> 0.00</i></a>
                            <label>Total a Pagar:</label>
                            <a class="form-control text-center"><i class="fas fa-dollar-sign h4 primary"> ${totalPagar}0</i></a>-->
                          <label class="accion" >SubTotal:</label>
                          <input  class="accion" type="text" value="S/.${totalPagar}0" readonly class="form-control">
                          <label  class="accion">Descuento:</label>
                          <input class="accion"  type="text" value="S/.0.00" readonly class="form-control">
                              <label>Total a Pagar:</label>
                          <input type="text" value="S/.${totalPagar}0" readonly class="form-control">
                        </div>
                        <div class="card-footer desa">
                            <a href="Controla?accion=GenerarCompra" class="btn btn-danger btn-block">Generar Compra</a>
                            <a href="#" data-toggle="modal" data-target="#myModalPago" class="btn btn-info btn-block">Realizar Pago</a>
                            <a href="#" data-toggle="modal" onclick="print()" class="btn btn-warning btn-block">Comprobante</a>
                        </div>
                    </div>
                </div>
            </div>          
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
                            <img src="img/user.png" width="100" height="100">                         
                        </div>
                        <div class="modal-header text-center">                      
                            <ul class="nav nav-pills">                           
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                                </li>
                              <!--  <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                                </li> -->                         
                            </ul>  
                        </div>
                        <div class="modal-body"> 
                            <div class="tab-content" id="pills-tabContent">
                                <!-- Iniciar Session -->
                                <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                    <form action="Controlador">
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                   
                                        <button type="submit" name="accion" value="Validar" class="btn btn-danger btn-block">Iniciar</button>
                                    </form>
                                </div>
                                <!-- Registrarse -->
                                <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                                    <form action="Controlador">                               
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Leo Perez">
                                        </div>
                                        <div class="form-group">
                                            <label>Dni</label>
                                            <input type="number" name="txtdni" class="form-control" placeholder="01245678">
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
                                        <button type="submit" name="accion" value="Registrar" class="btn btn-danger btn-block">Crear Cuenta</button>
                                    </form>
                                </div>  
                            </div> 
                     
                        </div>
                    </div>
                </div>
            </div>
        </div>     
                          <!-- Modal de Pago -->
        <div class="modal fade" id="myModalPago" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">         
                <div class="modal-content">                   
                    <div class="modal-header text-center"> 
                        <label><i class="fa-dollar-sign"></i>Realizar Pago</label>
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span>
                        </button>  
                    </div>
                    <div class="modal-body"> 
                        <div class="tab-content" id="pills-tabContent">
                            <!-- Metodo Pago -->
                            <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                <form action="Controla">
                                    <div class="form-group">
                                        <label>Card address</label>
                                        <input type="text" class="form-control" placeholder="9999-9999-9999-9999">
                                    </div>
                                    <div class="form-group">
                                        <label>Codigo Seguridad</label>
                                        <input type="text" class="form-control" placeholder="xxxx">
                                    </div>
                                    <div class="form-group">
                                        <label>Monto</label>
                                        <input type="text" name="txtmonto" value="$.${totalPagar}0" class="form-control h1">
                                    </div>                                   
                                    <button type="submit" name="accion" value="RealizarPago" class="btn btn-info btn-block">Pagar</button>
                                </form>
                            </div>

                        </div> 
                    </div>
                </div>
            </div>
        </div>
         <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      
       <script src="../../../js/funciones.js" type="text/javascript"></script>
    </body>
</html>
