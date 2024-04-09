/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package CiberElectrik.controller;

import CiberElectrik.Bean.BeanCategoria;

import CiberElectrik.dao.DaoCategoria;

import CiberElectrik.imp.ImpCategoria;

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
@WebServlet(name = "Categoria", urlPatterns = {"/Categoria"})
public class ControllerCategoria extends HttpServlet {

    
       DaoCategoria daocategoria = new ImpCategoria();
    // creamos el objeto de la clase BeanPerfil
    BeanCategoria objcategoria = new BeanCategoria();
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
            out.println("<title>Servlet ControllerCategoria</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerCategoria at " + request.getContextPath() + "</h1>");
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
                objcategoria.setCodigo(cod);
                res = daocategoria.HabilitarCategoria(objcategoria);
                if (res == true) {
                    out.println("<script>alert('se habilito de forma correcta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/categoria/frmBuscarCategoria.jsp'>");
                } else {
                    out.println("<script>alert('no se pudo habilitar');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/categoria/frmBuscarCategoria.jsp'>");
                }
                break;
                case "deshabilitar":
                cod = Integer.parseInt(request.getParameter("x"));
                objcategoria.setCodigo(cod);
                res = daocategoria.EliminarCategoria(objcategoria);
                if (res == true) {
                    out.println("<script>alert('se deshabilito de forma correcta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/categoria/frmBuscarCategoria.jsp'>");
                } else {
                    out.println("<script>alert('no se pudo deshabilitar');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/categoria/frmBuscarCategoria.jsp'>");
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
                objcategoria.setNombre(nom);
                objcategoria.setEstado(est);
                //llamamos la funcion insertar perfil
                res = daocategoria.RegistrarCategoria(objcategoria);
                if (res = true) {
                    out.println("<script>alert('Se registro la Categoria de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/categoria/frmMostrarCategoria.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo Categoria el Perfil');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/categoria/frmMostrarCategoria.jsp'>");
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
                objcategoria.setCodigo(cod);
                objcategoria.setNombre(nom);
                objcategoria.setEstado(est);
                //llamamos la funcion insertar perfil
                res = daocategoria.ActualizarCategoria(objcategoria);
                if (res = true) {
                    out.println("<script>alert('Se actualizo la Categoria de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/categoria/frmMostrarCategoria.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo actualizar la Categoria');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/categoria/frmMostrarCategoria.jsp'>");
                }
                break;
            case "eliminar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));
                //enviamos los datos a la clase
                objcategoria.setCodigo(cod);

                //llamamos la funcion insertar perfil
                res = daocategoria.EliminarCategoria(objcategoria);
                if (res = true) {
                    out.println("<script>alert('Se elimino  la Categoria de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/categoria/frmMostrarCategoria.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo eliminar la Categoria');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/categoria/frmMostrarCategoria.jsp'>");
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
