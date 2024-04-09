

<%@page import="CiberElectrik.Bean.BeanCategoria"%>
<%@page import="CiberElectrik.dao.DaoCategoria"%>
<%@page import="CiberElectrik.imp.ImpCategoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String raiz = request.getContextPath();
            BeanCategoria objcategoria = new BeanCategoria();
            int cod = 0;
            cod = Integer.parseInt(request.getParameter("x"));
            objcategoria.setCodigo(cod);

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
        
        <title>Actualiza Categoria</title>
    </head>
    <body>
        <div class="container">
            <h1>Actualizar Categoria</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistrarCategoria" method="post" action="<%= raiz%>/Categoria">
                    <input type="hidden" id="txtCod" name="txtCod" value="<%= cod%>">
                    <input type="hidden" id="accion" name="accion" value="actualizar">
                    <%
                        DaoCategoria daocategoria = new ImpCategoria();
                        
                        for (int i = 0; i < daocategoria.BuscarCategoria(objcategoria).size(); i++) {
                    %>
                    <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control"
                                   value="<%= daocategoria.BuscarCategoria(objcategoria).get(i).getNombre()%>">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="chkEstado" class="col-md-2 control-label">Estado:</label>
                        <%
                            if (daocategoria.BuscarCategoria(objcategoria).get(i).isEstado() == true) {%>
                        <div class="col-md-10">
                            <input type="checkbox" id="chkEstado" name="chkEstado" value="true" class="form-check-inline" checked>
                            <label class="form-check-label">Habilitado</label>  
                        </div>
                        <% } else { %>
                        <div class="col-md-10">
                            <input type="checkbox" id="chkEstado" name="chkEstado" value="true"  class="form-check-inline">
                            <label class="form-check-label">Habilitado</label>  
                        </div>
                        <% }%>
                    </div>
                    <% } %>

                    <div class="col-md-12 control-label">
                        <input type="submit" id="btnActualizar" name="btnActualizar" value="Actualizar" class="btn btn-primary"  >
                           <a href="<%= raiz %>/Control?menu=Categoria&accion=mostrar" class="btn btn-dark">
                  Regresar

                </a>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>

