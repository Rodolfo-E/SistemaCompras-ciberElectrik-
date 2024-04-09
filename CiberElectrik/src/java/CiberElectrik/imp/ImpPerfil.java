

package CiberElectrik.imp;
import java.sql.*;

import java.util.ArrayList;
import java.util.List;
import CiberElectrik.Bean.BeanPerfil;
import CiberElectrik.dao.DaoPerfil;
import CiberElectrik.util.Conexion;


public class ImpPerfil implements DaoPerfil {

    //varibles
    Connection xcon;
    // CallableStatement es porque voy a trabajar con procedimientos almacendos
    
    CallableStatement cst;
    // Guarda los resultados de una consulta
    ResultSet rs;
    //objeto de la conexion
    Conexion objconexion=new Conexion();
    
    @Override
    public List<BeanPerfil> MostrarPerfil() {
        //Creamos una lista de la clase BeanPerfila
        List<BeanPerfil> lista=new ArrayList<>();
        try{
         
            xcon=objconexion.Conectar();
         
            cst=xcon.prepareCall("{call SP_MostrarPerfil()}");
         
            rs=cst.executeQuery();
       
            while(rs.next()){
            
                BeanPerfil objPerfil=new BeanPerfil();
                
                objPerfil.setCodigo(rs.getInt("codper"));
                 objPerfil.setNombre(rs.getString("nomper"));
                  objPerfil.setEstado(rs.getBoolean("estper"));
                  
                  lista.add(objPerfil);
            }
            xcon.close();
        }catch(SQLException ex){
            System.err.println(ex.toString());
            return null;
        }
        return lista;
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean RegistrarPerfil(BeanPerfil bp) {
       int res=0;
       try{
    
            xcon=objconexion.Conectar();
         
            cst=xcon.prepareCall("{call SP_RegistrarPerfil(?,?)}");
            cst.setString(1,bp.getNombre());
            cst.setBoolean(2,bp.isEstado());
     
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
    public boolean ActualizarPerfil(BeanPerfil bp) {
         int res=0;
       try{
          
            xcon=objconexion.Conectar();
     
            cst=xcon.prepareCall("{call SP_ActualizarPerfil(?,?,?)}");
            cst.setInt(1,bp.getCodigo());
            cst.setString(2,bp.getNombre());
            cst.setBoolean(3,bp.isEstado());
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
    public boolean EliminarPerfil(BeanPerfil bp) {
         int res=0;
       try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_EliminarPerfil(?)}");
            cst.setInt(1,bp.getCodigo());
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
    public List<BeanPerfil> BuscarPerfil(BeanPerfil bp) {
        //Creamos una lista de la clase BeanPerfila
        List<BeanPerfil> lista=new ArrayList<>();
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_BuscarPerfil(?)}");
            cst.setInt(1,bp.getCodigo());
            //ejecutando la consulta
            rs=cst.executeQuery();
            //llenamos la lista
            while(rs.next()){
                //creamos un objeto de la clase BeanPerfil
                BeanPerfil objPerfil=new BeanPerfil();
                //asiganmos los valores del resulset hacia la clase
                objPerfil.setCodigo(rs.getInt("codper"));
                 objPerfil.setNombre(rs.getString("nomper"));
                  objPerfil.setEstado(rs.getBoolean("estper"));
                  // enviamos los datos a la lista con los valores de clase
                  lista.add(objPerfil);
            }
            xcon.close();
        }catch(SQLException ex){
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }
    //declarando procedimientos o funciones

    @Override
    public List<BeanPerfil> MostrarPerfilTodo() {
       //Creamos una lista de la clase BeanPerfila
        List<BeanPerfil> lista=new ArrayList<>();
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_MostrarPerfilTodo()}");
            //ejecutando la consulta
            rs=cst.executeQuery();
            //llenamos la lista
            while(rs.next()){
                //creamos un objeto de la clase BeanPerfil
                BeanPerfil objPerfil=new BeanPerfil();
                //asiganmos los valores del resulset hacia la clase
                objPerfil.setCodigo(rs.getInt("codper"));
                 objPerfil.setNombre(rs.getString("nomper"));
                  objPerfil.setEstado(rs.getBoolean("estper"));
                  // enviamos los datos a la lista con los valores de clase
                  lista.add(objPerfil);
            }
            xcon.close();
        }catch(SQLException ex){
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public boolean HabilitarPerfil(BeanPerfil bp) {
       int res=0;
    
        try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_HabilitarPerfil(?)}");
            cst.setInt(1,bp.getCodigo());
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
 
    
}
