package CiberElectrik.imp;

import CiberElectrik.Bean.BeanDistrito;
import CiberElectrik.Bean.BeanProveedor;
import CiberElectrik.dao.DaoProveedor;
import CiberElectrik.util.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ImpProveedor implements DaoProveedor {

    
    Connection xcon;
 

    CallableStatement cst;
  
    ResultSet rs;
  
    Conexion objconexion = new Conexion();

    @Override
    public List<BeanProveedor> MostrarProveedor() {
   
        List<BeanProveedor> lista = new ArrayList<>();
        try {
  
            xcon = objconexion.Conectar();
        
            cst = xcon.prepareCall("{call SP_MostrarProveedor()}");
        
            rs = cst.executeQuery();
          
            while (rs.next()) {
               
                BeanDistrito objDistrito = new BeanDistrito();
                BeanProveedor objProveedor = new BeanProveedor();
            
                objProveedor.setCodigo(rs.getInt("codprove"));
                objProveedor.setNombre(rs.getString("nomprove"));
                objProveedor.setDireccion(rs.getString("dirprove"));
                objProveedor.setTelefono(rs.getString("telprove"));
                objProveedor.setCorreo(rs.getString("corprove"));
                objProveedor.setRuc(rs.getString("rucprove"));
                objProveedor.setEstado(rs.getBoolean("estprove"));

                objDistrito.setCodigo(rs.getInt("coddis"));
                objDistrito.setNombre(rs.getString("nomdis"));
                objProveedor.setDistrito(objDistrito);
           
                lista.add(objProveedor);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public boolean RegistrarProveedor(BeanProveedor bpr) {
        int res = 0;
        try {
            
            xcon = objconexion.Conectar();
          
            cst = xcon.prepareCall("{call SP_RegistrarProveedor(?,?,?,?,?,?,?)}");

            cst.setString(1, bpr.getNombre());
            cst.setString(2, bpr.getDireccion());
            cst.setString(3, bpr.getTelefono());
            cst.setString(4, bpr.getCorreo());
            cst.setString(5, bpr.getRuc());
            cst.setInt(6, bpr.getDistrito().getCodigo());
            cst.setBoolean(7, bpr.isEstado());
          
          
            res = cst.executeUpdate();
            xcon.close();
            if (res == 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return false;
        }
    }

    @Override
    public boolean ActualizarProveedor(BeanProveedor bpr) {
        int res = 0;
        try {
          
            xcon = objconexion.Conectar();
         
            cst = xcon.prepareCall("{call SP_ActualizarProveedor(?,?,?,?,?,?,?,?)}");

            cst.setString(1, bpr.getNombre());
            cst.setString(2, bpr.getDireccion());
            cst.setString(3, bpr.getTelefono());
            cst.setString(4, bpr.getCorreo());
            cst.setString(5, bpr.getRuc());
             cst.setBoolean(6, bpr.isEstado());
               cst.setInt(7, bpr.getDistrito().getCodigo());
   
             cst.setInt(8, bpr.getCodigo());

       
            res = cst.executeUpdate();
            xcon.close();
            if (res == 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return false;
        }
    }

    @Override
    public boolean EliminarProveedor(BeanProveedor bpr) {
        int res = 0;
        try {
      
            xcon = objconexion.Conectar();
         
            cst = xcon.prepareCall("{call SP_EliminarProveedor(?)}");
            cst.setInt(1, bpr.getCodigo());

            res = cst.executeUpdate();
            xcon.close();
            if (res == 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return false;
        }
    }

    @Override
    public List<BeanProveedor> BuscarProveedor(BeanProveedor bpr) {
   
        List<BeanProveedor> lista = new ArrayList<>();
        try {
         
            xcon = objconexion.Conectar();
      
            cst = xcon.prepareCall("{call SP_BuscarProveedor(?)}");
            cst.setInt(1, bpr.getCodigo());
           
            rs = cst.executeQuery();
          
            while (rs.next()) {
               

                BeanDistrito objDistrito = new BeanDistrito();
                BeanProveedor objProveedor = new BeanProveedor();
             
                objProveedor.setCodigo(rs.getInt("codprove"));
                objProveedor.setNombre(rs.getString("nomprove"));
                objProveedor.setDireccion(rs.getString("dirprove"));
                objProveedor.setTelefono(rs.getString("telprove"));
                objProveedor.setCorreo(rs.getString("corprove"));
                objProveedor.setRuc(rs.getString("rucprove"));
                objProveedor.setEstado(rs.getBoolean("estprove"));

                objDistrito.setCodigo(rs.getInt("coddis"));
                objDistrito.setNombre(rs.getString("nomdis"));
                objProveedor.setDistrito(objDistrito);
             
                lista.add(objProveedor);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public List<BeanProveedor> MostrarProveedorTodo() {
      
        List<BeanProveedor> lista = new ArrayList<>();
        try {
          
            xcon = objconexion.Conectar();
  
            cst = xcon.prepareCall("{call SP_MostrarProveedorTodo()}");
            
            rs = cst.executeQuery();
          
            while (rs.next()) {
             
                BeanDistrito objDistrito = new BeanDistrito();
                BeanProveedor objProveedor = new BeanProveedor();
          
                objProveedor.setCodigo(rs.getInt("codprove"));
                objProveedor.setNombre(rs.getString("nomprove"));
                objProveedor.setDireccion(rs.getString("dirprove"));
                objProveedor.setTelefono(rs.getString("telprove"));
                objProveedor.setCorreo(rs.getString("corprove"));
                objProveedor.setRuc(rs.getString("rucprove"));
                objProveedor.setEstado(rs.getBoolean("estprove"));

                objDistrito.setCodigo(rs.getInt("coddis"));
                objDistrito.setNombre(rs.getString("nomdis"));
                objProveedor.setDistrito(objDistrito);
         
                lista.add(objProveedor);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public boolean HabilitarProveedor(BeanProveedor bpr) {
  int res=0;
    
        try{
          
            xcon=objconexion.Conectar();
           
            cst=xcon.prepareCall("{call SP_HabilitarProveedor(?)}");
            cst.setInt(1,bpr.getCodigo());
          
            res=cst.executeUpdate();
            xcon.close();
            if(res==1){
                return true;
            }else{
                return false;
            }
            
       }catch(SQLException ex){
           System.err.println(ex.toString());
            return false;
       }
    }

}
