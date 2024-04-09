<%-- 
    Document   : frmRegistrarUsuario
    Created on : 01-feb-2020, 19:45:24
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpPerfil"%>
<%@page import="CiberElectrik.dao.DaoPerfil"%>
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
        <title>Registrar Usuario</title>
        <%
        DaoPerfil daoperfil=new ImpPerfil();
        %>
        
    </head>
    <body>
         <div class="container">
            <h1>Registro del Usuario</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistrarUsuario" method="post" action="<%= raiz%>/Usuario">
                    <input type="hidden" id="accion" name="accion" value="registrar">
                    
                    <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control">
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="txtCla" class="col-md-2 control-label">Clave:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCla" name="txtCla" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cboPerfil" class="col-md-2 control-label">Perfil:</label>
                        <div class="col-md-4">
                            <select id="cboPerfil" name="cboPerfil" class="form-control">
                                <option>Seleccione un Perfil</option>
                                <%
                                for(int i=0;i<daoperfil.MostrarPerfil().size();i++){
                                %>
                                <option value="<%= daoperfil.MostrarPerfil().get(i).getCodigo()  %>">
                                    <%= daoperfil.MostrarPerfil().get(i).getNombre()%>
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
                          <input type="button" id="btnRegistrar" name="btnRegistrar" value="Registrar" class="btn btn-primary" onclick="ValidarUsuario()()" >
                              <a href="<%= raiz %>/Control?menu=Usuario&accion=mostrar" class="btn btn-dark">
                    Regresar

                </a>
               
                    </div>
                </form>
            </div>
         </div>
                    
    </body>
</html>
