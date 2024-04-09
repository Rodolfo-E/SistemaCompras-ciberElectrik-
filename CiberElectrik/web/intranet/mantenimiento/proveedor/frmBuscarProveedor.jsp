<%-- 
    Document   : frmBuscarProveedor
    Created on : 19-feb-2020, 20:01:03
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpProveedor"%>
<%@page import="CiberElectrik.dao.DaoProveedor"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
//permite obtener la ubicacion del proyecto -->raiz
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

        <title>Buscar Proveedor</title>
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
    <body>
        <div class="container">
            <h1>Busqueda Proveedor</h1>
            <div class="form-horizontal" role="form">
                <div class="table-responsive">
                    <div class="form-group">
                        <label for="txtBus">Ingrese un valor de Busqueda </label>
                        <input type="text" class="form-control " id="txtBus" name="txtBus" placeholder="Buscar..." required>

                    </div>
                    <table class="table table-bordered table-striped table-hover">
                        <thead class="thead-dark">
                            <tr>
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
                            </tr>
                        </thead>
                        <tbody id="myTable" >
                            <%
                                for (int i = 0; i < daoProveedor.MostrarProveedorTodo().size(); i++) {
                            %>
                            <tr>
                                <td><% out.println(daoProveedor.MostrarProveedorTodo().get(i).getCodigo());%></td>
                                <td><% out.println(daoProveedor.MostrarProveedorTodo().get(i).getNombre());%></td>
                                     <td><% out.println(daoProveedor.MostrarProveedorTodo().get(i).getDireccion());%></td>
                                <td><% out.println(daoProveedor.MostrarProveedorTodo().get(i).getTelefono());%></td>
                                <td><% out.println(daoProveedor.MostrarProveedorTodo().get(i).getCorreo());%></td>
                                <td><% out.println(daoProveedor.MostrarProveedorTodo().get(i).getRuc());%></td>
                                   <td><% out.println(daoProveedor.MostrarProveedorTodo().get(i).getDistrito().getNombre());%></td>
                               
                                   
                                <%
                                    String estvalor = "";
                                    if (daoProveedor.MostrarProveedorTodo().get(i).isEstado()== true) {
                                        estvalor = "Habilitado";
                                    } else {
                                        estvalor = "Deshabilitado";
                                    }
                                %>
                                <td><%= estvalor%></td>
                              <td>  
                                    <a class="btn btn-success" href="<%= raiz%>/Proveedor?x=<% out.println(daoProveedor.MostrarProveedorTodo().get(i).getCodigo());%>&accion=habilitar " >
                                        Habilitar
                                    </a>
                                </td>
                                <td>
                                    <a  class="btn btn-danger" href="<%= raiz%>/Proveedor?x=<% out.println(daoProveedor.MostrarProveedorTodo().get(i).getCodigo());%>&accion=deshabilitar ">
                                        Deshabilitar
                                    </a>
                                </td>

                            </tr>         
                            <% } %>
                        </tbody>
                    </table>
                </div>
                          <a href="<%= raiz %>/Control?menu=Proveedor&accion=mostrar"  class="btn btn-dark">
                        Regresar
                             </a>
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
</html>
