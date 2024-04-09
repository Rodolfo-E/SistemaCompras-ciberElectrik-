<%@page import="CiberElectrik.Bean.BeanDistrito"%>
<%@page import="CiberElectrik.dao.DaoDistrito"%>
<%@page import="CiberElectrik.imp.ImpDistrito"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String raiz = request.getContextPath();
            BeanDistrito objdistrito = new BeanDistrito();
            int cod = 0;
            cod = Integer.parseInt(request.getParameter("x"));
            objdistrito.setCodigo(cod);

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
        <title>Eliminar Distrito</title>
    </head>
    <body>
        <div class="container">
            <h1>Eliminar Distrito</h1>
            <hr>
            <div class="form-horizontal" role="form">
                <form name="frmRegistrarDistrito" method="post" action="<%= raiz%>/Distrito">
                    <input type="hidden" id="txtCod" name="txtCod" value="<%= cod%>">
                    <input type="hidden" id="accion" name="accion" value="eliminar">
                    <%
                        DaoDistrito daodistrito = new ImpDistrito();
                        
                        for (int i = 0; i < daodistrito.BuscarDistrito(objdistrito).size(); i++) {
                    %>
                    <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" class="form-control"
                                   value="<%= daodistrito.BuscarDistrito(objdistrito).get(i).getNombre()%>" readonly>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="chkEstado" class="col-md-2 control-label">Estado:</label>
                        <%
                            if (daodistrito.BuscarDistrito(objdistrito).get(i).isEstado() == true) {%>
                        <div class="col-md-4">
                            <input type="text" id="txtEst" name="txtEst"  class="form-control" value="Habilitado" readonly>
                           
                        </div>
                        <% } else { %>
                            <div class="col-md-4">
                            <input type="text" id="txtEst" name="txtEst"  class="form-control" value="Deshabilitado" readonly>
                           
                        </div>
                        <% }%>
                    </div>
                    <% } %>

                    <div class="col-md-12 control-label">
                        <input type="submit" id="btnEliminar" name="btnEliminar" value="Eliminar" class="btn btn-primary"  >
                       <a href="<%= raiz %>/Control?menu=Distrito&accion=mostrar"  class="btn btn-dark">
                        Regresar
                        
                    </a>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>

