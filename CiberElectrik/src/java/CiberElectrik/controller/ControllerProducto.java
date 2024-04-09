/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CiberElectrik.controller;

import CiberElectrik.Bean.BeanCarrito;
import CiberElectrik.Bean.BeanCategoria;
import CiberElectrik.Bean.BeanProducto;
import CiberElectrik.Bean.BeanProveedor;
import CiberElectrik.dao.DaoProducto;
import CiberElectrik.imp.ImpProducto;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "Producto", urlPatterns = {"/Producto"})
public class ControllerProducto extends HttpServlet {

    //crear la implementacion
    DaoProducto daoproducto = new ImpProducto();
    // creamos el objeto de la clase BeanPerfil
    BeanProducto objproducto = new BeanProducto();

    BeanProveedor objproveedor = new BeanProveedor();
    BeanCategoria objcategoria = new BeanCategoria();
    int cod = 0, codp = 0, codc = 0;
    double pre = 0;
    String accion = "", nom = "", foto = "";
    Part part;
    int can = 0;
    boolean est = false, res = false;
    List<BeanProducto> productos = new ArrayList<>();
    List<BeanCarrito> listacarro = new ArrayList<>();

    int item;
    double totalpagar = 0.0;
    int cantidad = 1;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("hacer");
        //HttpSession sesion=request.getSession();
        productos = daoproducto.MostrarProducto();
        switch (accion) {
            case "agregarCarrito":
                int cod = Integer.parseInt(request.getParameter("x"));

                objproducto = daoproducto.listarId(cod);
                item = item + 1;
                BeanCarrito carrito = new BeanCarrito();
                carrito.setItem(item);
                carrito.setCodigoproducto(objproducto.getCodigo());
                carrito.setDescripcion(objproducto.getNombre());
                carrito.setPreciocompra(objproducto.getPrecio());
                carrito.setCantidad(cantidad);
                carrito.setSubtotal(cantidad * objproducto.getPrecio());
                listacarro.add(carrito);
                request.getSession().setAttribute("contador", listacarro.size());
                //  request.getRequestDispatcher("/intranet/mantenimiento/producto/frmCatalogoProducto.jsp").forward(request, response);

                //   request.getRequestDispatcher("/menuprincipal/frmMenuPrincipal.jsp");
                break;
            case "Carrito":

                break;

            default:
                //   request.setAttribute("productos", productos);
                request.getRequestDispatcher("/intranet/mantenimiento/producto/frmCatalogoProducto.jsp").forward(request, response);

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
                    objproducto.setCodigo(cod);
                    res = daoproducto.HabilitarProducto(objproducto);
                    if (res == true) {
                        out.println("<script>alert('se habilito de forma correcta');</script>");
                        out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Producto&accion=buscar'>");
                    } else {
                        out.println("<script>alert('no se pudo habilitar');</script>");
                        out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Producto&accion=buscar'>");
                    }
                    break;
                case "deshabilitar":
                    cod = Integer.parseInt(request.getParameter("x"));
                    objproducto.setCodigo(cod);
                    res = daoproducto.EliminarProducto(objproducto);
                    if (res == true) {
                        out.println("<script>alert('se deshabilito de forma correcta');</script>");
                        out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Producto&accion=buscar'>");
                    } else {
                        out.println("<script>alert('no se pudo deshabilitar');</script>");
                        out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Producto&accion=buscar'>");
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
                can = Integer.parseInt(request.getParameter("txtCan"));
                pre = Double.parseDouble(request.getParameter("txtPre"));

                /*         part=request.getPart("filefoto");
                 InputStream inputStream=part.getInputStream();
                 */
                foto = request.getParameter("filefoto");

                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }
                codp = Integer.parseInt(request.getParameter("cboProveedor"));
                objproveedor.setCodigo(codp);

                codc = Integer.parseInt(request.getParameter("cboCategoria"));
                objcategoria.setCodigo(codc);

                //enviamos los datos a la clase
                objproducto.setNombre(nom);
                objproducto.setCantidad(can);
                objproducto.setPrecio(pre);
                objproducto.setPrecio(pre);
                objproducto.setFoto(foto);
                objproducto.setEstado(est);
                objproducto.setProveedor(objproveedor);
                objproducto.setCategoria(objcategoria);

                //llamamos la funcion insertar perfil
                res = daoproducto.RegistrarProducto(objproducto);
                if (res = true) {

                    out.println("<script>alert('Se registro el Producto de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Producto&accion=mostrar'>");
                    /*       request.getRequestDispatcher("/intranet/mantenimiento/producto/frmMostrarProducto.jsp").forward(request, response);*/
                } else {
                    out.println("<script>alert('No se pudo Registrar el Producto');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Producto&accion=mostrar'>");
                }
                break;
            case "actualizar":
                //capturando valores
                cod = Integer.parseInt(request.getParameter("txtCod"));

                nom = request.getParameter("txtNom");
                can = Integer.parseInt(request.getParameter("txtCan"));
                pre = Double.parseDouble(request.getParameter("txtPre"));
                String url = request.getParameter("url");
                foto = request.getParameter("filefoto");

                if (foto.equals("")) {
                    foto = url;
                }

                if (request.getParameter("chkEstado") != null) {
                    est = true;
                } else {
                    est = false;
                }
                codp = Integer.parseInt(request.getParameter("cboProveedor"));
                objproveedor.setCodigo(codp);

                codc = Integer.parseInt(request.getParameter("cboCategoria"));
                objcategoria.setCodigo(codc);
                //enviamos los datos a la clase

                objproducto.setCodigo(cod);
                objproducto.setNombre(nom);
                objproducto.setCantidad(can);
                objproducto.setPrecio(pre);
                objproducto.setFoto(foto);
                objproducto.setEstado(est);
                objproducto.setProveedor(objproveedor);
                objproducto.setCategoria(objcategoria);
                //llamamos la funcion insertar perfil
                res = daoproducto.ActualizarProducto(objproducto);
                if (res = true) {
                    out.println("<script>alert('Se actualizo el Producto de forma correcta ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Producto&accion=mostrar'>");
                } else {
                    out.println("<script>alert('No se pudo actulizar el Producto');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Producto&accion=mostrar'>");
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
                    out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Producto&accion=mostrar'>");
                } else {
                    out.println("<script>alert('No se pudo eliminar el Producto');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Producto&accion=mostrar'>");
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
