/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CiberElectrik.controller;

import CiberElectrik.Bean.BeanCategoria;
import CiberElectrik.Bean.BeanCliente;
import CiberElectrik.Bean.BeanDistrito;
import CiberElectrik.Bean.BeanProducto;
import CiberElectrik.Bean.BeanProveedor;
import CiberElectrik.dao.DaoDistrito;
import CiberElectrik.dao.DaoProducto;
import CiberElectrik.dao.daoCliente;
import CiberElectrik.imp.ImpCliente;
import CiberElectrik.imp.ImpProducto;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author RODOLFO
 */
@WebServlet(name = "Cliente", urlPatterns = {"/Cliente"})
public class ControllerCliente extends HttpServlet {

    //crear la implementacion
    daoCliente daocliente = new ImpCliente();
    // creamos el objeto de la clase BeanPerfil
    BeanCliente objcliente = new BeanCliente();

    BeanDistrito objdistrito = new BeanDistrito();

    int cod = 0, codd = 0;

    String accion = "", nom = "", ape = "", usu = "", cla = "", dir = "", dni = "", fec = "", cor = "", tel = "", cel = "";

    boolean est = false, res = false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControllerCliente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerCliente at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);

        PrintWriter out = response.getWriter();
        accion = request.getParameter("accion");
        try {
            switch (accion) {

                case "habilitar":
                    cod = Integer.parseInt(request.getParameter("x"));
                    objcliente.setCodigo(cod);
                    res = daocliente.HabilitarCliente(objcliente);
                    if (res == true) {
                        out.println("<script>alert('se habilito de forma correcta');</script>");
                        out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmBuscarCliente.jsp'>");
                    } else {
                        out.println("<script>alert('no se pudo habilitar');</script>");
                        out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmBuscarCliente.jsp'>");
                    }
                    break;
                case "deshabilitar":
                    cod = Integer.parseInt(request.getParameter("x"));
                    objdistrito.setCodigo(cod);
                    res = daocliente.EliminarCliente(objcliente);
                    if (res == true) {
                        out.println("<script>alert('se deshabilito de forma correcta');</script>");
                        out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmBuscarCliente.jsp'>");
                    } else {
                        out.println("<script>alert('no se pudo deshabilitar');</script>");
                        out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/distrito/frmBuscarCliente.jsp'>");
                    }
                    break;
                default:
            }
        } catch (Exception e) {
            out.println("<script>alert('" + e.toString() + "')</script>");
        }

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
        PrintWriter out = response.getWriter();

        accion = request.getParameter("accion");
        switch (accion.toLowerCase()) {
            case "registrar":
                //capturando valores
                nom = request.getParameter("txtNom");
                ape = request.getParameter("txtApe");
                usu = request.getParameter("txtUsu");
                cla = request.getParameter("txtCla");
                dir = request.getParameter("txtDir");

                fec = request.getParameter("txtFec");
                cor = request.getParameter("txtCor");
                tel = request.getParameter("txtTel");
                cel = request.getParameter("txtCel");

                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }
                codd = Integer.parseInt(request.getParameter("cboDistrito"));
                objdistrito.setCodigo(codd);

                //enviamos los datos a la clase
                objcliente.setNombre(nom);

                objcliente.setApellido(ape);
                objcliente.setUsuario(usu);
                objcliente.setClave(cla);
                objcliente.setDireccion(dir);
                objcliente.setFecha(fec);
                objcliente.setCorreo(cor);
                objcliente.setTelefono(tel);
                objcliente.setCelular(cel);

                objcliente.setEstado(est);
                objcliente.setDistrito(objdistrito);

                //llamamos la funcion insertar perfil
                res = daocliente.RegistrarCliente(objcliente);
                if (res = true) {
                    out.println("<script>alert('Se registro el Cliente de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/cliente/frmMostrarCliente.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo Registrar el Cliente');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/cliente/frmMostrarCliente.jsp'>");
                }
                break;
               
            case "registrarws":
                   //capturando valores
                nom = request.getParameter("txtNom");
                ape = request.getParameter("txtApe");
                usu = request.getParameter("txtUsu");
                cla = request.getParameter("txtCla");
                dir = request.getParameter("txtDir");
              
                fec = request.getParameter("txtFec");
                cor = request.getParameter("txtCor");
                tel = request.getParameter("txtTel");
                cel = request.getParameter("txtCel");

                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }
                    
               codd = Integer.parseInt(request.getParameter("cboDistrito"));
                objdistrito.setCodigo(codd);

                //enviamos los datos a la clase
                objcliente.setNombre(nom);

                objcliente.setApellido(ape);
                objcliente.setUsuario(usu);
                objcliente.setClave(cla);
                objcliente.setDireccion(dir);
                objcliente.setFecha(fec);
                objcliente.setCorreo(cor);
                objcliente.setTelefono(tel);
                objcliente.setCelular(cel);

                objcliente.setEstado(est);
                objcliente.setDistrito(objdistrito);

                //llamamos la funcion insertar perfil
                res = daocliente.RegistrarCliente(objcliente);
                if (res = true) {
                    out.println("<script>alert('Se registro el Cliente de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Carrito&accion=mostrar'>");
                } else {
                    out.println("<script>alert('No se pudo Registrar el Cliente');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/cliente/frmMostrarCliente.jsp'>");
                }
                break;
                
            case "actualizar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));

                nom = request.getParameter("txtNom");
                ape = request.getParameter("txtApe");
                usu = request.getParameter("txtUsu");
                cla = request.getParameter("txtCla");
                dir = request.getParameter("txtDir");

                fec = request.getParameter("txtFec");
                cor = request.getParameter("txtCor");
                tel = request.getParameter("txtTel");
                cel = request.getParameter("txtCel");

                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }
                codd = Integer.parseInt(request.getParameter("cboDistrito"));
                objdistrito.setCodigo(codd);

                //enviamos los datos a la clase
                objcliente.setCodigo(cod);
                objcliente.setNombre(nom);

                objcliente.setApellido(ape);
                objcliente.setUsuario(usu);
                objcliente.setClave(cla);
                objcliente.setDireccion(dir);
                objcliente.setFecha(fec);
                objcliente.setCorreo(cor);
                objcliente.setTelefono(tel);
                objcliente.setCelular(cel);

                objcliente.setEstado(est);
                objcliente.setDistrito(objdistrito);
                //llamamos la funcion insertar perfil
                res = daocliente.ActualizarCliente(objcliente);
                if (res = true) {
                    out.println("<script>alert('Se actualizo el Cliente de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/cliente/frmMostrarCliente.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo actulizar el Cliente');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/cliente/frmMostrarCliente.jsp'>");
                }
                break;
            case "eliminar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));
                //enviamos los datos a la clase
                objcliente.setCodigo(cod);

                //llamamos la funcion insertar perfil
                res = daocliente.EliminarCliente(objcliente);
                if (res = true) {
                    out.println("<script>alert('Se elimino  el Cliente de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/cliente/frmMostrarCliente.jsp'>");
                } else {
                    out.println("<script>alert('No se pudo eliminar el Cliente');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=/CiberElectrik/intranet/mantenimiento/cliente/frmMostrarCliente.jsp'>");
                }
                break;
            default:
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
