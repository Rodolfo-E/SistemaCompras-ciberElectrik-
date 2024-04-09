/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package CiberElectrik.imp;
import java.sql.*;

import java.util.ArrayList;
import java.util.List;
import CiberElectrik.Bean.BeanDistrito;
import CiberElectrik.dao.DaoDistrito;
import CiberElectrik.util.Conexion;

public class ImpDistrito implements DaoDistrito {
//varibles
    Connection xcon;
    // CallableStatement es porque voy a trabajar con procedimientos almacendos
    
    CallableStatement cst;
    // Guarda los resultados de una consulta
    ResultSet rs;
    //objeto de la conexion
    Conexion objconexion=new Conexion();
    @Override
    public List<BeanDistrito> MostrarDistrito() {
   
        //Creamos una lista de la clase BeanPerfila
        List<BeanDistrito> lista=new ArrayList<>();
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_MostrarDistrito()}");
            //ejecutando la consulta
            rs=cst.executeQuery();
            //llenamos la lista
            while(rs.next()){
                //creamos un objeto de la clase BeanPerfil
                BeanDistrito objDistrito=new BeanDistrito();
                //asiganmos los valores del resulset hacia la clase
                objDistrito.setCodigo(rs.getInt("coddis"));
                 objDistrito.setNombre(rs.getString("nomdis"));
                  objDistrito.setEstado(rs.getBoolean("estdis"));
                  // enviamos los datos a la lista con los valores de clase
                  lista.add(objDistrito);
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
    public boolean RegistrarDistrito(BeanDistrito bd) {
      int res=0;
       try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_RegistrarDistrito(?,?)}");
            cst.setString(1,bd.getNombre());
            cst.setBoolean(2,bd.isEstado());
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
    public boolean ActualizarDistrito(BeanDistrito bd) {
           int res=0;
       try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_ActualizarDistrito(?,?,?)}");
            cst.setInt(1,bd.getCodigo());
            cst.setString(2,bd.getNombre());
            cst.setBoolean(3,bd.isEstado());
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
    public boolean EliminarDistrito(BeanDistrito bd) {
         int res=0;
       try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_EliminarDistrito(?)}");
            cst.setInt(1,bd.getCodigo());
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
    public List<BeanDistrito> BuscarDistrito(BeanDistrito bd) {
        //Creamos una lista de la clase BeanPerfila
        List<BeanDistrito> lista=new ArrayList<>();
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_BuscarDistrito(?)}");
            cst.setInt(1,bd.getCodigo());
            //ejecutando la consulta
            rs=cst.executeQuery();
            //llenamos la lista
            while(rs.next()){
                //creamos un objeto de la clase BeanPerfil
                BeanDistrito objDistrito=new BeanDistrito();
                //asiganmos los valores del resulset hacia la clase
                objDistrito.setCodigo(rs.getInt("coddis"));
                 objDistrito.setNombre(rs.getString("nomdis"));
                  objDistrito.setEstado(rs.getBoolean("estdis"));
                  // enviamos los datos a la lista con los valores de clase
                  lista.add(objDistrito);
            }
            xcon.close();
        }catch(SQLException ex){
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    
  }

    @Override
    public List<BeanDistrito> MostrarDistritoTodo() {
         //Creamos una lista de la clase BeanPerfila
        List<BeanDistrito> lista=new ArrayList<>();
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_MostrarDistritoTodo()}");
            //ejecutando la consulta
            rs=cst.executeQuery();
            //llenamos la lista
            while(rs.next()){
                //creamos un objeto de la clase BeanPerfil
                BeanDistrito objDistrito=new BeanDistrito();
                //asiganmos los valores del resulset hacia la clase
                objDistrito.setCodigo(rs.getInt("coddis"));
                 objDistrito.setNombre(rs.getString("nomdis"));
                  objDistrito.setEstado(rs.getBoolean("estdis"));
                  // enviamos los datos a la lista con los valores de clase
                  lista.add(objDistrito);
            }
            xcon.close();
        }catch(SQLException ex){
            System.err.println(ex.toString());
            return null;
        }
        return lista;   
    }

    @Override
    public boolean HabilitarDistrito(BeanDistrito bd) {
         int res=0;
    
        try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_HabilitarDistrito(?)}");
            cst.setInt(1,bd.getCodigo());
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

    

