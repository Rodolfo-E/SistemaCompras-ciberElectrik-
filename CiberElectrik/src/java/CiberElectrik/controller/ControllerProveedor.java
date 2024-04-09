/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package CiberElectrik.controller;

import CiberElectrik.Bean.BeanDistrito;
import CiberElectrik.Bean.BeanProveedor;
import CiberElectrik.dao.DaoProveedor;
import CiberElectrik.imp.ImpProveedor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "Proveedor", urlPatterns = {"/Proveedor"})
public class ControllerProveedor extends HttpServlet {

   //crear la implementacion
    DaoProveedor daoproveedor = new ImpProveedor();
    // creamos el objeto de la clase BeanPerfil
    BeanProveedor objproveedor = new BeanProveedor();
    BeanDistrito objdistrito=new BeanDistrito();
    int cod = 0,codd=0;
    String accion = "", nom = "",dir="",tel="",cor="",ruc="";
    boolean est = false, res = false;
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControllerProveedor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerProveedor at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
       // processRequest(request, response);
            PrintWriter out = response.getWriter();
        accion = request.getParameter("accion");
        try {
            switch (accion) {
           
                case "habilitar":
                cod = Integer.parseInt(request.getParameter("x"));
                objproveedor.setCodigo(cod);
                res = daoproveedor.HabilitarProveedor(objproveedor);
                if (res == true) {
                    out.println("<script>alert('se habilito de forma correcta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/proveedor/frmBuscarProveedor.jsp'>");
                } else {
                    out.println("<script>alert('no se pudo habilitar');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/proveedor/frmBuscarProveedor.jsp'>");
                }
                break;
                case "deshabilitar":
                cod = Integer.parseInt(request.getParameter("x"));
                objproveedor.setCodigo(cod);
                res = daoproveedor.EliminarProveedor(objproveedor);
                if (res == true) {
                    out.println("<script>alert('se deshabilito de forma correcta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/proveedor/frmBuscarProveedor.jsp'>");
                } else {
                    out.println("<script>alert('no se pudo deshabilitar');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/proveedor/frmBuscarProveedor.jsp'>");
                }
                break;
            default:
            }
        } catch (Exception e) {
            out.println("<script>alert('" + e.toString() + "')</script>");
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();

        accion = request.getParameter("accion");
        switch (accion.toLowerCase()) {
            case "registrar":
                //capturando valores
                 nom = request.getParameter("txtNom");
                 dir = request.getParameter("txtDir");
                 tel = request.getParameter("txtTel");
                 cor = request.getParameter("txtCor");
                 ruc = request.getParameter("txtRuc");
                 
                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }
               codd=Integer.parseInt(request.getParameter("cboDistrito"));
               objdistrito.setCodigo(codd);
               
                //enviamos los datos a la clase
               
               
                objproveedor.setNombre(nom);
                objproveedor.setDireccion(dir);
                objproveedor.setTelefono(tel);
                objproveedor.setCorreo(cor);
                objproveedor.setRuc(ruc);
                objproveedor.setEstado(est);
                objproveedor.setDistrito(objdistrito);
                //llamamos la funcion insertar perfil
                res = daoproveedor.RegistrarProveedor(objproveedor);
                if (res = true) {
                    out.println("<script>alert('Se registro el Proveedor de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/proveedor/frmMostrarProveedor.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo Registrar el Usuario');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/proveedor/frmMostrarProveedor.jsp'>");
                }
                break;
            case "actualizar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));
      
                 nom = request.getParameter("txtNom");
                 dir = request.getParameter("txtDir");
                 tel = request.getParameter("txtTel");
                 cor = request.getParameter("txtCor");
                 ruc = request.getParameter("txtRuc");
                 
                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }
                codd=Integer.parseInt(request.getParameter("cboDistrito"));
               objdistrito.setCodigo(codd);
               
                //enviamos los datos a la clase
               
                objproveedor.setCodigo(cod);
                objproveedor.setNombre(nom);
                objproveedor.setDireccion(dir);
                objproveedor.setTelefono(tel);
                objproveedor.setCorreo(cor);
                objproveedor.setRuc(ruc);
                objproveedor.setEstado(est);
                objproveedor.setDistrito(objdistrito);
                //llamamos la funcion insertar perfil
                res = daoproveedor.ActualizarProveedor(objproveedor);
                if (res = true) {
                    out.println("<script>alert('Se actualizo el Proveedor de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/proveedor/frmMostrarProveedor.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo actulizar el Proveedor');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/proveedor/frmMostrarProveedor.jsp'>");
                }
                break;
            case "eliminar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));
                //enviamos los datos a la clase
                objproveedor.setCodigo(cod);

                //llamamos la funcion insertar perfil
                res = daoproveedor.EliminarProveedor(objproveedor);
                if (res = true) {
                    out.println("<script>alert('Se elimino  el Proveedor de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/proveedor/frmMostrarProveedor.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo eliminar el Proveedor');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/proveedor/frmMostrarProveedor.jsp'>");
                }
                break;
            default:
        }

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
