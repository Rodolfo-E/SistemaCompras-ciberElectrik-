<%-- 
    Document   : frmActualizarProducto
    Created on : 20-feb-2020, 10:56:55
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpCategoria"%>
<%@page import="CiberElectrik.dao.DaoCategoria"%>
<%@page import="CiberElectrik.imp.ImpProveedor"%>
<%@page import="CiberElectrik.dao.DaoProveedor"%>
<%@page import="CiberElectrik.Bean.BeanProducto"%>
<%@page import="CiberElectrik.dao.DaoProducto"%>
<%@page import="CiberElectrik.imp.ImpProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String raiz = request.getContextPath();
            BeanProducto objProducto = new BeanProducto();
            int cod = 0;
            cod = Integer.parseInt(request.getParameter("x"));
            objProducto.setCodigo(cod);

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
                var $option= $('#cboProveedor').children('option[value="'+ codigo+ '"]');
                  var $option2= $('#cboCategoria').children('option[value="'+ codigo+ '"]');
                $option.attr('selected', true);
                $option2.attr('selected', true);
            }
          
            
        </script>
           
        <title>Actualizar Producto</title>
        
        <%
        DaoProducto daoProducto=new ImpProducto();
        DaoProveedor daoproveedor=new ImpProveedor();
        DaoCategoria daoCategoria=new ImpCategoria();
        
        %>
    </head>
    <body onload="CargarCombo(<%= cod %>) "> 
        <div class="container">
            <h1>Actualizar Producto</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistraProducto" method="post" action="<%= raiz%>/Producto">
                    <input type="hidden" id="txtCod" name="txtCod" value="<%= cod%>">
                    <input type="hidden" id="accion" name="accion" value="actualizar">
                    <%
                      //  DaoUsuario daousuario = new ImpUsuario();
                        
                        for (int i = 0; i < daoProducto.BuscarProducto(objProducto).size(); i++) {
                    %>
                    <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control"
                                   value="<%= daoProducto.BuscarProducto(objProducto).get(i).getNombre()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtCan" class="col-md-2 control-label">Cantidad:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCan" name="txtCan" class="form-control"
                                   value="<%= daoProducto.BuscarProducto(objProducto).get(i).getCantidad()%>">
                        </div>
                    </div>
                           <div class="form-group">
                        <label for="txtPre" class="col-md-2 control-label">Precio:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtPre" name="txtPre" class="form-control"
                                   value="<%= daoProducto.BuscarProducto(objProducto).get(i).getPrecio()%>">
                        </div>
                    </div>
                        <div class="form-group">
                        <label for="url" class="col-md-2 control-label">Foto Actual:</label>
                        <div class="col-md-4">
                            <input type="text" id="url" name="url" class="form-control"
                                   value="<%= daoProducto.BuscarProducto(objProducto).get(i).getFoto()%>">
                        </div>
                    </div>
                          <div class="form-group">
                        <label for="filefoto" class="col-md-2 control-label">Nueva Foto:</label>
                        <div class="col-md-4">
                            <input type="file" id="filefoto"  name="filefoto"   class="form-control">
                        </div>
                    </div>
                         
                     
                     <div class="form-group">
                        <label for="cboProveedor" class="col-md-2 control-label">Proveedor:</label>
                        <div class="col-md-4">
                            <select id="cboProveedor" name="cboProveedor" class="form-control">
                                <option>Seleccione un Proveedor</option>
                                <%
                                for(int l=0; l<daoproveedor.MostrarProveedor().size();l++){
                                %>
                                <option value="<%= daoproveedor.MostrarProveedor().get(l).getCodigo()%>">
                                    <%= daoproveedor.MostrarProveedor().get(l).getNombre()%>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                               <div class="form-group">
                        <label for=cboCategoria" class="col-md-2 control-label">Categoria:</label>
                        <div class="col-md-4">
                            <select id="cboCategoria" name="cboCategoria" class="form-control">
                                <option>Seleccione una Categoria</option>
                                <%
                                for(int j=0; j<daoCategoria.MostrarCategoria().size();j++){
                                %>
                                <option value="<%= daoCategoria.MostrarCategoria().get(j).getCodigo()%>">
                                    <%= daoCategoria.MostrarCategoria().get(j).getNombre()%>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="chkEstado" class="col-md-2 control-label">Estado:</label>
                        <%
                            if (daoProducto.BuscarProducto(objProducto).get(i).isEstado()) {%>
                        <div class="col-md-10">
                            <input type="checkbox" id="chkEstado" name="chkEstado" value="true" class="form-check-inline" checked>
                            <label class="form-check-label" >Habilitado</label>  
                        </div>
                        <% } else { %>
                        <div class="col-md-10">
                            <input type="checkbox" id="chkEstado" name="chkEstado" value="true" class="form-check-inline">
                            <label class="form-check-label">Habilitado</label>  
                        </div>
                        <% }%>
                    </div>
                  

                    <div class="col-md-12 control-label">
                        <input type="submit" id="btnActualizar" name="btnActualizar" value="Actualizar" class="btn btn-primary"  >
                          <a href="<%= raiz %>/Control?menu=Producto&accion=mostrar"  class="btn btn-dark">
                        Regresar
                        
                    </a>
                    </div>
                      <% } %>
                </form>
            </div>
        </div>

    </body>
</html>


