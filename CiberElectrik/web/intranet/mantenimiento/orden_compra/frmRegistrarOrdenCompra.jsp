<%-- 
    Document   : frmRegistrarOrdenCompra
    Created on : 12-abr-2021, 2:03:15
    Author     : RODOLFO
--%>
<%@page import="CiberElectrik.Bean.BeanProveedor"%>
<%-- 
    Document   : frmRegistrarProveedor
    Created on : 19-feb-2020, 19:59:41
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpDistrito"%>
<%@page import="CiberElectrik.dao.DaoDistrito"%>
<%@page import="CiberElectrik.imp.ImpProveedor"%>
<%@page import="CiberElectrik.dao.DaoProveedor"%>
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
        <title>Registrar Proveedor</title>
        <%
        DaoDistrito daodistrito=new ImpDistrito();
           DaoProveedor daoProveedor = new ImpProveedor();
            BeanProveedor objproveedor = new BeanProveedor();
                   int cod = 0;
           cod = Integer.parseInt(request.getParameter("x"));
            objproveedor.setCodigo(cod);
        %>
        
    </head>
    <body>
        <div class="container">
            <h1>Registrar el Cliente</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form  method="post"  >
                          <input type="hidden" id="txtCod" name="txtCod" value="<%= cod%>">
  <%
                      //  DaoUsuario daousuario = new ImpUsuario();
                        
                        for (int i = 0; i < daoProveedor.BuscarProveedor(objproveedor).size(); i++) {
                    %>
                    <div class="form-group row">
                        <label for="txtBus" class="col-md-2 control-label">Buscar al Ciudadano por el Dni:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtBus" name="txtBus" value="<%= daoProveedor.BuscarProveedor(objproveedor).get(i).getNombre()%>" class="form-control">                           
                        </div>                             
                        <input type="submit" moda  value="Buscar" class="btn btn-success"  >
                        <a href="<%= raiz %>/Control?menu=Compra&accion=mostrar"  class="btn btn-info btn-block">Buscar</a>
                    </div>
                        <% } %>
                </form>
            </div>
        </div>
              
        
    </body>
</html>

