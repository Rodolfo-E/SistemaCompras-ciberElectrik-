<%-- 
    Document   : frmRegistrarClienteWS
    Created on : 15-may-2021, 5:35:49
    Author     : RODOLFO
--%>

<%@page import="CiberElectrik.imp.ImpDistrito"%>
<%@page import="CiberElectrik.dao.DaoDistrito"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String dni="", nom = "", ape = "", dir = "", fec = "", cor = "", tel = "", cel = "", dis = "",coddi="";
        int codd=0;
        String raiz = request.getContextPath();


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
  
     

      <%
  
        DaoDistrito daoDistrito=new ImpDistrito();
        %>
  
       <script>
            function CargarCombo(coddi){
                var $option= $('#cboDistrito').children('option[value="'+ coddi+ '"]');
                $option2.attr('selected', true);
            }
          
            
        </script>
     
 
    <body  >
        <div class="container">
            <h1>Registrar el Cliente</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form  method="post"  >
                   

                    <div class="form-group row">
                        <label for="txtBus" class="col-md-2 control-label">Buscar al Ciudadano por el Dni:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtBus" name="txtBus" class="form-control">                           
                        </div>                             
                        <input type="submit"  onclick="CargarCombo(<%= dni %>)" value="Buscar" class="btn btn-success"  >

                    </div>
                </form>
            </div>
        </div>
        
                    <%-- start web service invocation --%><hr/>
                    <%
                        try {
                            org.tempuri.Reniec service = new org.tempuri.Reniec();
                            org.tempuri.ReniecSoap port = service.getReniecSoap();
                            // TODO initialize WS operation arguments here
                            dni = request.getParameter("txtBus");
                            // TODO process result here
                            java.lang.String result = port.buscarCiudadano(dni);
                            String[] rs = result.split(",");
                            
                            //  for(int i=0;i<rs.length;i++){
                            //   out.println(rs[0]+"<br>");
                            //   out.println(rs[1]+"<br>");
                            
                            nom = rs[0];
                            ape = rs[1];
                            dir = rs[2];
                            fec = rs[3];
                            cor = rs[4];
                            tel = rs[5];
                            cel = rs[6];
                            coddi =rs[7];
                            dis = rs[8];

                        } catch (Exception ex) {
                            //out.println("No se encontraron los Datos ");
                        }
                    %>
                    <div class="container">
                   <div class="form-horizontal" role="form">
                    <form name="frmRegistrarCliente" method="post" action="<%= raiz%>/Cliente" >
                    <input type="hidden" id="accion" name="accion" value="registrarws">

                    <div class="form-group row">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom"  value="<% out.print( nom);%>" class="form-control">


                        </div>  

                    </div>

                    <div class="form-group row">
                        <label for="txtApe" class="col-md-2 control-label">Apellido:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtApe" name="txtApe" value="<%=ape%>" class="form-control">


                        </div>  
                    </div>
                 
                    <div class="form-group row">
                        <label for="txtUsu" class="col-md-2 control-label">Usuario:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtUsu" name="txtUsu" class="form-control">


                        </div>  
                    </div>
                    <div class="form-group row">
                        <label for="txtCla" class="col-md-2 control-label">Clave:</label>
                        <div class="col-md-4">
                            <input type="password" id="txtCla" name="txtCla"  class="form-control">


                        </div>  
                    </div>
                    <div class="form-group row">
                        <label for="txtDir" class="col-md-2 control-label">Direccion:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtDir" name="txtDir" value="<%=dir%>" class="form-control">


                        </div>  
                    </div>
                    <div class="form-group row">
                        <label for="txtFec" class="col-md-2 control-label">Fecha:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtFec" name="txtFec" value="<%=fec%>" class="form-control">


                        </div>  
                    </div>
                    <div class="form-group row">
                        <label for="txtCor" class="col-md-2 control-label">Correo:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCor" name="txtCor" value="<%=cor%>" class="form-control">


                        </div>  
                    </div>
                    <div class="form-group row">
                        <label for="txtTel" class="col-md-2 control-label">Telefono:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtTel" name="txtTel" value="<%=tel%>" class="form-control">


                        </div>  
                    </div>
                    <div class="form-group row">
                        <label for="txtCel" class="col-md-2 control-label">Celular:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtCel" name="txtCel" value="<%=cel%>" class="form-control">


                        </div>  
                    </div>
                   <!-- <div class="form-group row">
                        <label for="txtDis" class="col-md-2 control-label">Distrito:</label>
                        <div class="col-md-4">
                          
                            <input type="text" id="txtDis" name="txtDis" value="<%=dis%>" class="form-control">


                        </div>  
                    </div>

                            <input type="hidden" id="txtCodd" name="txtCodd" value="<%= coddi %>" class="form-control">-->
                    <div class="form-group row">
                        <label for="cboDistrito" class="col-md-2 control-label">Distrito:</label>
                    <div class="col-md-4">
                            <select id="cboDistrito" name="cboDistrito" class="form-control">
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
                    <div class="form-group row">
                        <label for="chkEstado" class="col-md-2 control-label">Estado:</label>
                        <div class="col-md-10">
                            <input type="checkbox" id="chkEstado" name="chkEstado" value="true" class="form-check-inline" checked>
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





        <%-- end web service invocation --%><hr/>
    </body>

</html>

