<%-- 
    Document   : frmRegistrarProducto
    Created on : 20-feb-2020, 10:56:04
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpProveedor"%>
<%@page import="CiberElectrik.dao.DaoProveedor"%>
<%@page import="CiberElectrik.imp.ImpCategoria"%>
<%@page import="CiberElectrik.dao.DaoCategoria"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String raiz=request.getContextPath();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon " href="# "/>
         <link href="<%= raiz %>/intranet/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
       <link href="<%= raiz %>/intranet/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="<%= raiz %>/intranet/js/jquery-3.3.1.slim.min.js"  type="text/javascript"></script>
        <script src="<%= raiz %>/intranet/js/popper.min.js" type="text/javascript"></script>
      <script src="<%= raiz %>/intranet/js/bootstrap.min.js" type="text/javascript"></script>
      <script src="<%= raiz %>/intranet/js/mibiblioteca.js" type="text/javascript"></script>
      <script src="<%= raiz %>/intranet/js/validacion.js" type="text/javascript"></script>
        <title>Registrar Producto</title>
        <%
        DaoProveedor daoProvedor=new ImpProveedor();
        DaoCategoria daoCategoria=new ImpCategoria();
        %>
        
    </head>
    <body>
         <div class="container">
            <h1>Registro del Producto</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistrarProducto" method="post" action="<%= raiz %>/Producto" >
                    <input type="hidden" id="accion" name="accion" value="registrar">
                    
                    <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control">
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="txtCan" class="col-md-2 control-label">Cantidad:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCan" name="txtCan" class="form-control">
                        </div>
                    </div>
                         <div class="form-group">
                        <label for="txtPre" class="col-md-2 control-label">Precio:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtPre" name="txtPre" class="form-control">
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="filefoto" class="col-md-2 control-label">Foto:</label>
                        <div class="col-md-4">
                            <input type="file" id="filefoto" name="filefoto" class="form-control">
                        </div>
                    </div>
                  
                    <div class="form-group">
                        <label for="cboProveedor" class="col-md-2 control-label">Proveedor:</label>
                        <div class="col-md-4">
                            <select id="cboProveedor" name="cboProveedor" class="form-control">
                                <option>Seleccione un Proveedor</option>
                                <%
                                for(int i=0;i<daoProvedor.MostrarProveedor().size();i++){
                                %>
                                <option value="<%= daoProvedor.MostrarProveedor().get(i).getCodigo()  %>">
                                    <%= daoProvedor.MostrarProveedor().get(i).getNombre()%>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="cboCategoria" class="col-md-2 control-label">Categoria:</label>
                        <div class="col-md-4">
                            <select id="cboCategoria" name="cboCategoria" class="form-control">
                                <option>Seleccione una Categoria</option>
                                <%
                                for(int i=0;i<daoCategoria.MostrarCategoria().size();i++){
                                %>
                                <option value="<%= daoCategoria.MostrarCategoria().get(i).getCodigo()  %>">
                                    <%= daoCategoria.MostrarCategoria().get(i).getNombre()%>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="chkEstado" class="col-md-2 control-label">Estado:</label>
                        <div class="col-md-10">
                            <input type="checkbox" id="chkEstado" name="chkEstado" value="true" class="form-check-inline">
                            <label class="form-check-label">Habilitado</label>  
                        </div>
                    </div>
                    
                      <div class="col-md-12 control-label">
                          <input type="button" id="btnRegistrar" name="btnRegistrar" value="Registrar" class="btn btn-primary" onclick="ValidarProducto()" >
                          <a href="<%= raiz %>/Control?menu=Producto&accion=mostrar" class="btn btn-dark">
                  Regresar

                </a>

                    </div>
                </form>
            </div>
         </div>
                    
    </body>
</html>
