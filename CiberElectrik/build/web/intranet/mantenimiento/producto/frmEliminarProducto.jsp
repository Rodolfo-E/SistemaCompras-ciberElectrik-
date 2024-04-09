<%-- 
    Document   : frmEliminarProducto
    Created on : 20-feb-2020, 10:57:52
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
        
           
        <title>Eliminar Producto</title>
        
        <%
        DaoProducto daoProducto=new ImpProducto();
        DaoProveedor daoproveedor=new ImpProveedor();
        DaoCategoria daoCategoria=new ImpCategoria();
        
        %>
    </head>
    <body > 
        <div class="container">
            <h1>Eliminar Producto</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistrarProducto" method="post" action="<%= raiz%>/Producto">
                    <input type="hidden" id="txtCod" name="txtCod" value="<%= cod%>">
                    <input type="hidden" id="accion" name="accion" value="eliminar">
                    <%
                      //  DaoUsuario daousuario = new ImpUsuario();
                        
                        for (int i = 0; i < daoProducto.BuscarProducto(objProducto).size(); i++) {
                    %>
                    <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control"
                                   value="<%=daoProducto.BuscarProducto(objProducto).get(i).getNombre()%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtCan" class="col-md-2 control-label">Cantidad:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCan" name="txtCan" class="form-control"
                                   value="<%= daoProducto.BuscarProducto(objProducto).get(i).getCantidad()%>" readonly>
                        </div>
                    </div>
                           <div class="form-group">
                        <label for="txtPre" class="col-md-2 control-label">Precio:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtPre" name="txtPre" class="form-control"
                                   value="<%= daoProducto.BuscarProducto(objProducto).get(i).getPrecio()%>" readonly>
                        </div>
                    </div>
                        
                         <div class="form-group">
                        <label for="filefoto" class="col-md-2 control-label">Foto:</label>
                        <div class="col-md-4">
                            <input type="text" id="filefoto" name="filefoto" value="<%= daoProducto.BuscarProducto(objProducto).get(i).getFoto() %>" class="form-control" readonly>
                        </div>
                    </div>
                         <div class="form-group">
                        <label for="txtProve" class="col-md-2 control-label">Proveedor:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtProve" name="txtProve" class="form-control"
                                   value="<%= daoProducto.BuscarProducto(objProducto).get(i).getProveedor().getNombre() %> " readonly>
                        </div>
                    </div>
                         <div class="form-group">
                        <label for="txtCat" class="col-md-2 control-label">Categoria:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCat" name="txtCat" class="form-control"
                                   value="<%= daoProducto.BuscarProducto(objProducto).get(i).getCategoria().getNombre() %>" readonly>
                        </div>
                    </div>
                         
                     
                   
                         
             

                    
                    <div class="form-group">
                        <label for="txtEst" class="col-md-2 control-label">Estado:</label>
                        <%
                            if (daoProducto.BuscarProducto(objProducto).get(i).isEstado() ) {%>
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


