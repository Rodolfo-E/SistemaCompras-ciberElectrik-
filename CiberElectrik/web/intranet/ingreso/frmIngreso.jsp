<%-- 
    Document   : frmIngreso
    Created on : 14-mar-2021, 14:22:27
    Author     : RODOLFO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
          <%
            String raiz=request.getContextPath();
        %>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link href="<%= raiz %>/intranet/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
      
        <script src="<%= raiz %>/intranet/js/jquery-3.3.1.slim.min.js"  type="text/javascript"></script>
        <script src="<%= raiz %>/intranet/js/popper.min.js" type="text/javascript"></script>
      <script src="<%= raiz %>/intranet/js/bootstrap.min.js" type="text/javascript"></script>
      <script src="<%= raiz %>/intranet/js/validaciones.js" type="text/javascript"></script>
      <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
      <script src="../js/vali.js" type="text/javascript"></script>
     
        <title>Loguin</title>
         
    </head>
   <body>
        <div class="form-horizontal" role="form">
                <form name="frmIngreso" action="<%= raiz %>/Controlador">
                  <input type="hidden" id="accion" name="accion" value="Ingresar"> 
        <div class="login-wrap">
	<div class="login-html">
            <input id="tab-1" style="text-align: center" type="radio" name="tab" class="sign-in" checked><label  style="text-align: center" for="tab-1" class="tab">Ingreso al Sistema</label>
		<input id="tab-2" type="radio" style="text-align: center" name="tab" class="sign-up"><label for="tab-2" style="text-align: center" class="tab"></label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					<label for="txtUsu" class="label">Usuario</label>
                                        <input id="txtUsu" name="txtUsu" type="text" class="input">
				</div>
				<div class="group">
					<label for="txtCla" class="label">Contraseña</label>
					<input id="txtCla"  name="txtCla" type="password" class="input" data-type="password">
				</div>
				<div style="text-align: center"  class=" s col-lg-12  control-label">
					<input type="button"  name="frmIngreso" value="Ingresar" class="btn btn-primary col-md-4" onclick="Validacion()" >
				</div>
                            
				<div class="hr"></div>
			</div>
		</div>
	</div>
        </div>
                  </form>
        </div>
          
        <!-- <div class="container card border-warning mb-3  shadow-lg" style="max-width: 40rem; margin-top: 100px; ">
         <div class="card-body text-primay">
             <h1 style="text-align: center">Ingreso al Sistema</h1>
            <hr>
             
            <div class="form-horizontal" role="form">
                <form name="frmIngreso" action="<%= raiz %>/Controlador">
                  <input type="hidden" id="accion" name="accion" value="Ingresar"> 
                    
                    <div class=" form-group ">
                        <label for="txtUsu" class="col-md-4 control-label">Usuario:</label>
                        <div class="col-md-12">
                            <input type="text" id="txtUsu" name="txtUsu" placeholder="Ingrese su Usuario" class="form-control">
                        </div>
                    </div>
                     <div class="form-group ">
                        <label for="txtCla" class="col-md-4 control-label">Clave:</label>
                        <div class="col-md-12">
                            <input type="password" id="txtCla" name="txtCla" placeholder="Ingrese su Clave" class="form-control">
                        </div>
                    </div>
                 

                  
                  <div style="text-align: center"  class=" s col-lg-12  control-label">
                          <input type="button"  name="frmIngreso" value="Ingresar" class="btn btn-primary col-md-4" onclick="ValidarLoguin()" >
         
                    </div>
                </form>
            </div>
         </div>
          </div>-->
    </body>
                  <script src="../js/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
                        <script src="../js/popper.min.js" type="text/javascript"></script>
                          <script src="../js/bootstrap.min.js" type="text/javascript"></script>
          <script src="../plugins/sweetalert/sweetalert.min.js" type="text/javascript"></script>
    <script src="../plugins/sweetalert/sweetalert.min.js" type="text/javascript"></script>
  

  

</html>
