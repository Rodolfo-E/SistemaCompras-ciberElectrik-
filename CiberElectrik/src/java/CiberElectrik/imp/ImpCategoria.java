package CiberElectrik.imp;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;
import CiberElectrik.Bean.BeanCategoria;
import CiberElectrik.dao.DaoCategoria;
import CiberElectrik.util.Conexion;

public class ImpCategoria implements DaoCategoria {

    Connection xcon;
    // CallableStatement es porque voy a trabajar con procedimientos almacendos

    CallableStatement cst;
    // Guarda los resultados de una consulta
    ResultSet rs;
    //objeto de la conexion
    Conexion objconexion = new Conexion();

    @Override
    public List<BeanCategoria> MostrarCategoria() {

        //Creamos una lista de la clase BeanPerfila
        List<BeanCategoria> lista = new ArrayList<>();
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst = xcon.prepareCall("{call SP_MostrarCategoria ()}");
            //ejecutando la consulta
            rs = cst.executeQuery();
            //llenamos la lista
            while (rs.next()) {
                //creamos un objeto de la clase BeanPerfil
                BeanCategoria objCategoria = new BeanCategoria();
                //asiganmos los valores del resulset hacia la clase
                objCategoria.setCodigo(rs.getInt("codcat"));
                objCategoria.setNombre(rs.getString("nomcat"));
                objCategoria.setEstado(rs.getBoolean("estcat"));
                // enviamos los datos a la lista con los valores de clase
                lista.add(objCategoria);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;

        // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean RegistrarCategoria(BeanCategoria bc) {
        int res = 0;
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst = xcon.prepareCall("{call SP_RegistrarCategoria(?,?)}");
            cst.setString(1, bc.getNombre());
            cst.setBoolean(2, bc.isEstado());
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
    public boolean ActualizarCategoria(BeanCategoria bc) {
        int res = 0;
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst = xcon.prepareCall("{call SP_ActualizarCategoria(?,?,?)}");
            cst.setInt(1, bc.getCodigo());
            cst.setString(2, bc.getNombre());
            cst.setBoolean(3, bc.isEstado());
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
    public boolean EliminarCategoria(BeanCategoria bc) {
        int res = 0;
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst = xcon.prepareCall("{call SP_EliminarCategoria(?)}");
            cst.setInt(1, bc.getCodigo());
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
    public List<BeanCategoria> BuscarCategoria(BeanCategoria bc) {
        //Creamos una lista de la clase BeanPerfila
        List<BeanCategoria> lista = new ArrayList<>();
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst = xcon.prepareCall("{call SP_BuscarCategoria(?)}");
            cst.setInt(1, bc.getCodigo());
            //ejecutando la consulta
            rs = cst.executeQuery();
            //llenamos la lista
            while (rs.next()) {
                //creamos un objeto de la clase BeanPerfil
                BeanCategoria objCategoria = new BeanCategoria();
                //asiganmos los valores del resulset hacia la clase
                objCategoria.setCodigo(rs.getInt("codcat"));
                objCategoria.setNombre(rs.getString("nomcat"));
                objCategoria.setEstado(rs.getBoolean("estcat"));
                // enviamos los datos a la lista con los valores de clase
                lista.add(objCategoria);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;

    }

    @Override
    public List<BeanCategoria> MostrarCategoriaTodo() {
         //Creamos una lista de la clase BeanPerfila
        List<BeanCategoria> lista = new ArrayList<>();
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst = xcon.prepareCall("{call SP_MostrarCategoriaTodo()}");
            //ejecutando la consulta
            rs = cst.executeQuery();
            //llenamos la lista
            while (rs.next()) {
                //creamos un objeto de la clase BeanPerfil
                BeanCategoria objCategoria = new BeanCategoria();
                //asiganmos los valores del resulset hacia la clase
                objCategoria.setCodigo(rs.getInt("codcat"));
                objCategoria.setNombre(rs.getString("nomcat"));
                objCategoria.setEstado(rs.getBoolean("estcat"));
                // enviamos los datos a la lista con los valores de clase
                lista.add(objCategoria);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public boolean HabilitarCategoria(BeanCategoria bc) {
         int res=0;
    
        try{
             //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst=xcon.prepareCall("{call SP_HabilitarCategoria(?)}");
            cst.setInt(1,bc.getCodigo());
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
