<%-- 
    Document   : frmMostrarUsuario
    Created on : 01-feb-2020, 19:45:04
    Author     : Usuario
--%>


<%@page import="CiberElectrik.imp.ImpUsuario"%>
<%@page import="CiberElectrik.dao.DaoUsuario"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%-- Autor:Rodolfo Delgado  --%>
  
    <head>
       
        <%
//Sirve para obtener la raiz del proyecto
            String raiz = request.getContextPath();
// Es implementar el metodo
            DaoUsuario daoUsuario = new ImpUsuario();
        %>

     
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon " href="# "/>
        <link href="<%= raiz%>/intranet/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= raiz%>/intranet/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="<%= raiz%>/intranet/js/jquery-3.3.1.slim.min.js"  type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/popper.min.js" type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/bootstrap.min.js" type="text/javascript"></script>

        <title>Mostrar Usuario</title>
    </head>
    <body>
        <div class="container">
            <h1>Mantenimiento Usuario</h1>
            <div class="form-horizontal" role="form">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover">
                        <thead class="thead-dark">
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Clave</th>
                        <th>Perfil</th>
                        <th>Estado</th>
                        <th>Actualizar</th>
                        <th>Eliminar</th>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < daoUsuario.MostrarUsuario().size(); i++) {
                            %>
                            <tr>
                                <td><% out.println(daoUsuario.MostrarUsuario().get(i).getCodigo());%></td>
                                <td><% out.println(daoUsuario.MostrarUsuario().get(i).getNombre());%></td>
                                <td><% out.println(daoUsuario.MostrarUsuario().get(i).getClave());%></td>
                                <td><% out.println(daoUsuario.MostrarUsuario().get(i).getPerfil().getNombre());%></td>
                                <%
                                    String est = "";
                                    if (daoUsuario.MostrarUsuario().get(i).isEstado()) {
                                        est = "Habilitado";
                                    } else {
                                        est = "Deshabilitado";
                                    }
                                %>
                                <td><%= est%></td>

                                <td><a href="<%= raiz %>/Control?menu=Usuario&accion=actualizar&x=<% out.println(daoUsuario.MostrarUsuario().get(i).getCodigo());%>" class="btn btn-success">Seleccionar</a></td>
                                <td><a href="<%= raiz %>/Control?menu=Usuario&accion=eliminar&x=<% out.println(daoUsuario.MostrarUsuario().get(i).getCodigo());%> " class="btn btn-danger">Seleccionar</a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
                 <a href="<%= raiz %>/Control?menu=Usuario&accion=registrar" class="btn btn-primary">
                    Registrar Usuario

                </a>
               
                   <a href="<%= raiz %>/Control?menu=Usuario&accion=buscar" class="btn btn-warning">
                        Buscar Usuario                
                    </a>
                  



            </div>
        </div>
    </body>
</html>

