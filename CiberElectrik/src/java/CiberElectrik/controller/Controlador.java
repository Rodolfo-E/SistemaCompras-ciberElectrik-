/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CiberElectrik.controller;

import CiberElectrik.Bean.BeanUsuario;
import CiberElectrik.dao.DaoLoguin;
import CiberElectrik.imp.ImpLoguin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RODOLFO
 */
public class Controlador extends HttpServlet {

    //crear la implementacion
    DaoLoguin daousuario = new ImpLoguin();
    // creamos el objeto de la clase BeanPerfil
    BeanUsuario objusuario = new BeanUsuario();

    int cod = 0, codp = 0;
    String usu = "", cla = "";
    boolean est = false, res = false;
    int r, rusu, rcla;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String accion = request.getParameter("accion");
        if (accion.equals("Ingresar")) {
            usu = request.getParameter("txtUsu");
            cla = request.getParameter("txtCla");

            objusuario.setNombre(usu);
            objusuario.setClave(cla);
            rusu = daousuario.ValidarUsu(objusuario);
            rcla = daousuario.ValidarClave(objusuario);

            if (rusu == 1) {

                if (rcla == 1) {
                    r = daousuario.ValidarUsuario(objusuario);
                    if (rusu == 1 && rcla == 1) {

                        if (r == 1 && objusuario.getPerfil().getNombre().equals("Administrador")) {

                            request.getSession().setAttribute("usu", usu);
                            request.getSession().setAttribute("per", objusuario.getPerfil().getNombre());
                            //   sesion.setAttribute("Administrador",objusuario);

                            out.println("<script>alert('Bienvenido al Sistema');</script>");
                            out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/menuprincipal/frmMenuPrincipal.jsp'>");

                        } else if (r == 1 && objusuario.getPerfil().getNombre().equals("Vendedor")) {
                            request.getSession().setAttribute("usu", usu);
                            request.getSession().setAttribute("per", objusuario.getPerfil().getNombre());
                            out.println("<script>alert('Bienvenido al Sistema');</script>");
                            out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/menuprincipal/frmVendedor.jsp'>");

                        } else {
                            out.println("<script>alert('Roles no Permitidos');</script>");
                            out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/ingreso/frmIngreso.jsp'>");

                        }
                    } else {
                        out.println("<script>alert('Usuario o Clave Incorrecta');</script>");
                        out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/ingreso/frmIngreso.jsp'>");

                    }

                } else if (rcla != 1) {
                    out.println("<script>alert('Clave Incorrecta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/ingreso/frmIngreso.jsp'>");
                } else if (rusu != 1 && rcla != 1) {
                    out.println("<script>alert('Usuario y Clave Incorrecta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/ingreso/frmIngreso.jsp'>");
                }

            } else if (rusu != 1 && rcla != 1) {
                out.println("<script>alert('Usuario y Clave Incorrecta');</script>");
                out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/ingreso/frmIngreso.jsp'>");
            } else if (rusu != 1) {
                out.println("<script>alert('Usuario Incorrecto');</script>");
                out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/ingreso/frmIngreso.jsp'>");
            }

            /*    if(r==1 && objusuario.getPerfil().getNombre().equals("Administrador")){
                    request.getSession().setAttribute("usu",usu);
                      request.getSession().setAttribute("per",objusuario.getPerfil().getNombre());
                  //   sesion.setAttribute("Administrador",objusuario);
                     out.println("<script>alert('Bienvenido al Sistema ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/menuprincipal/frmMenuPrincipal.jsp'>");
                }else if(r==1 && objusuario.getPerfil().getNombre().equals("Vendedor")){
                     request.getSession().setAttribute("usu",usu);
                      request.getSession().setAttribute("per",objusuario.getPerfil().getNombre());
                     out.println("<script>alert('Bienvenido al Sistema ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/menuprincipal/frmVendedor.jsp'>");
                }else{
                    
                    out.println("<script>alert('Usuario o Clave Incorrecta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/ingreso/frmIngreso.jsp'>");
                }*/
 /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ControllerLoguin</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ControllerLoguin at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
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
