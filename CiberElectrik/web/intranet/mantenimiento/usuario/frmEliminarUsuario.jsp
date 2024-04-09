<%-- 
    Document   : frmEliminarUsuario
    Created on : 01-feb-2020, 19:45:49
    Author     : Usuario
--%>
<%@page import="CiberElectrik.imp.ImpPerfil"%>
<%@page import="CiberElectrik.dao.DaoUsuario"%>
<%@page import="CiberElectrik.Bean.BeanUsuario"%>
<%@page import="CiberElectrik.dao.DaoPerfil"%>
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
        <script  src="<%= raiz%>/intranet/js/mibiblioteca.js" type="text/javascript"></script>
        <title>Eliminar Usuario</title>
        <%
          DaoUsuario daousuario=new ImpUsuario();
          DaoPerfil daoperfil = new ImpPerfil();
        %>
    </head>
    <body>
        <div class="container">
            <h1>Eliminar Usuario</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistrarPerfil" method="post" action="<%= raiz%>/Usuario">
                    <input type="hidden" id="txtCod" name="txtCod" value="<%= cod%>">
                    <input type="hidden" id="accion" name="accion" value="eliminar">
                    <%
                      
                        
                        for (int i = 0; i < daousuario.BuscarUsuario(objusuario).size(); i++) {
                    %>
                    <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control"
                                   value="<%= daousuario.BuscarUsuario(objusuario).get(i).getNombre()%>" readonly>
                        </div>
                    </div>
                    
                            <div class="form-group">
                        <label for="txtCla" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCla" name="txtCla" class="form-control"
                                   value="<%= daousuario.BuscarUsuario(objusuario).get(i).getClave()%>" readonly>
                        </div>
                    </div>
                           <div class="form-group">
                        <label for="txtPer" class="col-md-2 control-label">Perfil:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtPer" name="txtPer" class="form-control"
                                   value="<%= daousuario.BuscarUsuario(objusuario).get(i).getPerfil().getNombre()  %> "
                                   readonly>
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="txtEst" class="col-md-2 control-label">Estado:</label>
                        <%
                            if (daousuario.BuscarUsuario(objusuario).get(i).isEstado() ) {%>
                        <div class="col-md-4">
                            <input type="text" id="txtEst" name="txtEst"  class="form-control" value="Habilitado" readonly>
                           
                        </div>
                        <% } else { %>
                            <div class="col-md-4">
                            <input type="text" id="txtEst" name="txtEst"  class="form-control" value="Deshabilitado" readonly>
                           
                        </div>
                        <% }%>
                    </div>
                    

                    <div class="col-md-12 control-label">
                        <input type="submit" id="btnEliminar" name="btnEliminar" value="Eliminar" class="btn btn-primary"  >
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

