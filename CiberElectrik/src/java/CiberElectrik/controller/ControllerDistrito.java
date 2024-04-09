/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package CiberElectrik.controller;

import CiberElectrik.Bean.BeanDistrito;
import CiberElectrik.dao.DaoDistrito;

import CiberElectrik.imp.ImpDistrito;
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
@WebServlet(name = "Distrito", urlPatterns = {"/Distrito"})
public class ControllerDistrito extends HttpServlet {

       DaoDistrito daodistrito = new ImpDistrito();
    // creamos el objeto de la clase BeanPerfil
    BeanDistrito objdistrito = new BeanDistrito();
    int cod = 0;
    String accion = "", nom = "";
    boolean est = false, res = false;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControllerDistrito</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerDistrito at " + request.getContextPath() + "</h1>");
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
                objdistrito.setCodigo(cod);
                res = daodistrito.HabilitarDistrito(objdistrito);
                if (res == true) {
                    out.println("<script>alert('se habilito de forma correcta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmBuscarDistrito.jsp'>");
                } else {
                    out.println("<script>alert('no se pudo habilitar');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmBuscarDistrito.jsp'>");
                }
                break;
                case "deshabilitar":
                cod = Integer.parseInt(request.getParameter("x"));
                objdistrito.setCodigo(cod);
                res = daodistrito.EliminarDistrito(objdistrito);
                if (res == true) {
                    out.println("<script>alert('se deshabilito de forma correcta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmBuscarDistrito.jsp'>");
                } else {
                    out.println("<script>alert('no se pudo deshabilitar');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmBuscarDistrito.jsp'>");
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
                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }

                //enviamos los datos a la clase
                objdistrito.setNombre(nom);
                objdistrito.setEstado(est);
                //llamamos la funcion insertar perfil
                res = daodistrito.RegistrarDistrito(objdistrito);
                if (res = true) {
                    
                    request.setAttribute("mensaje", "Se registro el Distrito de forma correcta");
                    
                    request.getRequestDispatcher("Control?menu=Distrito&accion=mostrar").forward(request, response);
                   // out.println("<script>alert('Se registro el Distrito de forma correcta ');</script>");
                 //   out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmMostrarDistrito.jsp'>");
                
                } else {
                    out.println("<script>alert('No se pudo Distrito el Perfil');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmMostrarDistrito.jsp'>");
                }
                break;
            case "actualizar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));
                nom = request.getParameter("txtNom");
                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }

                //enviamos los datos a la clase
                objdistrito.setCodigo(cod);
                objdistrito.setNombre(nom);
                objdistrito.setEstado(est);
                //llamamos la funcion insertar perfil
                res = daodistrito.ActualizarDistrito(objdistrito);
                if (res = true) {
                    out.println("<script>alert('Se actualizo el Distrito de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmMostrarDistrito.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo actulizar el Distrito');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmMostrarDistrito.jsp'>");
                }
                break;
            case "eliminar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));
                //enviamos los datos a la clase
                objdistrito.setCodigo(cod);

                //llamamos la funcion insertar perfil
                res = daodistrito.EliminarDistrito(objdistrito);
             /*   if (res = true) {
                    out.println("<script>alert('Se elimino  el Distrito de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmMostrarDistrito.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo eliminar el Distrito');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmMostrarDistrito.jsp'>");
                }*/
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
