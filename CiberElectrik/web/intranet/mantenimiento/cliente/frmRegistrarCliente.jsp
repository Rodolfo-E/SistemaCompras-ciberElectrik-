<%-- 
    Document   : frmRegistrarProducto
    Created on : 20-feb-2020, 10:56:04
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpDistrito"%>
<%@page import="CiberElectrik.dao.DaoDistrito"%>
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
  
        DaoDistrito daoDistrito=new ImpDistrito();
        %>
      
    </head>
    <body>
         <div class="container">
            <h1>Registro del Cliente</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistrarCliente" method="post" action="<%= raiz %>/Cliente" >
                    <input type="hidden" id="accion" name="accion" value="registrar">
                    
                   <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control">
                                 
                    
                   </div>
                   </div>
                    <div class="form-group">
                        <label for="txtApe" class="col-md-2 control-label">Apellido:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtApe" name="txtApe" class="form-control">
                                 
                    
                   </div>
                   </div>
                    <div class="form-group">
                        <label for="txtUsu" class="col-md-2 control-label">Usuario:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtUsu" name="txtUsu" class="form-control">
                                 
                    
                   </div>
                   </div>
                        <div class="form-group">
                        <label for="txtCla" class="col-md-2 control-label">Clave:</label>
                        <div class="col-md-4">
                            <input type="password" id="txtCla" name="txtCla" class="form-control">
                                 
                    
                   </div>
                   </div>
                    <div class="form-group">
                        <label for="txtDir" class="col-md-2 control-label">Direccion:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtDir" name="txtDir" class="form-control">
                                  
                        </div>
                    </div>
                         
                        <div class="form-group">
                        <label for="txtFec" class="col-md-2 control-label">Fecha:</label>
                        <div class="col-md-4">
                            <input type="date" id="txtPre" name="txtFec" class="form-control">
                                 
                        </div>
                    </div>
                        <div class="form-group">
                        <label for="txtCor" class="col-md-2 control-label">Correo:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtPre" name="txtCor" class="form-control">
                                 
                        </div>
                    </div>
                        <div class="form-group">
                        <label for="txtTel" class="col-md-2 control-label">Telefono:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtTel" name="txtTel" class="form-control">
                                   
                        </div>
                    </div>
                    
                  <div class="form-group">
                        <label for="txtCel" class="col-md-2 control-label">Celular:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCel" name="txtCel" class="form-control">
                                
                       
                    </div>
                   </div>
                            <div class="form-group">
                        <label for="cboDistrito" class="col-md-2 control-label">Distrito:</label>
                        <div class="col-md-4">
                            <select id="cboCategoria" name="cboDistrito" class="form-control">
                                <option>Seleccione un Distrito</option>
                                <%
                                for(int i=0;i<daoDistrito.MostrarDistrito().size();i++){
                                %>
                                <option value="<%= daoDistrito.MostrarDistrito().get(i).getCodigo()  %>">
                                    <%= daoDistrito.MostrarDistrito().get(i).getNombre()%>
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
                        <input type="submit" id="btnRegistrar" name="btnRegistrar" value="Registrar" class="btn btn-primary"  >
                        <a href="<%= raiz%>/Control?menu=Cliente&accion=mostrar" class="btn btn-dark">
                            Regresar

                        </a>

                    </div> 
                     
                 
                </form>
            </div>
         </div>
                    
    </body>
</html>
