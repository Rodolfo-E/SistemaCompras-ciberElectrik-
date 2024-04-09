

package CiberElectrik.imp;

import CiberElectrik.Bean.BeanPerfil;
import CiberElectrik.Bean.BeanUsuario;
import CiberElectrik.dao.DaoUsuario;
import CiberElectrik.util.Conexion;

import java.util.List;
import java.sql.*;
import java.util.ArrayList;


public class ImpUsuario implements DaoUsuario{

    //varibles
    Connection xcon;
    //CallableStatement es porque voy a trabajar con procedimientos almacendos
    
    CallableStatement cst;
    // Guarda los resultados de una consulta
    ResultSet rs;
    //objeto de la conexion
    Conexion objconexion=new Conexion();
    
    @Override
    public List<BeanUsuario> MostrarUsuario() {
       //Creamos una lista de la clase BeanPerfila
        List<BeanUsuario> lista=new ArrayList<>();
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_MostrarUsuario()}");
            //ejecutando la consulta
            rs=cst.executeQuery();  
            //llenamos la lista
            while(rs.next()){
                //creamos un objeto de la clase BeanPerfil
                BeanPerfil objPerfil=new BeanPerfil();
                 BeanUsuario objusuario=new BeanUsuario();
                //asiganmos los valores del resulset hacia la clase
                objusuario.setCodigo(rs.getInt("codusu"));
                 objusuario.setNombre(rs.getString("nomusu"));
                  objusuario.setClave(rs.getString("clausu"));
                  objusuario.setEstado(rs.getBoolean("estusu"));
                  
                  objPerfil.setCodigo(rs.getInt("codper"));
                  objPerfil.setNombre(rs.getString("nomper"));
                  objusuario.setPerfil(objPerfil);
                  // enviamos los datos a la lista con los valores de clase
                  lista.add(objusuario);
            }
            xcon.close();
        }catch(SQLException ex){
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public boolean RegistrarUsuario(BeanUsuario bu) {
       int res = 0;
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst = xcon.prepareCall("{call SP_RegistrarUsuario(?,?,?,?)}");
            
             cst.setString(1, bu.getNombre());
            cst.setString(2, bu.getClave());
              cst.setInt(3, bu.getPerfil().getCodigo());
            cst.setBoolean(4, bu.isEstado());
          
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
    public boolean ActualizarUsuario(BeanUsuario bu) {
       int res=0;
       try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_ActualizarUsuario(?,?,?,?,?)}");      
            cst.setString(1,bu.getNombre());
            cst.setString(2,bu.getClave());
            cst.setBoolean(3,bu.isEstado());
            cst.setInt(4,bu.getPerfil().getCodigo());
             cst.setInt(5,bu.getCodigo());
 
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
    public boolean EliminarUsuario(BeanUsuario bu) {
    int res=0;
       try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_EliminarUsuario(?)}");
            cst.setInt(1,bu.getCodigo());
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
    public List<BeanUsuario> BuscarUsuario(BeanUsuario bu) {
      //Creamos una lista de la clase BeanPerfila
        List<BeanUsuario> lista=new ArrayList<>();
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_BuscarUsuario(?)}");
            cst.setInt(1,bu.getCodigo());
            //ejecutando la consulta
            rs=cst.executeQuery();
            //llenamos la lista
            while(rs.next()){
                //creamos un objeto de la clase BeanPerfil
             BeanPerfil objPerfil=new BeanPerfil();
                 BeanUsuario objusuario=new BeanUsuario();
                //asiganmos los valores del resulset hacia la clase
                 objusuario.setCodigo(rs.getInt("codusu"));
                 objusuario.setNombre(rs.getString("nomusu"));
                  objusuario.setClave(rs.getString("clausu"));
                  objusuario.setEstado(rs.getBoolean("estusu"));
                  
                  objPerfil.setCodigo(rs.getInt("codper"));
                  objPerfil.setNombre(rs.getString("nomper"));
                  objusuario.setPerfil(objPerfil);
                  // enviamos los datos a la lista con los valores de clase
                  lista.add(objusuario);
            }
            xcon.close();
        }catch(SQLException ex){
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public List<BeanUsuario> MostrarUsuarioTodo() {
         //Creamos una lista de la clase BeanPerfila
        List<BeanUsuario> lista=new ArrayList<>();
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_MostrarUsuarioTodo()}");
            //ejecutando la consulta
            rs=cst.executeQuery();  
            //llenamos la lista
            while(rs.next()){
                //creamos un objeto de la clase BeanPerfil
                BeanPerfil objPerfil=new BeanPerfil();
                 BeanUsuario objusuario=new BeanUsuario();
                //asiganmos los valores del resulset hacia la clase
                objusuario.setCodigo(rs.getInt("codusu"));
                 objusuario.setNombre(rs.getString("nomusu"));
                  objusuario.setClave(rs.getString("clausu"));
                  objusuario.setEstado(rs.getBoolean("estusu"));
                  
                  objPerfil.setCodigo(rs.getInt("codper"));
                  objPerfil.setNombre(rs.getString("nomper"));
                  objusuario.setPerfil(objPerfil);
                  // enviamos los datos a la lista con los valores de clase
                  lista.add(objusuario);
            }
            xcon.close();
        }catch(SQLException ex){
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public boolean HabilitarUsuario(BeanUsuario bu) {
        int res=0;
    
        try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_HabilitarUsuario(?)}");
            cst.setInt(1,bu.getCodigo());
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

