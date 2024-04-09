<%-- 
    Document   : ActualizarUsuario
    Created on : 01-feb-2020, 19:45:36
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpPerfil"%>
<%@page import="CiberElectrik.dao.DaoPerfil"%>
<%@page import="CiberElectrik.Bean.BeanUsuario"%>
<%@page import="CiberElectrik.dao.DaoUsuario"%>
<%@page import="CiberElectrik.imp.ImpUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String raiz = request.getContextPath();
            BeanUsuario objusuario = new BeanUsuario();
            int cod = 0;
            cod = Integer.parseInt(request.getParameter("x"));
            objusuario.setCodigo(cod);

        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon " href="# "/>
        <link href="<%= raiz%>/intranet/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= raiz%>/intranet/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="<%= raiz%>/intranet/js/jquery-3.3.1.slim.min.js"  type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/popper.min.js" type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/mibiblioteca.js" type="text/javascript"></script>
        <script>
            function CargarCombo(codigo){
                var $option= $('#cboPerfil').children('option[value="'+ codigo+ '"]');
                $option.attr('selected', true);
            }
            
        </script>
           
        <title>Actualizar Usuario</title>
        
        <%
        DaoUsuario daousuario=new ImpUsuario();
        DaoPerfil daoperfil=new ImpPerfil();
        %>
    </head>
    <body onload="CargarCombo(<%= cod%>)">
        <div class="container">
            <h1>Actualizar Usuario</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistrarUsuario" method="post" action="<%= raiz%>/Usuario">
                    <input type="hidden" id="txtCod" name="txtCod" value="<%= cod%>">
                    <input type="hidden" id="accion" name="accion" value="actualizar">
                    <%
                      //  DaoUsuario daousuario = new ImpUsuario();
                        
                        for (int i = 0; i < daousuario.BuscarUsuario(objusuario).size(); i++) {
                    %>
                    <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control"
                                   value="<%= daousuario.BuscarUsuario(objusuario).get(i).getNombre()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtCla" class="col-md-2 control-label">Clave:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCla" name="txtCla" class="form-control"
                                   value="<%= daousuario.BuscarUsuario(objusuario).get(i).getClave()%>">
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="cboPerfil" class="col-md-2 control-label">Perfil:</label>
                        <div class="col-md-4">
                            <select id="cboPerfil" name="cboPerfil" class="form-control">
                                <option>Seleccione un Perfil</option>
                                <%
                                for(int j=0; j<daoperfil.MostrarPerfil().size();j++){
                                %>
                                <option value="<%= daoperfil.MostrarPerfil().get(j).getCodigo()%>">
                                    <%= daoperfil.MostrarPerfil().get(j).getNombre()%>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="chkEstado" class="col-md-2 control-label">Estado:</label>
                        <%
                            if (daousuario.BuscarUsuario(objusuario).get(i).isEstado()) {%>
                        <div class="col-md-10">
                            <input type="checkbox" id="chkEstado" name="chkEstado" value="true" class="form-check-inline" checked>
                            <label class="form-check-label" >Habilitado</label>  
                        </div>
                        <% } else { %>
                        <div class="col-md-10">
                            <input type="checkbox" id="chkEstado" name="chkEstado" value="true" class="form-check-inline">
                            <label class="form-check-label">Habilitado</label>  
                                <% } %>
                        </div>
                    
                    </div>
                  

                    <div class="col-md-12 control-label">
                        <input type="submit" id="btnActualizar" name="btnActualizar" value="Actualizar" class="btn btn-primary"  >
                         <a href="<%= raiz %>/Control?menu=Usuario&accion=mostrar" class="btn btn-dark">
                   Regresar

                </a>
               
                    </div>
                      <% } %>
                </form>
            </div>
        </div>

    </body>
</html>

