/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CiberElectrik.controller;

import CiberElectrik.Bean.BeanCategoria;
import CiberElectrik.Bean.BeanProducto;
import CiberElectrik.Bean.BeanProveedor;
import CiberElectrik.dao.DaoProducto;
import CiberElectrik.imp.ImpProducto;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig  
public class ControladorProducto extends HttpServlet {

   //crear la implementacion
    DaoProducto daoproducto = new ImpProducto();
    // creamos el objeto de la clase BeanPerfil
    BeanProducto objproducto = new BeanProducto();
    
    BeanProveedor objproveedor=new BeanProveedor();
    BeanCategoria objcategoria=new BeanCategoria();
    int cod = 0,codp=0,codc=0;
    double pre=0;
    String accion = "", nom = "",can="";
    Part part;
    boolean est = false, res = false;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
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
     /*        PrintWriter out = response.getWriter();
         accion = request.getParameter("accion");
        switch (accion.toLowerCase()) {
            case "registrar":
                //capturando valores
                 nom = request.getParameter("txtNom");
                 can = request.getParameter("txtCan");
                 pre= Double.parseDouble(request.getParameter("txtPre"));
                 part=request.getPart("filefoto");
                 InputStream inputStream=part.getInputStream();
            
                 
                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }
               codp=Integer.parseInt(request.getParameter("cboProveedor"));
               objproveedor.setCodigo(codp);
               
                codc=Integer.parseInt(request.getParameter("cboCategoria"));
               objcategoria.setCodigo(codc);
               
                //enviamos los datos a la clase
               
               
                objproducto.setNombre(nom);
                objproducto.setCantidad(can);
                objproducto.setPrecio(pre);
                 objproducto.setPrecio(pre);
                objproducto.setFoto("");
                 objproducto.setEstado(est);
                objproducto.setProveedor(objproveedor);
                 objproducto.setCategoria(objcategoria);
         
                //llamamos la funcion insertar perfil
                res = daoproducto.RegistrarProducto(objproducto);
                if (res = true) {
                    out.println("<script>alert('Se registro el Producto de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/producto/frmMostrarProducto.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo Registrar el Producto');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/producto/frmMostrarProducto.jsp'>");
                }
                break;
            case "actualizar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));
      
                 nom = request.getParameter("txtNom");
                 can = request.getParameter("txtCan");
                 pre = Double.parseDouble(request.getParameter("txtPre"));
                
                 
                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }
                 codp=Integer.parseInt(request.getParameter("cboProveedor"));
               objproveedor.setCodigo(codp);
               
                codc=Integer.parseInt(request.getParameter("cboCategoria"));
               objcategoria.setCodigo(codc);
                //enviamos los datos a la clase
               
                objproducto.setCodigo(cod);
                        objproducto.setNombre(nom);
                objproducto.setCantidad(can);
                objproducto.setPrecio(pre);
                objproducto.setEstado(est);
                objproducto.setProveedor(objproveedor);
                 objproducto.setCategoria(objcategoria);
                //llamamos la funcion insertar perfil
                res = daoproducto.ActualizarProducto(objproducto);
                if (res = true) {
                    out.println("<script>alert('Se actualizo el Producto de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/producto/frmMostrarProducto.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo actulizar el Producto');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/producto/frmMostrarProducto.jsp'>");
                }
                break;
            case "eliminar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));
                //enviamos los datos a la clase
                objproducto.setCodigo(cod);

                //llamamos la funcion insertar perfil
                res = daoproducto.EliminarProducto(objproducto);
                if (res = true) {
                    out.println("<script>alert('Se elimino  el Producto de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/producto/frmMostrarProducto.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo eliminar el Producto');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/producto/frmMostrarProducto.jsp'>");
                }
                break;
            default:
        }*/
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
