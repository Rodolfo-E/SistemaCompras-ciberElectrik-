<%-- 
    Document   : frmMostrarProducto
    Created on : 20-feb-2020, 10:56:34
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpProducto"%>
<%@page import="CiberElectrik.dao.DaoProducto"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%-- CREADOR:Rodolfo Delgado  --%>
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
        <script src="<%= raiz%>/intranet/js/bootstrap.min.js" type="text/javascript"></script>

        <title>Mostrar Producto</title>
    </head>
    <body>
        <div class="container">
            <h1>Mantenimiento Producto</h1>
            <div class="form-horizontal" role="form">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover">
                        <thead class="thead-dark">
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                         <th>Foto</th>
                        <th>Proveedor</th>
                        <th>Categoria</th>
                        <th>Estado</th>
                        <th>Actualizar</th>
                        <th>Eliminar</th>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < daoProducto.MostrarProducto().size(); i++) {
                            %>
                            <tr>
                                <td><% out.println(daoProducto.MostrarProducto().get(i).getCodigo());%></td>
                                <td><% out.println(daoProducto.MostrarProducto().get(i).getNombre());%></td>
                                <td><% out.println(daoProducto.MostrarProducto().get(i).getCantidad());%></td>
                                <td><% out.println(daoProducto.MostrarProducto().get(i).getPrecio());%></td>
                              <!--  <td><img src="ControllerImg?cod=<% out.println(daoProducto.MostrarProducto().get(i).getCodigo());%> " width="120px" height="100px"></td>-->
                                <td><img src="image/<% out.println(daoProducto.MostrarProducto().get(i).getFoto());%>" width="120px" height="100px"></td>
                                <td><% out.println(daoProducto.MostrarProducto().get(i).getProveedor().getNombre());%></td>
                                     <td><% out.println(daoProducto.MostrarProducto().get(i).getCategoria().getNombre());%></td>
                                <%
                                    String est = "";
                                    if (daoProducto.MostrarProducto().get(i).isEstado()) {
                                        est = "Habilitado";
                                    } else {
                                        est = "Deshabilitado";
                                    }
                                %>
                                <td><%= est%></td>

                                <td><a href="<%= raiz %>/Control?menu=Producto&accion=actualizar&x=<% out.println(daoProducto.MostrarProducto().get(i).getCodigo());%>" class="btn btn-success">Seleccionar</a></td>
                                <td><a href="<%= raiz %>/Control?menu=Producto&accion=eliminar&x=<% out.println(daoProducto.MostrarProducto().get(i).getCodigo());%> " class="btn btn-danger">Seleccionar</a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
               <a href="<%= raiz %>/Control?menu=Producto&accion=registrar"  class="btn btn-primary">
                        Registrar Producto
                        
                    </a>

               <a href="<%= raiz %>/Control?menu=Producto&accion=buscar" class="btn btn-warning">
                        Buscar Producto
                        
                    </a>
            </div>
        </div>
    </body>
</html>


