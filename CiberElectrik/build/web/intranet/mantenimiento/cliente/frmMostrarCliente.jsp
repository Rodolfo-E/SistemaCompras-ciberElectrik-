
<%@page import="CiberElectrik.imp.ImpCliente"%>
<%@page import="CiberElectrik.dao.daoCliente"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%-- Autor:Rodolfo Delgado  --%>
    <head>
        <%
//Sirve para obtener la raiz del proyecto
            String raiz = request.getContextPath();
// Es implementar el metodo
            daoCliente daoCliente = new ImpCliente();

        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon " href="# "/>
        <link href="<%= raiz%>/intranet/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= raiz%>/intranet/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="<%= raiz%>/intranet/js/jquery-3.3.1.slim.min.js"  type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/popper.min.js" type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/bootstrap.min.js" type="text/javascript"></script>

        <title>Mostrar Cliente</title>
    </head>
    <body>
        <div class="container">
            <h1>Mantenimiento Cliente</h1>
            <div class="form-horizontal" role="form">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover">
                        <thead class="thead-dark">
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                           <th>Usuario</th>
                              <th>Clave</th>                 
                        <th>Direccion</th>
                         <th>Fecha</th>
                        <th>Correo</th>
                        <th>Telefono</th>
                        <th>Celular</th>
                          <th>Distrito</th>
                        <th>Estado</th>
                        <th>Actualizar</th>
                        <th>Eliminar</th>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < daoCliente.MostrarCliente().size(); i++) {
                            %>
                            <tr>
                                <td><% out.println(daoCliente.MostrarCliente().get(i).getCodigo());%></td>
                                <td><% out.println(daoCliente.MostrarCliente().get(i).getNombre());%></td>
                                  <td><% out.println(daoCliente.MostrarCliente().get(i).getApellido());%></td>
                                    <td><% out.println(daoCliente.MostrarCliente().get(i).getUsuario());%></td>
                                      <td><% out.println(daoCliente.MostrarCliente().get(i).getClave());%></td>
                                <td><% out.println(daoCliente.MostrarCliente().get(i).getDireccion());%></td>
                                <td><% out.println(daoCliente.MostrarCliente().get(i).getFecha());%></td>
                                <td><% out.println(daoCliente.MostrarCliente().get(i).getCorreo());%></td>
                                <td><% out.println(daoCliente.MostrarCliente().get(i).getTelefono());%></td>
                                <td><% out.println(daoCliente.MostrarCliente().get(i).getCelular());%></td>
                               
                                <td><% out.println(daoCliente.MostrarCliente().get(i).getDistrito().getNombre());%></td>
                                    
                                <%
                                    String est = "";
                                    if (daoCliente.MostrarCliente().get(i).isEstado()) {
                                        est = "Habilitado";
                                    } else {
                                        est = "Deshabilitado";
                                    }
                                %>
                                <td><%= est%></td>

                                <td><a href="<%= raiz %>/Control?menu=Cliente&accion=actualizar&x=<% out.println(daoCliente.MostrarCliente().get(i).getCodigo());%>" class="btn btn-success">Seleccionar</a></td>
                                <td><a href="<%= raiz %>/Control?menu=Cliente&accion=eliminar&x=<% out.println(daoCliente.MostrarCliente().get(i).getCodigo());%> " class="btn btn-danger">Seleccionar</a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
                       <a href="<%= raiz %>/Control?menu=Cliente&accion=registrar"  class="btn btn-primary">
                        Registrar Cliente
                        
                    </a>
                <a href="<%= raiz %>/Control?menu=Cliente&accion=buscar" class="btn btn-warning">
                        Buscar Cliente
                        
                    </a>

            </div>
        </div>
    </body>
</html>


