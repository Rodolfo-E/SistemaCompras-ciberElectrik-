<%-- 
    Document   : frmEliminarProveedor
    Created on : 19-feb-2020, 20:00:20
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpDistrito"%>
<%@page import="CiberElectrik.dao.DaoProveedor"%>
<%@page import="CiberElectrik.Bean.BeanProveedor"%>
<%@page import="CiberElectrik.dao.DaoDistrito"%>
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
        <script  src="<%= raiz%>/intranet/js/mibiblioteca.js" type="text/javascript"></script>
        <title>Eliminar Proveedor</title>
        <%
          DaoProveedor daoproveedor=new ImpProveedor();
          DaoDistrito daodistrito= new ImpDistrito();
        %>
    </head>
    <body>
        <div class="container">
            <h1>Eliminar Proveedor</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistrarPerfil" method="post" action="<%= raiz%>/Proveedor">
                    <input type="hidden" id="txtCod" name="txtCod" value="<%= cod%>">
                    <input type="hidden" id="accion" name="accion" value="eliminar">
                    <%
                      
                        
                        for (int i = 0; i < daoproveedor.BuscarProveedor(objproveedor).size(); i++) {
                    %>
                    <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control"
                                   value="<%= daoproveedor.BuscarProveedor(objproveedor).get(i).getNombre()%>" readonly>
                        </div>
                    </div>
                    
                            <div class="form-group">
                        <label for="txtCla" class="col-md-2 control-label">Direccion:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCla" name="txtCla" class="form-control"
                                   value="<%= daoproveedor.BuscarProveedor(objproveedor).get(i).getDireccion()%>"readonly>
                        </div>
                    </div>
                             <div class="form-group">
                        <label for="txtCla" class="col-md-2 control-label">Telefono:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCla" name="txtCla" class="form-control"
                                   value="<%= daoproveedor.BuscarProveedor(objproveedor).get(i).getTelefono()%>"readonly>
                        </div>
                    </div>
                             <div class="form-group">
                        <label for="txtCla" class="col-md-2 control-label">Correo:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCla" name="txtCla" class="form-control"
                                   value="<%= daoproveedor.BuscarProveedor(objproveedor).get(i).getCorreo()%>"readonly>
                        </div>
                    </div>
                             <div class="form-group">
                        <label for="txtCla" class="col-md-2 control-label">Ruc:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCla" name="txtCla" class="form-control"
                                   value="<%= daoproveedor.BuscarProveedor(objproveedor).get(i).getRuc()%>"readonly>
                        </div>
                    </div>
                           <div class="form-group">
                        <label for="txtDis" class="col-md-2 control-label">Distrito:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtDis" name="txtDis" class="form-control"
                                   value="<%= daoproveedor.BuscarProveedor(objproveedor).get(i).getDistrito().getNombre()  %> "readonly
                                   readonly>
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="txtEst" class="col-md-2 control-label">Estado:</label>
                        <%
                            if (daoproveedor.BuscarProveedor(objproveedor).get(i).isEstado() ) {%>
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

