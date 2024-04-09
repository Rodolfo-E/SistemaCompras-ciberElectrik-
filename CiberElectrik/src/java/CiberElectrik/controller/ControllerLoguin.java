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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jboss.weld.servlet.SessionHolder;

/**
 *
 * @author RODOLFO
 */
@WebServlet(name = "Loguin", urlPatterns = {"/Loguin"})
public class ControllerLoguin extends HttpServlet {

      //crear la implementacion
    DaoLoguin daousuario = new ImpLoguin();
    // creamos el objeto de la clase BeanPerfil
    BeanUsuario objusuario = new BeanUsuario();
  
    int cod = 0,codp=0;
    String  usu = "",cla="";
    boolean est = false, res = false;
    int r;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        response.setContentType("text/html;charset=UTF-8");
          PrintWriter out = response.getWriter();
          HttpSession sesion=request.getSession();
          
      String accion=request.getParameter("accion");
        if(accion.equals("Ingresar")){
             usu = request.getParameter("txtUsu");
                 cla = request.getParameter("txtCla");
                 
               objusuario.setNombre(usu);
                objusuario.setClave(cla);
               
                r=daousuario.ValidarUsuario(objusuario);
                if(r==1 && objusuario.getPerfil().getNombre().equals("Administrador")){
                   
                    sesion.setAttribute("Administrador",objusuario);
                     out.println("<script>alert('Bienvenido al Sistema ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/menuprincipal/frmMenuPrincipal.jsp'>");
                }else if(r==1 && objusuario.getPerfil().getNombre().equals("Vendedor")){
                    sesion.setAttribute("Vendedor",objusuario);
                     out.println("<script>alert('Bienvenido al Sistema ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/menuprincipal/frmVendedor.jsp'>");
                }else{
                    
                    out.println("<script>alert('Usuario o Clave Incorrecta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/ingreso/frmIngreso.jsp'>");
                }
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
      //  processRequest(request, response);
                PrintWriter out = response.getWriter();
                  /* try {
       // accion = request.getParameter("accion");
     //   switch (accion.toLowerCase()) {
     //       case "ingresar":
                //capturando valores
                 usu = request.getParameter("txtUsu");
                 cla = request.getParameter("txtCla");
                 
             
            
                //enviamos los datos a la clase
               
             
                objusuario.setNombre(usu);
                objusuario.setClave(cla);
              
              
                //llamamos la funcion insertar perfil
         //       res = daousuario.ValidarUsuario(objusuario);
                if (res = true) {
                    out.println("<script>alert('Bienvenido al Sistema ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/menuprincipal/frmMenuPrincipal.jsp'>");
                } else {
                    out.println("<script>alert('Erro al Ingresar al Sistema');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/ingreso/frmIngreso.jsp'>");
                }
                //    break;
         } catch (Exception e) {
            out.println("<script>alert('" + e.toString() + "')</script>");
        } */
           
   // }
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
