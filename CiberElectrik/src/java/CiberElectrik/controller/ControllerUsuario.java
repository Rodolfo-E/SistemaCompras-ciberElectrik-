
package CiberElectrik.controller;

import CiberElectrik.Bean.BeanPerfil;
import CiberElectrik.Bean.BeanUsuario;
import CiberElectrik.dao.DaoUsuario;
import CiberElectrik.imp.ImpUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "Usuario", urlPatterns = {"/Usuario"})
public class ControllerUsuario extends HttpServlet {

     //crear la implementacion
    DaoUsuario daousuario = new ImpUsuario();
    // creamos el objeto de la clase BeanPerfil
    BeanUsuario objusuario = new BeanUsuario();
    BeanPerfil objperfil=new BeanPerfil();
    int cod = 0,codp=0;
    String accion = "", nom = "",cla="";
    boolean est = false, res = false;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControllerUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerUsuario at " + request.getContextPath() + "</h1>");
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
     //   processRequest(request, response);
         PrintWriter out = response.getWriter();
        accion = request.getParameter("accion");
        try {
            switch (accion) {
           
                case "habilitar":
                cod = Integer.parseInt(request.getParameter("x"));
                objusuario.setCodigo(cod);
                res = daousuario.HabilitarUsuario(objusuario);
                if (res == true) {
                    out.println("<script>alert('se habilito de forma correcta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/usuario/frmBuscarUsuario.jsp'>");
                } else {
                    out.println("<script>alert('no se pudo habilitar');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/usuario/frmBuscarUsuario.jsp'>");
                }
                break;
                case "deshabilitar":
                cod = Integer.parseInt(request.getParameter("x"));
                objusuario.setCodigo(cod);
                res = daousuario.EliminarUsuario(objusuario);
                if (res == true) {
                    out.println("<script>alert('se deshabilito de forma correcta');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberEelectrik/intranet/mantenimiento/usuario/frmBuscarUsuario.jsp'>");
                } else {
                    out.println("<script>alert('no se pudo deshabilitar');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberEelectrik/intranet/mantenimiento/usuario/frmBuscarUsuario.jsp'>");
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
                 cla = request.getParameter("txtCla");
                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }
               codp=Integer.parseInt(request.getParameter("cboPerfil"));
               objperfil.setCodigo(codp);
               
                //enviamos los datos a la clase
               
               
                objusuario.setNombre(nom);
                objusuario.setClave(cla);
                objusuario.setEstado(est);
                objusuario.setPerfil(objperfil);
                //llamamos la funcion insertar perfil
                res = daousuario.RegistrarUsuario(objusuario);
                if (res = true) {
                    out.println("<script>alert('Se registro el Usuario de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/usuario/frmMostrarUsuario.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo Registrar el Usuario');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/usuario/frmMostrarUsuario.jsp'>");
                }
                break;
            case "actualizar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));
                nom = request.getParameter("txtNom");
                cla= request.getParameter("txtCla");
                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }
                 codp=Integer.parseInt(request.getParameter("cboPerfil"));
               objperfil.setCodigo(codp);
                //enviamos los datos a la clase
                objusuario.setCodigo(cod);
                objusuario.setNombre(nom);
                objusuario.setClave(cla);
                objusuario.setEstado(est);
                 objusuario.setPerfil(objperfil);
                //llamamos la funcion insertar perfil
                res = daousuario.ActualizarUsuario(objusuario);
                if (res = true) {
                    out.println("<script>alert('Se actualizo el usuario de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/usuario/frmMostrarUsuario.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo actulizo el usuario');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/usuario/frmMostrarUsuario.jsp'>");
                }
                break;
            case "eliminar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));
                //enviamos los datos a la clase
                objusuario.setCodigo(cod);

                //llamamos la funcion insertar perfil
                res = daousuario.EliminarUsuario(objusuario);
                if (res = true) {
                    out.println("<script>alert('Se elimino  el Usuario de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/usuario/frmMostrarUsuario.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo eliminar el Usuario');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/usuario/frmMostrarUsuario.jsp'>");
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
