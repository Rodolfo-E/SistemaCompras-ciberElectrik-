/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CiberElectrik.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author RODOLFO
 */
public class Control extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String menu=request.getParameter("menu");    
        String accion=request.getParameter("accion");
        
     if(menu.equals("Distrito")){
            switch(accion){
                case"mostrar":
                       request.getRequestDispatcher("/intranet/mantenimiento/distrito/frmMostrarDistrito.jsp").forward(request, response);
                break;
                 case "registrar":
                         request.getRequestDispatcher("/intranet/mantenimiento/distrito/frmRegistrarDistrito.jsp").forward(request, response);
                break;
                case "actualizar":
                            request.getRequestDispatcher("/intranet/mantenimiento/distrito/frmActualizarDistrito.jsp").forward(request, response);
                break;
                case "eliminar":
                       request.getRequestDispatcher("/intranet/mantenimiento/distrito/frmEliminarDistrito.jsp").forward(request, response);
                       
                       break;
                case "buscar":
                 request.getRequestDispatcher("/intranet/mantenimiento/distrito/frmBuscarDistrito.jsp").forward(request, response);
                       
                  break;
                  
                        default:
                                     throw new AbstractMethodError();
            }
            
        }
       
         if(menu.equals("Proveedor")){
            switch(accion){
                case"mostrar":
                       request.getRequestDispatcher("/intranet/mantenimiento/proveedor/frmMostrarProveedor.jsp").forward(request, response);
                break;
                 case "registrar":
                         request.getRequestDispatcher("/intranet/mantenimiento/proveedor/frmRegistrarProveedor.jsp").forward(request, response);
                break;
                case "actualizar":
                            request.getRequestDispatcher("/intranet/mantenimiento/proveedor/frmActualizarProveedor.jsp").forward(request, response);
                break;
                case "eliminar":
                       request.getRequestDispatcher("/intranet/mantenimiento/proveedor/frmEliminarProveedor.jsp").forward(request, response);
                       
                       break;
                case "buscar":
                 request.getRequestDispatcher("/intranet/mantenimiento/proveedor/frmBuscarProveedor.jsp").forward(request, response);
                       
                  break;
                 
          
                  
                        default:
                                     throw new AbstractMethodError();
            }
        }
         if(menu.equals("Compra")){
            switch(accion){
                case"mostrar":
                       request.getRequestDispatcher("/intranet/mantenimiento/orden_compra/frmListadoProveedor.jsp").forward(request, response);
                break;
                 case "registrar":
                         request.getRequestDispatcher("/intranet/mantenimiento/proveedor/frmRegistrarProveedor.jsp").forward(request, response);
                break;
                case "actualizar":
                            request.getRequestDispatcher("/intranet/mantenimiento/proveedor/frmActualizarProveedor.jsp").forward(request, response);
                break;
                case "eliminar":
                       request.getRequestDispatcher("/intranet/mantenimiento/proveedor/frmEliminarProveedor.jsp").forward(request, response);
                       
                       break;
                case "buscar":
                 request.getRequestDispatcher("/intranet/mantenimiento/orden_compra/frmRegistrarOrdenCompra.jsp").forward(request, response);
                       
                  break;
                 
          
                  
                        default:
                                     throw new AbstractMethodError();
            }
        }
         
         
           if(menu.equals("Producto")){
            switch(accion){
                case"mostrar":
                       request.getRequestDispatcher("/intranet/mantenimiento/producto/frmMostrarProducto.jsp").forward(request, response);
                break;
                 case "registrar":
                         request.getRequestDispatcher("/intranet/mantenimiento/producto/frmRegistrarProducto.jsp").forward(request, response);
                break;
                case "actualizar":
                            request.getRequestDispatcher("/intranet/mantenimiento/producto/frmActualizarProducto.jsp").forward(request, response);
                break;
                case "eliminar":
                       request.getRequestDispatcher("/intranet/mantenimiento/producto/frmEliminarProducto.jsp").forward(request, response);
                       
                       break;
                case "buscar":
                 request.getRequestDispatcher("/intranet/mantenimiento/producto/frmBuscarProducto.jsp").forward(request, response);
                       
                  break;
                  case "catalogo":
                 request.getRequestDispatcher("/intranet/mantenimiento/producto/frmCatalogoProducto.jsp").forward(request, response);
                       
                  break;
                  
                  
                        default:
                                     throw new AbstractMethodError();
            }
        }
             if(menu.equals("Carrito")){
            switch(accion){
                
                  case "mostrar":
                 request.getRequestDispatcher("/intranet/mantenimiento/carrito/frmCatalogoProducto.jsp").forward(request, response);      
                  break;  
                       case "listado":
                 request.getRequestDispatcher("/intranet/mantenimiento/carrito/frmCarrito.jsp").forward(request, response);      
                  break;   
                       case "compra":
                 request.getRequestDispatcher("/intranet/mantenimiento/carrito/frmCompras.jsp").forward(request, response);      
                  break;  
                     case "detalle":
                 request.getRequestDispatcher("/intranet/mantenimiento/carrito/frmDetalleCompra.jsp").forward(request, response);      
                  break; 
                        default:
                                     throw new AbstractMethodError();
            }
        }
          if(menu.equals("Categoria")){
            switch(accion){
                case"mostrar":
                       request.getRequestDispatcher("/intranet/mantenimiento/categoria/frmMostrarCategoria.jsp").forward(request, response);
                break;
                 case "registrar":
                         request.getRequestDispatcher("/intranet/mantenimiento/categoria/frmRegistrarCategoria.jsp").forward(request, response);
                break;
                case "actualizar":
                            request.getRequestDispatcher("/intranet/mantenimiento/categoria/frmActualizarCategoria.jsp").forward(request, response);
                break;
                case "eliminar":
                       request.getRequestDispatcher("/intranet/mantenimiento/categoria/frmEliminarCategoria.jsp").forward(request, response);
                       
                       break;
                case "buscar":
                 request.getRequestDispatcher("/intranet/mantenimiento/categoria/frmBuscarCategoria.jsp").forward(request, response);
                       
                  break;
                  
                        default:
                                     throw new AbstractMethodError();
            }
        }
            if(menu.equals("Usuario")){
            switch(accion){
                case"mostrar":
                       request.getRequestDispatcher("/intranet/mantenimiento/usuario/frmMostrarUsuario.jsp").forward(request, response);
                break;
                 case "registrar":
                         request.getRequestDispatcher("/intranet/mantenimiento/usuario/frmRegistrarUsuario.jsp").forward(request, response);
                break;
                case "actualizar":
                            request.getRequestDispatcher("/intranet/mantenimiento/usuario/frmActualizarUsuario.jsp").forward(request, response);
                break;
                case "eliminar":
                       request.getRequestDispatcher("/intranet/mantenimiento/usuario/frmEliminarUsuario.jsp").forward(request, response);
                       
                       break;
                case "buscar":
                 request.getRequestDispatcher("/intranet/mantenimiento/usuario/frmBuscarUsuario.jsp").forward(request, response);
                       
                  break;
                  
                     
                        default:
                                     throw new AbstractMethodError();
            }
        }
           if(menu.equals("Cliente")){
                switch(accion){
                case"mostrar":
                       request.getRequestDispatcher("/intranet/mantenimiento/cliente/frmMostrarCliente.jsp").forward(request, response);
                break;
                 case "registrar":
                         request.getRequestDispatcher("/intranet/mantenimiento/cliente/frmRegistrarCliente.jsp").forward(request, response);
                break;
                 case "registrarws":
                         request.getRequestDispatcher("/intranet/mantenimiento/cliente/frmRegistrarClienteWS.jsp").forward(request, response);
                break;
                case "actualizar":
                            request.getRequestDispatcher("/intranet/mantenimiento/cliente/frmActualizarCliente.jsp").forward(request, response);
                break;
                case "eliminar":
                       request.getRequestDispatcher("/intranet/mantenimiento/cliente/frmEliminarCliente.jsp").forward(request, response);
                       
                       break;
                case "buscar":
                 request.getRequestDispatcher("/intranet/mantenimiento/cliente/frmBuscarCliente.jsp").forward(request, response);
                       
                  break;
                  
                        default:
                                     throw new AbstractMethodError();
            }
            
        }
            if(menu.equals("menu")){
            
        }
       
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
