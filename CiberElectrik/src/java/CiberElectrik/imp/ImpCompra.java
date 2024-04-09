
package CiberElectrik.imp;

import CiberElectrik.Bean.BeanCompra;
import CiberElectrik.Bean.BeanDetalleCompra;
import CiberElectrik.Bean.BeanProducto;
import CiberElectrik.dao.DaoCompra;
import CiberElectrik.util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ImpCompra implements DaoCompra{
 //varibles
    Connection xcon;
    // CallableStatement es porque voy a trabajar con procedimientos almacendos

    CallableStatement cst;
    
    PreparedStatement ps;
    // Guarda los resultados de una consulta
    ResultSet rs;
    //objeto de la conexion
    Conexion objconexion = new Conexion();
    @Override
    public int GenerarCompra(BeanCompra compra) {
 String sql = "insert into t_Compra(codcli,codpago,fechacom,monto,estado)values(?,?,?,?,?)";
        try {
          //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
   
            ps = xcon.prepareStatement(sql);
            ps.setInt(1, compra.getIdUsuario());
            ps.setInt(2, compra.getIdpago());
            ps.setString(3, compra.getFecha());
            ps.setDouble(4, compra.getMonto());
            ps.setString(5, compra.getEstado());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return 1;
    }

    @Override
    public int IdCompra() {
   int idc = 0;
        String sql = "select max(codcom) from t_Compra";
        try {
              //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
   
            ps = xcon.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idc = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return idc;
    }

    @Override
    public int guardarDetalleCompra(BeanDetalleCompra dc) {
  String sql = "insert into t_Detalles_Compra(codpro,codcom, cantidad, preciocom)values(?,?,?,?)";
        try {
           //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
   
            ps = xcon.prepareStatement(sql);
            ps.setInt(1, dc.getIdproducto());
            ps.setInt(2, dc.getIdcompra());
            ps.setInt(3, dc.getCantidad());
            ps.setDouble(4, dc.getPrecioCompra());
            ps.executeUpdate();
            xcon.close();
        } catch (Exception e) {
        }
        return 1;
    }

    @Override
    public List misCompras(int id) {
 List lista = new ArrayList();
        String sql = "select * from t_Compra where codcli=" + id;
        try {
           xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
   
            ps = xcon.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BeanCompra com = new BeanCompra();
                com.setId(rs.getInt(1));
                com.setIdUsuario(rs.getInt(2));
                com.setIdpago(rs.getInt(3));
                com.setFecha(rs.getString(4));
                com.setMonto(rs.getDouble(5));
                com.setEstado(rs.getString(6));
                lista.add(com);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    @Override
    public List Detalle(int id) {
         List lista = new ArrayList();
        String sql = "select DC.coddet, P.fotpro, P.nompro, DC.codcom, DC.cantidad, DC.preciocom FROM t_Detalles_Compra DC inner join t_ProductoTienda P on P.codpro = DC.codpro where codcom=" + id;
        try {
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
   
            ps = xcon.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BeanDetalleCompra dcom = new BeanDetalleCompra();
                dcom.setId(rs.getInt(1));
                dcom.setProducto(new BeanProducto());
                dcom.getProducto().setFoto(rs.getString(2));
                dcom.getProducto().setNombre(rs.getString(3));
                dcom.setIdcompra(rs.getInt(4));
                dcom.setCantidad(rs.getInt(5));
                dcom.setPrecioCompra(rs.getDouble(6));
                lista.add(dcom);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    @Override
    public int Pagar(double monto) {
        
        try {
             String sql = "insert into t_Pago(monto)values(?)";
        xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
   
            ps = xcon.prepareStatement(sql);
            ps.setDouble(1, monto);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return 1;
    }

    @Override
    public int IdPago() {
       int idpago = 0;
        String sql = "select max(codpago) from t_Pago";
        try {
                 xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
   
            ps = xcon.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idpago = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return idpago;
    }
    
    
}
