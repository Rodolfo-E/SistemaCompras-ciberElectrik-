<%-- 
    Document   : frmMostrarProveedor
    Created on : 19-feb-2020, 20:00:05
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpProveedor"%>
<%@page import="CiberElectrik.dao.DaoProveedor"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%-- Autor:Rodolfo Delgado  --%>
    <head>
        <%
//Sirve para obtener la raiz del proyecto
            String raiz = request.getContextPath();
// Es implementar el metodo
            DaoProveedor daoProveedor = new ImpProveedor();

        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon " href="# "/>
        <link href="<%= raiz%>/intranet/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= raiz%>/intranet/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="<%= raiz%>/intranet/js/jquery-3.3.1.slim.min.js"  type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/popper.min.js" type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/bootstrap.min.js" type="text/javascript"></script>

        <title>Mostrar Proveedor</title>
    </head>
    <body>
        <div class="container">
            <h1>Mantenimiento Proveedor</h1>
            <div class="form-horizontal" role="form">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover">
                        <thead class="thead-dark">
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>Correo</th>
                        <th>Ruc</th>
                        <th>Distrito</th>
                        <th>Estado</th>
                        <th>Actualizar</th>
                        <th>Eliminar</th>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < daoProveedor.MostrarProveedor().size(); i++) {
                            %>
                            <tr>
                                <td><% out.println(daoProveedor.MostrarProveedor().get(i).getCodigo());%></td>
                                <td><% out.println(daoProveedor.MostrarProveedor().get(i).getNombre());%></td>
                                <td><% out.println(daoProveedor.MostrarProveedor().get(i).getDireccion());%></td>
                                <td><% out.println(daoProveedor.MostrarProveedor().get(i).getTelefono());%></td>
                                <td><% out.println(daoProveedor.MostrarProveedor().get(i).getCorreo());%></td>
                                <td><% out.println(daoProveedor.MostrarProveedor().get(i).getRuc());%></td>
                                <td><% out.println(daoProveedor.MostrarProveedor().get(i).getDistrito().getNombre());%></td>
                                <%
                                    String est = "";
                                    if (daoProveedor.MostrarProveedor().get(i).isEstado()) {
                                        est = "Habilitado";
                                    } else {
                                        est = "Deshabilitado";
                                    }
                                %>
                                <td><%= est%></td>

                                <td><a href="<%= raiz %>/Control?menu=Proveedor&accion=actualizar&x=<% out.println(daoProveedor.MostrarProveedor().get(i).getCodigo());%>" class="btn btn-success">Seleccionar</a></td>
                                <td><a href="<%= raiz %>/Control?menu=Proveedor&accion=eliminar&x=<% out.println(daoProveedor.MostrarProveedor().get(i).getCodigo());%> " class="btn btn-danger">Seleccionar</a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
                <a href="<%= raiz %>/Control?menu=Proveedor&accion=registrar" class="btn btn-primary">
                    Registrar Proveedor

                </a>
               
                   <a href="<%= raiz %>/Control?menu=Proveedor&accion=buscar" class="btn btn-warning">
                        Buscar Proveedor                  
                    </a>
            </div>
        </div>
    </body>
</html>

