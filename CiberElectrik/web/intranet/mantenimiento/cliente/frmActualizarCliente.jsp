<%-- 
    Document   : frmActualizarProducto
    Created on : 20-feb-2020, 10:56:55
    Author     : Usuario
--%>

<%@page import="CiberElectrik.imp.ImpDistrito"%>
<%@page import="CiberElectrik.imp.ImpCliente"%>
<%@page import="CiberElectrik.dao.DaoDistrito"%>
<%@page import="CiberElectrik.dao.daoCliente"%>
<%@page import="CiberElectrik.Bean.BeanCliente"%>
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
            BeanCliente objCliente = new BeanCliente();
            int cod = 0;
            cod = Integer.parseInt(request.getParameter("x"));
            objCliente.setCodigo(cod);

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
           
        <title>Actualizar Proveedor</title>
        
        <%
        daoCliente daoCliente=new ImpCliente();
        DaoDistrito daoDistrito=new ImpDistrito();

        
        %>
    </head>
    <body onload="CargarCombo(<%= cod %>) "> 
        <div class="container">
            <h1>Actualizar Cliente</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistrarCliente" method="post" action="<%= raiz%>/Cliente">
                    <input type="hidden" id="txtCod" name="txtCod" value="<%= cod%>">
                    <input type="hidden" id="accion" name="accion" value="actualizar">
                    <%
                      //  DaoUsuario daousuario = new ImpUsuario();
                        
                        for (int i = 0; i < daoCliente.BuscarCliente(objCliente).size(); i++) {
                    %>
                 <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control"
                                   value="<%= daoCliente.BuscarCliente(objCliente).get(i).getNombre()%>">
                        </div>
                    </div>
                          <div class="form-group">
                        <label for="txtApe" class="col-md-2 control-label">Apellido:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtApe" name="txtApe" class="form-control"
                                   value="<%= daoCliente.BuscarCliente(objCliente).get(i).getApellido()%>">
                        </div>
                    </div>
                          <div class="form-group">
                        <label for="txtUsu" class="col-md-2 control-label">Usuario:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtUsu" name="txtUsu" class="form-control"
                                   value="<%= daoCliente.BuscarCliente(objCliente).get(i).getUsuario() %>">
                        </div>
                    </div>
                         <div class="form-group">
                        <label for="txtCla" class="col-md-2 control-label">Clave:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCla" name="txtCla" class="form-control"
                                   value="<%= daoCliente.BuscarCliente(objCliente).get(i).getClave()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtDir" class="col-md-2 control-label">Direccion:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtDir" name="txtDir" class="form-control"
                                   value="<%= daoCliente.BuscarCliente(objCliente).get(i).getDireccion()%>">
                        </div>
                    </div>
                         
                        <div class="form-group">
                        <label for="txtFec" class="col-md-2 control-label">Fecha:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtFec" name="txtFec" class="form-control"
                                   value="<%= daoCliente.BuscarCliente(objCliente).get(i).getFecha()%>">
                        </div>
                    </div>
                        <div class="form-group">
                        <label for="txtCor" class="col-md-2 control-label">Correo:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCor" name="txtCor" class="form-control"
                                   value="<%= daoCliente.BuscarCliente(objCliente).get(i).getCorreo()%>">
                        </div>
                    </div>
                        <div class="form-group">
                        <label for="txtTel" class="col-md-2 control-label">Telefono:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtTel" name="txtTel" class="form-control"
                                   value="<%= daoCliente.BuscarCliente(objCliente).get(i).getTelefono()%>">
                        </div>
                    </div>
                        <div class="form-group">
                        <label for="txtCel" class="col-md-2 control-label">Celular:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCel" name="txtCel" class="form-control"
                                   value="<%= daoCliente.BuscarCliente(objCliente).get(i).getCelular()%>">
                        </div>
                    </div>
                         <div class="form-group">
                        <label for="cboDistrito" class="col-md-2 control-label">Distrito:</label>
                        <div class="col-md-4">
                            <select id="cboProveedor" name="cboDistrito" class="form-control">
                                <option>Seleccione un Distrito</option>
                                <%
                                for(int l=0; l<daoDistrito.MostrarDistrito().size();l++){
                                %>
                                <option value="<%= daoDistrito.MostrarDistrito().get(l).getCodigo()%>">
                                    <%= daoDistrito.MostrarDistrito().get(l).getNombre()%>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                         
                
                 
                    <div class="form-group">
                        <label for="chkEstado" class="col-md-2 control-label">Estado:</label>
                        <%
                            if (daoCliente.BuscarCliente(objCliente).get(i).isEstado()) {%>
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
                       <a href="<%= raiz %>/Control?menu=Cliente&accion=mostrar" class="btn btn-dark">
                        Regresar
                        
                    </a>
                    </div>
                      <% } %>
                </form>
            </div>
        </div>

    </body>
</html>


