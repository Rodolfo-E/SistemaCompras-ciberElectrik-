<%-- 
    Document   : frmActulizarProveedor
    Created on : 19-feb-2020, 20:00:33
    Author     : Usuario
--%>

<%@page import="CiberElectrik.Bean.BeanDistrito"%>
<%@page import="CiberElectrik.imp.ImpDistrito"%>
<%@page import="CiberElectrik.dao.DaoDistrito"%>
<%@page import="CiberElectrik.Bean.BeanProveedor"%>
<%@page import="CiberElectrik.dao.DaoProveedor"%>
<%@page import="CiberElectrik.imp.ImpProveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String raiz = request.getContextPath();
            BeanProveedor objproveedor = new BeanProveedor();
            int cod = 0;
            cod = Integer.parseInt(request.getParameter("x"));
            objproveedor.setCodigo(cod);

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
      <!--
        <script type="text/javascript">
            function CargarCombo(codigo){
                var $option= $('#cboDistrito').children('option[value="' + codigo + '"]');
                $option.attr('selected', true);
            }
            
        </script>
           -->
        <title>Actualizar Proveedor</title>
        
        <%
        DaoProveedor daoproveedor=new ImpProveedor();
        DaoDistrito daodistrito=new ImpDistrito();
        %>
    </head>
    <body >
        <div class="container">
            <h1>Actualizar Proveedor</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistrarProveedor" method="post" action="<%= raiz%>/Proveedor">
                    <input type="hidden" id="txtCod" name="txtCod" value="<%= cod%>">
                    <input type="hidden" id="accion" name="accion" value="actualizar">
                    <%
                      //  DaoUsuario daousuario = new ImpUsuario();
                        
                        for (int i = 0; i < daoproveedor.BuscarProveedor(objproveedor).size(); i++) {
                    %>
                    <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control"
                                   value="<%= daoproveedor.BuscarProveedor(objproveedor).get(i).getNombre()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtDir" class="col-md-2 control-label">Direccion:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtDir" name="txtDir" class="form-control"
                                   value="<%= daoproveedor.BuscarProveedor(objproveedor).get(i).getDireccion()%>">
                        </div>
                    </div>
                           <div class="form-group">
                        <label for="txtTel" class="col-md-2 control-label">Telefono:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtTel" name="txtTel" class="form-control"
                                   value="<%= daoproveedor.BuscarProveedor(objproveedor).get(i).getTelefono()%>">
                        </div>
                    </div>
                           <div class="form-group">
                        <label for="txtCor" class="col-md-2 control-label">Correo:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCor" name="txtCor" class="form-control"
                                   value="<%= daoproveedor.BuscarProveedor(objproveedor).get(i).getCorreo()%>">
                        </div>
                    </div>
                           <div class="form-group">
                        <label for="txtRuc" class="col-md-2 control-label">Ruc:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtRuc" name="txtRuc" class="form-control"
                                   value="<%= daoproveedor.BuscarProveedor(objproveedor).get(i).getRuc()%>">
                        </div>
                    </div>
                     <div class="form-group">
                        <label for=cboDistrito class="col-md-2 control-label">Distrito:</label>
                        <div class="col-md-4">
                            <select id="cboDistrito" name="cboDistrito" class="form-control">
                                <option>Seleccione un Distrito</option>
                                <%
                                for(BeanDistrito dis:daodistrito.MostrarDistrito()){
                                %>
                                <option value="<%= dis.getCodigo() %>"
                                        <% if(dis.getCodigo()==daoproveedor.BuscarProveedor(objproveedor).get(i).getDistrito().getCodigo()){ %>
                                        selected
                                        
                                     <% } %> >
                                    <%= dis.getNombre() %>
                                   
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="chkEstado" class="col-md-2 control-label">Estado:</label>
                        <%
                            if (daoproveedor.BuscarProveedor(objproveedor).get(i).isEstado()) {%>
                        <div class="col-md-10">
                            <input type="checkbox" id="chkEstado" name="chkEstado" value="true" class="form-check-inline" checked>
                            <label class="form-check-label" >Habilitado</label>  
                        </div>
                        <% } else { %>
                        <div class="col-md-10">
                            <input type="checkbox" id="chkEstado" name="chkEstado" value="true" class="form-check-inline">
                            <label class="form-check-label">Deshabilitado</label>  
                        </div>
                        <% }%>
                    </div>
                  

                    <div class="col-md-12 control-label">
                        <input type="submit" id="btnActualizar" name="btnActualizar" value="Actualizar" class="btn btn-primary"  >
                         <a href="<%= raiz %>/Control?menu=Proveedor&accion=mostrar"  class="btn btn-dark">
                        Regresar
                             </a>
                    </div>
                      <% } %>
                </form>
            </div>
        </div>

    </body>
</html>

