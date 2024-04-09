<%-- 
    Document   : frmBuscarOrdenCompra
    Created on : 12-abr-2021, 2:07:24
    Author     : RODOLFO
--%>

<%@page import="CiberElectrik.imp.ImpProveedor"%>
<%@page import="CiberElectrik.dao.DaoProveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <%
            String raiz=request.getContextPath();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
           DaoProveedor daoProveedor = new ImpProveedor();
           %>
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

                                <td><a href="<%= raiz %>/Control?menu=Compra&accion=buscar&x=<% out.println(daoProveedor.MostrarProveedor().get(i).getCodigo());%>" class="btn btn-success">Seleccionar</a></td>
                                <td><a href="<%= raiz %>/Control?menu=Proveedor&accion=eliminar&x=<% out.println(daoProveedor.MostrarProveedor().get(i).getCodigo());%> " class="btn btn-danger">Seleccionar</a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
              
            </div>
           
         </div>
    </body>
</html>
