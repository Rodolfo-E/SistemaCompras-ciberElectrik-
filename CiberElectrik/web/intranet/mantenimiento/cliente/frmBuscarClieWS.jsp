<%-- 
    Document   : frmBuscarClieWS
    Created on : 02-may-2021, 16:26:05
    Author     : RODOLFO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%
         String nom="",dir="";
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
    <body>
         <div class="container">
            <h1>Buscar Cliente por Dni</h1>
            <hr>
            <div class="form-horizontal" role="form">
             <form  method="post"  >
                 
                   <div class="form-group">
                        <label for="txtBus" class="col-md-2 control-label">DNI:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtBus" name="txtBus" class="form-control">
                                 
                    
                   </div>  
                         </div>
                         <%-- start web service invocation --%><hr/>
                       <%
    try {
	org.tempuri.BuscarCliente service = new org.tempuri.BuscarCliente();
	org.tempuri.BuscarClienteSoap port = service.getBuscarClienteSoap();
	 // TODO initialize WS operation arguments here
	String dni =request.getParameter("txtBus");
	// TODO process result here
	java.lang.String result = port.buscar(dni);
        
        String[]rs=result.split(",");
      //  for(int i=0;i<rs.length;i++){
       //   out.println(rs[0]+"<br>");
        //   out.println(rs[1]+"<br>");
       nom=rs[0];
        dir=rs[1];
      %> 



  
   
                  
                     <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtNom" value="<%= nom%>" class="form-control">
                                 
                    
                   </div>  
                        
                   </div>
                            
                     <div class="form-group">
                        <label for="txtDir" class="col-md-2 control-label">Dieccion:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtDir" name="txtDir" value="<%=dir%>" class="form-control">
                                 
                    
                   </div>  
              </div>
                        <%  } catch (Exception ex) {
	        out.println("No se encontraron los Datos ");
    } %>    
      <%-- end web service invocation --%><hr/>
                  
                      <div class="col-md-12 control-label">
                     <input type="submit"  value="Buscar" class="btn btn-primary"  >
                      </div>
                    
                    <!-- 
                   <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txNom" class="form-control">
                                 
                    
                   </div>  
                        
                   </div>
                     
                   <div class="form-group">
                        <label for="txtNom" class="col-md-2 control-label">Direccion:</label>
                        <div class="col-md-4">
                            <input type="text" id="txtNom" name="txtDir" class="form-control">
                                 
                    
                   </div>  
                        
                   </div>-->
             </form>
            </div>
         </div>
        
   
    
  
    </body>
    
</html>
