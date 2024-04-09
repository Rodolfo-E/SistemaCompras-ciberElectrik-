<%-- 
    Document   : frmMostrarDistrito
    Created on : 01-feb-2020, 19:48:22
    Author     : Usuario
--%>

<%@page import="CiberElectrik.Bean.BeanDistrito"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="CiberElectrik.imp.ImpDistrito"%>
<%@page import="CiberElectrik.dao.DaoDistrito"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%-- Autor:Rodolfo Delgado  --%>

    <head>
        <%
//Sirve para obtener la raiz del proyecto
            String raiz = request.getContextPath();
// Es implementar el metodo
            DaoDistrito daoDistrito = new ImpDistrito();
            List<BeanDistrito> listadistrito = new ArrayList<BeanDistrito>();
            listadistrito = daoDistrito.MostrarDistrito();


        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon " href="# "/>
        <link href="<%= raiz%>/intranet/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= raiz%>/intranet/css/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
          <link href="<%= raiz%>/intranet/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="<%= raiz%>/intranet/js/mibiblioteca_1.js" type="text/javascript"></script>
        
                <script >
                    function eliminarMarca(id) {
                        Swal.fire({
                            "title": "¿Estas Seguro?",
                            "text": "Esta accion no se puede deshacer",
                            "icon": "question",
                            "showCancelButton": true,
                            "cancelButtonText": "No, Cancelar",
                            "confirmButtonText": "Si, Eliminar",
                            "reverseButtons": true,
                            "confirmButtonColor": "red",
                        })
                                .then(function (result) {
                                    if (result.isConfirmed) {
                                        $.ajax({
                                            type: 'POST',
                                            url: "Distrito?accion=eliminar&txtCod=" + id,
                                            success: function (res) {
                                                console.log(res);
        
                                            }
        
                                        });
                                        Swal.fire({
                                            "title":"Eliminado",
                                            "text":"El distrito se elimino de forma Exitosa",
                                            "icon":"success" ,
                                            "confirmButtonText":"Aceptar",
                                            
                                            
                                        }).then(function(result2){
                                            if(result2.isConfirmed){
                                                window.location.href="Control?menu=Distrito&accion=mostrar";
                                                
                                            }
                                            
                                        });
                                        
                                    }
        
                                });
        
                    }
        
        
                </script>
    <!--    <script>
            function eliminarMarca(id) {
                Swal.fire({
                    "title": "¿Estas Seguro?",
                    "text": "Esta accion no se puede deshacer",
                    "icon": "question",
                    "showCancelButton": true,
                    "cancelButtonText": "No, Cancelar",
                    "confirmButtonText": "Si, Eliminar",
                    "reverseButtons": true,
                    "confirmButtonColor": "red",
                })
                        .then(function (result) {
                            if (result.isConfirmed) {
                                location.href = "Distrito?accion=eliminar&txtCod="+id;
                                Swal.fire('Eliminado', 'El documento se elimino de forma Exitosa', 'success',{
                                    
                                }).then(function(result2){
                                    if(result2.isConfirmed){
                                         location.href="Control?menu=Distrito&accion=mostrar"
                                    }
                                    
                                });
                        
                            }

                        })

            }


        </script>-->
        <title>Mostrar Distrito</title>
    </head>
    <body>
        <div class="container">
            <h1>Mantenimiento Distrito</h1>
            <div class="form-horizontal" role="form">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover">
                        <thead class="thead-dark">
                        <th>Codigo</th>
                        <th>Nombres</th>
                        <th>Estados</th>
                        <th>Opciones</th>
                    
                        </thead>
                        <tbody>
                            <%
                                //   for (int i = 0; i < daoDistrito.MostrarDistrito().size(); i++) {

                                for (BeanDistrito distr : listadistrito) {
                            %>
                            <tr>
                                <td><%= distr.getCodigo()%></td>
                                <td><% out.println(distr.getNombre());%></td>
                                <%
                                    String est = "";
                                    if (distr.isEstado()) {
                                        est = "Habilitado";
                                    } else {
                                        est = "Deshabilitado";
                                    }
                                %>
                                <td><%=est%></td>

                                <td><a href="<%= raiz%>/Control?menu=Distrito&accion=actualizar&x=<% out.println(distr.getCodigo());%>"  class="btn btn-success" title="Editar"><i class="fa fa-pencil"></i></a>
                               <!-- <td><a href="<%= raiz%>/Control?menu=Distrito&accion=eliminar&x=<% out.println(distr.getCodigo());%>"  class="btn btn-danger">Seleccionar</a></td>-->
                                <a href="#"  onclick="eliminarMarca(<%=distr.getCodigo()%>)" class="btn btn-danger btn-circle" role="button" data-toggle="tooltip"  title="Eliminar" data-original-title="Eliminado"><i class="fa fa-trash"></i></a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
                <a href="<%= raiz%>/Control?menu=Distrito&accion=registrar" value="${mensaje}" class="btn btn-primary">
                    Registrar Distrito

                </a>
                <a href="<%= raiz%>/Control?menu=Distrito&accion=buscar" class="btn btn-primary">
                    Buscar Distrito

                </a>


            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
         <script src="<%= raiz%>/intranet/js/popper.min.js" type="text/javascript"></script>
        <script src="<%= raiz%>/intranet/js/bootstrap.min.js" type="text/javascript"></script>
         <script src="https://kit.fontawesome.com/9ee615fe95.js" crossorigin="anonymous"></script>
        <script src="<%=raiz%>/intranet/js/sweetalert2.min.js" type="text/javascript"></script>
        <%if(request.getAttribute("mensaje")!=null){
         
         %>
        <script>
            $(function (){
                Swal.fire({
                    text:"<%=request.getAttribute("mensaje") %>",
                    icon:"success",
                    confirmButtonText:"Aceptar",
                    
                    
                });
                
                
            });
            
       //     alert("<%=request.getAttribute("mensaje")%>");
        </script>
        <%}%>
    </body>
</html>
