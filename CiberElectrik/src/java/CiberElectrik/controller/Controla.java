/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CiberElectrik.controller;

import CiberElectrik.Bean.BeanCarrito;
import CiberElectrik.Bean.BeanCategoria;
import CiberElectrik.Bean.BeanCliente;
import CiberElectrik.Bean.BeanCompra;
import CiberElectrik.Bean.BeanDetalleCompra;
import CiberElectrik.Bean.BeanPago;
import CiberElectrik.Bean.BeanProducto;
import CiberElectrik.Bean.BeanProveedor;
import CiberElectrik.Bean.BeanUsuario;
import CiberElectrik.Bean.Fecha;
import CiberElectrik.dao.DaoCompra;
import CiberElectrik.dao.DaoLoguin;
import CiberElectrik.dao.DaoProducto;
import CiberElectrik.dao.DaoUsuario;
import CiberElectrik.dao.daoCliente;
import CiberElectrik.imp.ImpCliente;
import CiberElectrik.imp.ImpCompra;
import CiberElectrik.imp.ImpLoguin;
import CiberElectrik.imp.ImpProducto;
import CiberElectrik.imp.ImpUsuario;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author RODOLFO
 */
public class Controla extends HttpServlet {

//crear la implementacion
    DaoProducto daoproducto = new ImpProducto();
    // creamos el objeto de la clase BeanPerfil
    BeanProducto objproducto = new BeanProducto();
    DaoLoguin daoLog = new ImpLoguin();

    BeanPago pago = new BeanPago();
    BeanUsuario objusu = new BeanUsuario();
    daoCliente dapcliente = new ImpCliente();
    BeanCliente objcliente = new BeanCliente();
    DaoCompra cdao = new ImpCompra();

    int codp = 0, codc = 0;
    double pre = 0;
    String accion = "", nom = "", foto = "";
    Part part;
    int can = 0;
    boolean est = false, res = false;
    List<BeanProducto> productos = new ArrayList<>();
    List<BeanCarrito> listacarro = new ArrayList<>();
    String logueo = "Iniciar Sesion";
    String correo = "Iniciar Sesion";
    int item;
    double totalpagar = 0.0;
    int cantidad = 1;
    int cod;
    BeanCarrito carrito;

    int idcompra;
    int idpago;
    double montopagar;
    Fecha fechaSistem = new Fecha();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.setAttribute("logueo", logueo);
        session.setAttribute("correo", correo);
        PrintWriter out = response.getWriter();
        String accion = request.getParameter("accion");
        //HttpSession sesion=request.getSession();
        productos = daoproducto.MostrarProducto();
        switch (accion) {
            case "Comprar":
                totalpagar = 0.0;
                cod = Integer.parseInt(request.getParameter("x"));

                objproducto = daoproducto.listarId(cod);
                item = item + 1;
                BeanCarrito carrito = new BeanCarrito();
                carrito.setItem(item);
                carrito.setCodigoproducto(objproducto.getCodigo());
                carrito.setDescripcion(objproducto.getNombre());
                carrito.setFoto(objproducto.getFoto());
                carrito.setPreciocompra(objproducto.getPrecio());
                carrito.setCantidad(cantidad);
                carrito.setSubtotal(cantidad * objproducto.getPrecio());
                listacarro.add(carrito);
                for (int i = 0; i < listacarro.size(); i++) {
                    totalpagar = totalpagar + listacarro.get(i).getSubtotal();
                    double total = totalpagar + listacarro.get(i).getSubtotal();
                }
                request.setAttribute("totalPagar", totalpagar);
                request.setAttribute("carrito", listacarro);
                request.getSession().setAttribute("contador", listacarro.size());
                request.getRequestDispatcher("/intranet/mantenimiento/carrito/frmCarrito.jsp").forward(request, response);
                break;

            case "agregarCarrito":

                int pos = 0;
                cantidad = 1;
                cod = Integer.parseInt(request.getParameter("x"));

                objproducto = daoproducto.listarId(cod);
                if (listacarro.size() > 0) {
                    for (int i = 0; i < listacarro.size(); i++) {
                        if (cod == listacarro.get(i).getCodigoproducto()) {
                            pos = i;
                        }
                    }
                    if (cod == listacarro.get(pos).getCodigoproducto()) {
                        cantidad = listacarro.get(pos).getCantidad() + cantidad;
                        double subtotal = listacarro.get(pos).getPreciocompra() * cantidad;
                        listacarro.get(pos).setCantidad(cantidad);
                        listacarro.get(pos).setSubtotal(subtotal);
                    } else {
                        item = item + 1;
                        carrito = new BeanCarrito();
                        carrito.setItem(item);
                        carrito.setCodigoproducto(objproducto.getCodigo());
                        carrito.setDescripcion(objproducto.getNombre());
                        carrito.setFoto(objproducto.getFoto());
                        carrito.setPreciocompra(objproducto.getPrecio());
                        carrito.setCantidad(cantidad);
                        carrito.setSubtotal(cantidad * objproducto.getPrecio());
                        listacarro.add(carrito);
                    }
                } else {
                    item = item + 1;
                    carrito = new BeanCarrito();
                    carrito.setItem(item);
                    carrito.setCodigoproducto(objproducto.getCodigo());
                    carrito.setDescripcion(objproducto.getNombre());
                    carrito.setFoto(objproducto.getFoto());
                    carrito.setPreciocompra(objproducto.getPrecio());
                    carrito.setCantidad(cantidad);
                    carrito.setSubtotal(cantidad * objproducto.getPrecio());
                    listacarro.add(carrito);
                }

                request.getSession().setAttribute("contador", listacarro.size());
                //    out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Producto&accion=catalogo'>");
                //      request.getRequestDispatcher(" <meta http-equiv='Refresh' content='1; Control?menu=Producto&accion=catalogo").forward(request, response);

                // request.getRequestDispatcher("/intranet/mantenimiento/carrito/frmCatalogoProducto.jsp").forward(request, response);
                request.getRequestDispatcher("Control?menu=Carrito&accion=mostrar&Controla=Carrito").forward(request, response);

                //   request.getRequestDispatcher("/menuprincipal/frmMenuPrincipal.jsp");
                break;
            case "Eliminar":
                int idPro = Integer.parseInt(request.getParameter("codp"));
             
                for (int i = 0; i < listacarro.size(); i++) {
                    if (listacarro.get(i).getCodigoproducto() == idPro) {
                        listacarro.remove(i);
                    }
                }

                //    request.getRequestDispatcher("Controla?accion=Carrito").forward(request, response);
                out.println("<script>alert('Se Elimino exitosamente ');</script>");
                out.println("<meta http-equiv='Refresh' content='1; url=Controla?accion=Carrito'>");
                break;
            case "Nuevo":

                for (int i = 0; i < listacarro.size(); i++) {

                    listacarro.remove(i);
                }

                //    request.getRequestDispatcher("Controla?accion=Carrito").forward(request, response);
                //  out.println("<script>alert('Se Elimino exitosamente ');</script>");
                request.getRequestDispatcher("Control?menu=Carrito& =mostrar").forward(request, response);
                // out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Carrito&accion=mostrar'>");
                break;
            case "ActualizarCantidad":

                int codpro = Integer.parseInt(request.getParameter("idp"));
                int cant = Integer.parseInt(request.getParameter("Cantidad"));
                for (int i = 0; i < listacarro.size(); i++) {
                    if (listacarro.get(i).getCodigoproducto() == codpro) {

                        listacarro.get(i).setCantidad(cant);
                        double st = listacarro.get(i).getPreciocompra() * cant;
                        listacarro.get(i).setSubtotal(st);
                    }
                }
                //      request.getRequestDispatcher("Controla?accion=Carrito").forward(request, response);
                break;
            case "Buscar":
                String nombre = request.getParameter("txtBuscar");
                productos = daoproducto.Buscar(nombre);
                request.setAttribute("contador", listacarro.size());
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("Control?menu=Carrito&accion=mostrar").forward(request, response);

                break;
            case "Validar":
                String email = request.getParameter("txtemail");
                String pass = request.getParameter("txtpass");

                objcliente.setUsuario(email);
                objcliente.setClave(pass);

                int r = dapcliente.ValidarUsuario(objcliente);
                if (r == 1) {
                    logueo = objcliente.getNombre();
                    correo = objcliente.getCorreo();
                    request.getRequestDispatcher("Controla?accion=Carrito").forward(request, response);
                } else {
                    request.getRequestDispatcher("Control?menu=Carrito&accion=mostrar").forward(request, response);
                }
                /* objusu = daoLog.ValidarUsu(email, pass);
                if (cl.getId() != 0) {
                    logueo = cl.getNombres();
                    correo = cl.getEmail();
                }*/

                break;
            case "Carrito":
                totalpagar = 0.0;
                request.setAttribute("carrito", listacarro);
                /* for(int i=0;i<listacarro.size();i++){
                  totalpagar=totalpagar+listacarro.get(i).getSubtotal();
              }*/

                for (BeanCarrito carr : listacarro) {
                    totalpagar += carr.getSubtotal();
                }
                request.setAttribute("totalPagar", totalpagar);
                //   request.getRequestDispatcher("/intranet/mantenimiento/carrito/frmCarrito.jsp").forward(request, response);
                request.getRequestDispatcher("Control?menu=Carrito&accion=listado").forward(request, response);
                break;
            case "RealizarPago":
                montopagar = totalpagar;
                // DaoUsuario dao=new ImpUsuario();
                // objusu.setCodigo(1);

                //  dao.BuscarUsuario(objusu);
                if (objcliente.getCodigo() != 0 && montopagar > 0) {
                    cdao.Pagar(montopagar);
                    //   request.getRequestDispatcher("/intranet/mantenimiento/carrito/frmCarrito.jsp").forward(request, response);
                    request.getRequestDispatcher("Controla?accion=Carrito").forward(request, response);
                } else {
                    montopagar = 0;
                    //    request.getRequestDispatcher("Control?menu=Cliente&accion=registrarws").forward(request, response);
                    out.println("<script>alert('No se encontro el Usuario, Por Favor Registrese ');</script>");
                    out.println("<meta http-equiv='Refresh' content='1; url=Control?menu=Cliente&accion=registrarws'>");

                }
                break;
            case "GenerarCompra":
                idpago = cdao.IdPago();
                //  objusu.setCodigo(1);
                if (objcliente.getCodigo() != 0 && listacarro.size() != 0 && montopagar > 0) {
                    if (totalpagar > 0.0) {
                        BeanCompra co = new BeanCompra();
                        co.setIdUsuario(objcliente.getCodigo());
                        co.setFecha(fechaSistem.FechaBD());
                        co.setMonto(totalpagar);
                        co.setIdpago(idpago);
                        co.setEstado("Cancelado - En Proceso de Envio");
                        cdao.GenerarCompra(co);
                        montopagar = 0;

                        idcompra = cdao.IdCompra();
                        for (int i = 0; i < listacarro.size(); i++) {
                            int cantidad = listacarro.get(i).getCantidad();
                            idPro = listacarro.get(i).getCodigoproducto();
                            objproducto = daoproducto.listarId(idPro);
                            int sac = objproducto.getCantidad() - cantidad;
                            daoproducto.actualizarstock(idPro, sac);
                            BeanDetalleCompra dc = new BeanDetalleCompra();
                            dc.setIdcompra(idcompra);
                            dc.setIdproducto(listacarro.get(i).getCodigoproducto());
                            dc.setCantidad(listacarro.get(i).getCantidad());
                            dc.setPrecioCompra(listacarro.get(i).getPreciocompra());
                            cdao.guardarDetalleCompra(dc);
                        }
                        productos = new ArrayList<>();
                        //   objusu.setCodigo(1);
                        List compra = cdao.misCompras(objcliente.getCodigo());
                        request.setAttribute("myCompras", compra);
                        request.getRequestDispatcher("Control?menu=Carrito&accion=compra").forward(request, response);
                        //request.getRequestDispatcher("/intranet/mantenimiento/carrito/frmCompras.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controla?accion=Carrito").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("Controla?accion=Carrito").forward(request, response);
                }
                break;
            case "MisCompras":
                if (objcliente.getCodigo() != 0) {
                    List compra = cdao.misCompras(objcliente.getCodigo());
                    request.setAttribute("myCompras", compra);
                    request.getRequestDispatcher("/intranet/mantenimiento/carrito/frmCompras.jsp").forward(request, response);
                } else if (productos.size() > 0) {
                    request.getRequestDispatcher("Controla?accion=Carrito").forward(request, response);
                } else {
                    request.getRequestDispatcher("Controla?menu=Catalogo&accion=mostrar").forward(request, response);
                }
                break;
            case "verDetalle":
                totalpagar = 0.0;
                int idcompras = Integer.parseInt(request.getParameter("idcompra"));
                List<BeanDetalleCompra> detalle = cdao.Detalle(idcompras);
                request.setAttribute("myDetalle", detalle);
                for (int i = 0; i < detalle.size(); i++) {
                    totalpagar = totalpagar + (detalle.get(i).getPrecioCompra() * detalle.get(i).getCantidad());

                }
                request.setAttribute("montoPagar", totalpagar);
                request.getRequestDispatcher("Control?menu=Carrito&accion=detalle").forward(request, response);
                break;
            case "Salir":
                productos = new ArrayList();
                objcliente = new BeanCliente();
                session.invalidate();
                logueo = "Iniciar Sesion";
                correo = "Iniciar Sesion";
                request.getRequestDispatcher("Controla?accion=Salir").forward(request, response);
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
