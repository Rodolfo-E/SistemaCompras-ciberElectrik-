<%-- 
    Document   : frmMostrarCategoria
    Created on : 01-feb-2020, 20:34:18
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpCategoria"%>
<%@page import="CiberElectrik.dao.DaoCategoria"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%-- Autor:Rodolfo Delgado  --%>
    <head>
        <%
//Sirve para obtener la raiz del proyecto
String raiz=request.getContextPath();
// Es implementar el metodo
DaoCategoria daoCategoria=new ImpCategoria();
       
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon " href="# "/>
         <link href="<%= raiz %>/intranet/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
       <link href="<%= raiz %>/intranet/css/font-awesome   .css" rel="stylesheet" type="text/css"/>
        <script src="<%= raiz %>/intranet/js/jquery-3.3.1.slim.min.js"  type="text/javascript"></script>
        <script src="<%= raiz %>/intranet/js/popper.min.js" type="text/javascript"></script>
      <script src="<%= raiz %>/intranet/js/bootstrap.min.js" type="text/javascript"></script>
      
        <title>Mostrar Categoria</title>
    </head>
    <body>
        <div class="container">
        <h1>Mantenimiento Categoria</h1>
        <div class="form-horizontal" role="form">
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover">
                    <thead class="thead-dark">
                    <th>Codigo</th>
                    <th>Nombres</th>
                    <th>Estados</th>
                    <th>Actualizar</th>
                    <th>Eliminar</th>
                    </thead>
                    <tbody>
                        <%
                        for(int i=0;i<daoCategoria.MostrarCategoria().size();i++){
                        %>
                        <tr>
                            <td><% out.println(daoCategoria.MostrarCategoria().get(i).getCodigo());%></td>
                             <td><% out.println(daoCategoria.MostrarCategoria().get(i).getNombre());%></td>
                             <%
                             String est="";
                             if(daoCategoria.MostrarCategoria().get(i).isEstado()){
                                 est="Habilitado";
                             }else{
                                  est="Deshabilitado";
                             }
                             %>
                             <td><%=est %></td>
                    
                             <td><a href="<%= raiz %>/Control?menu=Categoria&accion=actualizar&x=<% out.println(daoCategoria.MostrarCategoria().get(i).getCodigo());%>" class="btn btn-success">Seleccionar</a></td>
                                <td><a href="<%= raiz %>/Control?menu=Categoria&accion=eliminar&x=<% out.println(daoCategoria.MostrarCategoria().get(i).getCodigo());%>" class="btn btn-danger">Seleccionar</a></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
        </div>
                        <a href="<%= raiz %>/Control?menu=Categoria&accion=registrar"  class="btn btn-primary">
                        Registrar Categoria
                        
                    </a>
                <a href="<%= raiz %>/Control?menu=Categoria&accion=buscar" class="btn btn-warning">
                        Buscar Categoria
                        
                    </a>
            
        </div>
        </div>
   </body>
</html>
