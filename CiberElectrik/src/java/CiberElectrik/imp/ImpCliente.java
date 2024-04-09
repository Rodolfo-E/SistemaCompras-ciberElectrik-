/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CiberElectrik.imp;

import CiberElectrik.Bean.BeanCategoria;
import CiberElectrik.Bean.BeanCliente;
import CiberElectrik.Bean.BeanClienteWS;
import CiberElectrik.Bean.BeanDistrito;
import CiberElectrik.Bean.BeanPerfil;
import CiberElectrik.Bean.BeanProducto;
import CiberElectrik.Bean.BeanProveedor;
import CiberElectrik.Bean.BeanUsuario;
import CiberElectrik.dao.daoCliente;
import CiberElectrik.util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author RODOLFO
 */
public class ImpCliente implements daoCliente{
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
    public List<BeanCliente> MostrarCliente() {
//Creamos una lista de la clase BeanPerfila
        List<BeanCliente> lista = new ArrayList<>();
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst = xcon.prepareCall("{call SP_MostrarCliente()}");
            //ejecutando la consulta
            rs = cst.executeQuery();
            //llenamos la lista
            while (rs.next()) {
                //creamos un objeto de la clase BeanPerfil
                BeanCliente objCliente = new BeanCliente();
                BeanDistrito objDistrito = new BeanDistrito();
 
                //asiganmos los valores del resulset hacia la clase
                objCliente.setCodigo(rs.getInt("codcli"));
                objCliente.setNombre(rs.getString("nomcli"));
                  objCliente.setApellido(rs.getString("apecli"));
                    objCliente.setUsuario(rs.getString("nomusu"));
                      objCliente.setClave(rs.getString("clausu"));
                objCliente.setDireccion(rs.getString("dircli"));  
                  objCliente.setFecha(rs.getString("feccli"));
                         objCliente.setCorreo(rs.getString("corcli"));
                                objCliente.setTelefono(rs.getString("telcli"));
                                        objCliente.setCelular(rs.getString("celcli"));
             
                    objCliente.setEstado(rs.getBoolean("estcli"));
          
                 
                objDistrito.setCodigo(rs.getInt("coddis"));
                objDistrito.setNombre(rs.getString("nomdis"));
                objCliente.setDistrito(objDistrito);
                
              
      
           

                // enviamos los datos a la lista con los valores de clase
                lista.add(objCliente);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public boolean RegistrarCliente(BeanCliente bcli) {
      int res = 0;
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();  
            //llamamos el procedimiento almacenado
            cst = xcon.prepareCall("{call SP_RegistrarCliente(?,?,?,?,?,?,?,?,?,?,?)}");
            
             cst.setString(1, bcli.getNombre());
              cst.setString(2, bcli.getApellido());
               cst.setString(3, bcli.getUsuario());
                cst.setString(4, bcli.getClave());
            cst.setString(5, bcli.getDireccion());
             cst.setString(6, bcli.getFecha());
              cst.setString(7, bcli.getCorreo());
             cst.setString(8, bcli.getTelefono());
              cst.setString(9, bcli.getCelular());
              cst.setInt(10, bcli.getDistrito().getCodigo());
              
            cst.setBoolean(11, bcli.isEstado());
          
            //ejecutando el procedimiento almacenado
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
    public boolean ActualizarCliente(BeanCliente bcli) {
       int res=0;
       try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_ActualizarCliente(?,?,?,?,?,?,?,?,?,?,?,?)}");
           
            cst.setString(1, bcli.getNombre());
              cst.setString(2, bcli.getApellido());
               cst.setString(3, bcli.getUsuario());
                cst.setString(4, bcli.getClave());
            cst.setString(5, bcli.getDireccion());
             cst.setString(6, bcli.getFecha());
              cst.setString(7, bcli.getCorreo());
             cst.setString(8, bcli.getTelefono());
              cst.setString(9, bcli.getCelular());
              cst.setInt(10, bcli.getDistrito().getCodigo());
              
            cst.setBoolean(11, bcli.isEstado());
              cst.setInt(12,bcli.getCodigo());
         
 
            //ejecutando el procedimiento almacenado
            res=cst.executeUpdate();
            xcon.close();
            if(res == 1){
                return true;
            }else{
                return false;
            }
            
       }catch(SQLException ex){
           System.err.println(ex.toString());
            return false;
       }
    }

    @Override
    public boolean EliminarCliente(BeanCliente bcli) {
          int res=0;
       try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_EliminarCliente(?)}");
            cst.setInt(1,bcli.getCodigo());
            //ejecutando el procedimiento almacenado
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

    @Override
    public List<BeanCliente> BuscarCliente(BeanCliente bcli) {
       //Creamos una lista de la clase BeanPerfila
        List<BeanCliente> lista = new ArrayList<>();
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
              cst = xcon.prepareCall("{call SP_BuscarCliente(?)}");
                  cst.setInt(1, bcli.getCodigo());
            //ejecutando la consulta
            rs = cst.executeQuery();
            //llenamos la lista
            while (rs.next()) {
                
                       //creamos un objeto de la clase BeanPerfil
                BeanCliente objCliente = new BeanCliente();
                BeanDistrito objDistrito = new BeanDistrito();
 
                 //asiganmos los valores del resulset hacia la clase
                objCliente.setCodigo(rs.getInt("codcli"));
                objCliente.setNombre(rs.getString("nomcli"));
                  objCliente.setApellido(rs.getString("apecli"));
                    objCliente.setUsuario(rs.getString("nomusu"));
                      objCliente.setClave(rs.getString("clausu"));
                objCliente.setDireccion(rs.getString("dircli"));  
                  objCliente.setFecha(rs.getString("feccli"));
                         objCliente.setCorreo(rs.getString("corcli"));
                                objCliente.setTelefono(rs.getString("telcli"));
                                        objCliente.setCelular(rs.getString("celcli"));
             
                  objDistrito.setCodigo(rs.getInt("coddis"));
                objDistrito.setNombre(rs.getString("nomdis"));
                objCliente.setDistrito(objDistrito);
          
           
                    objCliente.setEstado(rs.getBoolean("estcli"));
                // enviamos los datos a la lista con los valores de clase
                lista.add(objCliente);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public List<BeanCliente> MostrarClienteTodo() {
      //Creamos una lista de la clase BeanPerfila
        List<BeanCliente> lista = new ArrayList<>();
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
              cst = xcon.prepareCall("{call SP_MostrarClienteTodo()}");
            //ejecutando la consulta
            rs = cst.executeQuery();
            //llenamos la lista
            while (rs.next()) {
                
                       //creamos un objeto de la clase BeanPerfil
                BeanCliente objCliente = new BeanCliente();
                BeanDistrito objDistrito = new BeanDistrito();
 
               //asiganmos los valores del resulset hacia la clase
                objCliente.setCodigo(rs.getInt("codcli"));
                objCliente.setNombre(rs.getString("nomcli"));
                  objCliente.setApellido(rs.getString("apecli"));
                    objCliente.setUsuario(rs.getString("nomusu"));
                      objCliente.setClave(rs.getString("clausu"));
                objCliente.setDireccion(rs.getString("dircli"));  
                  objCliente.setFecha(rs.getString("feccli"));
                         objCliente.setCorreo(rs.getString("corcli"));
                                objCliente.setTelefono(rs.getString("telcli"));
                                        objCliente.setCelular(rs.getString("celcli"));
             
          
                 
                objDistrito.setCodigo(rs.getInt("coddis"));
                objDistrito.setNombre(rs.getString("nomdis"));
                objCliente.setDistrito(objDistrito);
                
              
      
           
                    objCliente.setEstado(rs.getBoolean("estcli"));
                // enviamos los datos a la lista con los valores de clase
                lista.add(objCliente);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public boolean HabilitarCliente(BeanCliente bpro) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int ValidarUsuario(BeanCliente bc) {
            int r=0;
   //    List<BeanUsuario> lista=new ArrayList<>();
   
            String sql="select codcli,nomcli,apecli, nomusu, clausu, corcli  from t_cliente  where  nomusu = ? and clausu = ?";
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
           PreparedStatement pst=xcon.prepareStatement(sql);
            pst.setString(1, bc.getUsuario());
             pst.setString(2, bc.getClave());
              rs=pst.executeQuery();
           //ejecutando el procedimiento almacenado
       //     res = pst.executeUpdate();
           
           while(rs.next()){
               
               r=r+1;
          
                //asiganmos los valores del resulset hacia la clase
                 bc.setCodigo(rs.getInt("codcli"));
                   bc.setNombre(rs.getString("nomcli"));
                 bc.setApellido(rs.getString("apecli"));
                 bc.setUsuario(rs.getString("nomusu"));
                 bc.setClave(rs.getString("clausu"));
                     bc.setCorreo(rs.getString("corcli"));
                
           }
           if(r==1){
               return 1;
           }else{
               return 0;
           }
       
        }catch(Exception ex){
            System.err.println("Error"+ex.getMessage());
            return 0;
          
        }
    }

}

