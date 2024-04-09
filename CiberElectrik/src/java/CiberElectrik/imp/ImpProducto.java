package CiberElectrik.imp;

import CiberElectrik.Bean.BeanCategoria;
import CiberElectrik.Bean.BeanProducto;
import CiberElectrik.Bean.BeanProveedor;
import CiberElectrik.dao.DaoProducto;
import CiberElectrik.util.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import sun.util.BuddhistCalendar;

public class ImpProducto implements DaoProducto {

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
    public List<BeanProducto> MostrarProducto() {
        //Creamos una lista de la clase BeanPerfila
        List<BeanProducto> lista = new ArrayList<>();
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst = xcon.prepareCall("{call SP_MostrarProducto()}");
            //ejecutando la consulta
            rs = cst.executeQuery();
            //llenamos la lista
            while (rs.next()) {
                //creamos un objeto de la clase BeanPerfil
                BeanProducto objProducto = new BeanProducto();
                BeanProveedor objProveedor = new BeanProveedor();
                BeanCategoria objCategoria = new BeanCategoria();
                //asiganmos los valores del resulset hacia la clase
                objProducto.setCodigo(rs.getInt("codpro"));
                objProducto.setNombre(rs.getString("nompro"));
                objProducto.setCantidad(rs.getInt("canpro"));
                objProducto.setPrecio(rs.getDouble("prepro"));
                objProducto.setFoto(rs.getString("fotpro"));

                objProveedor.setCodigo(rs.getInt("codprove"));
                objProveedor.setNombre(rs.getString("nomprove"));
                objProducto.setProveedor(objProveedor);

                objCategoria.setCodigo(rs.getInt("codcat"));
                objCategoria.setNombre(rs.getString("nomcat"));

                objProducto.setCategoria(objCategoria);
                objProducto.setEstado(rs.getBoolean("estpro"));

                // enviamos los datos a la lista con los valores de clase
                lista.add(objProducto);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public boolean RegistrarProducto(BeanProducto bpro) {
        int res = 0;
        try {

            xcon = objconexion.Conectar();

            cst = xcon.prepareCall("{call SP_RegistrarProducto(?,?,?,?,?,?,?)}");

            cst.setString(1, bpro.getNombre());
            cst.setInt(2, bpro.getCantidad());
            cst.setDouble(3, bpro.getPrecio());
            cst.setString(4, bpro.getFoto());
            cst.setInt(5, bpro.getProveedor().getCodigo());
            cst.setInt(6, bpro.getCategoria().getCodigo());
            cst.setBoolean(7, bpro.isEstado());

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
    public boolean ActualizarProducto(BeanProducto bpro) {
        int res = 0;
        try {

            xcon = objconexion.Conectar();

            cst = xcon.prepareCall("{call SP_ActualizarProducto(?,?,?,?,?,?,?,?)}");

            cst.setString(1, bpro.getNombre());
            cst.setInt(2, bpro.getCantidad());
            cst.setDouble(3, bpro.getPrecio());
            cst.setString(4, bpro.getFoto());
            cst.setBoolean(5, bpro.isEstado());
            cst.setInt(6, bpro.getProveedor().getCodigo());
            cst.setInt(7, bpro.getCategoria().getCodigo());

            cst.setInt(8, bpro.getCodigo());

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
    public boolean EliminarProducto(BeanProducto bpro) {
        int res = 0;
        try {

            xcon = objconexion.Conectar();

            cst = xcon.prepareCall("{call SP_EliminarProducto(?)}");
            cst.setInt(1, bpro.getCodigo());

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
    public List<BeanProducto> BuscarProducto(BeanProducto bpro) {

        List<BeanProducto> lista = new ArrayList<>();
        try {

            xcon = objconexion.Conectar();

            cst = xcon.prepareCall("{call SP_BuscarProducto(?)}");
            cst.setInt(1, bpro.getCodigo());
            //ejecutando la consulta
            rs = cst.executeQuery();
            //llenamos la lista
            while (rs.next()) {
                //creamos un objeto de la clase BeanPerfil
                BeanProducto objProducto = new BeanProducto();
                BeanProveedor objProveedor = new BeanProveedor();
                BeanCategoria objCategoria = new BeanCategoria();
                //asiganmos los valores del resulset hacia la clase
                objProducto.setCodigo(rs.getInt("codpro"));
                objProducto.setNombre(rs.getString("nompro"));
                objProducto.setCantidad(rs.getInt("canpro"));
                objProducto.setPrecio(rs.getDouble("prepro"));
                objProducto.setFoto(rs.getString("fotpro"));
                objProducto.setEstado(rs.getBoolean("estpro"));

                objProveedor.setCodigo(rs.getInt("codprove"));
                objProveedor.setNombre(rs.getString("nomprove"));
                objProducto.setProveedor(objProveedor);

                objCategoria.setCodigo(rs.getInt("codcat"));
                objCategoria.setNombre(rs.getString("nomcat"));
                objProducto.setCategoria(objCategoria);
                // enviamos los datos a la lista con los valores de clase
                lista.add(objProducto);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public List<BeanProducto> MostrarProductoTodo() {

        List<BeanProducto> lista = new ArrayList<>();
        try {

            xcon = objconexion.Conectar();

            cst = xcon.prepareCall("{call SP_MostrarProductoTodo()}");

            rs = cst.executeQuery();

            while (rs.next()) {

                BeanProducto objProducto = new BeanProducto();
                BeanProveedor objProveedor = new BeanProveedor();
                BeanCategoria objCategoria = new BeanCategoria();

                objProducto.setCodigo(rs.getInt("codpro"));
                objProducto.setNombre(rs.getString("nompro"));
                objProducto.setCantidad(rs.getInt("canpro"));
                objProducto.setPrecio(rs.getDouble("prepro"));
                objProducto.setFoto(rs.getString("fotpro"));
                objProducto.setEstado(rs.getBoolean("estpro"));

                objProveedor.setCodigo(rs.getInt("codprove"));
                objProveedor.setNombre(rs.getString("nomprove"));
                objProducto.setProveedor(objProveedor);

                objCategoria.setCodigo(rs.getInt("codcat"));
                objCategoria.setNombre(rs.getString("nomcat"));
                objProducto.setCategoria(objCategoria);

                lista.add(objProducto);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    public BeanProducto listarId(int id) {
        BeanProducto p = new BeanProducto();
        String sql = "select * from t_ProductoTienda where codpro=" + id;
        try {
            xcon = objconexion.Conectar();
            ps = xcon.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setCodigo(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setCantidad(rs.getInt(3));
                p.setPrecio(rs.getDouble(4));
                p.setFoto(rs.getString(5));
//              

            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean HabilitarProducto(BeanProducto bpro) {
        int res = 0;

        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
            cst = xcon.prepareCall("{call SP_HabilitarProducto(?)}");
            cst.setInt(1, bpro.getCodigo());
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
    public void listarImg(int cod, HttpServletResponse response) {
        try {

            String sql = "select * from t_ProductoTienda where codpro=" + cod;
            xcon = objconexion.Conectar();
            ps = xcon.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                Blob blob = rs.getBlob("fotpro");
                byte byteArray[] = blob.getBytes(1, (int) blob.length());
                response.setContentType("image/png");
                OutputStream os = response.getOutputStream();
                os.write(byteArray);
                os.flush();
                os.close();
            }

            /*InputStream inputStream=null;
             OutputStream outputStream=null;
             BufferedInputStream bufferedInputStream=null;
             BufferedOutputStream bufferedOutputStream=null;
             response.setContentType("image/*");
        try{
            outputStream=response.getOutputStream();
            
        
             
             if(rs.next()){
                 inputStream=rs.getBinaryStream("fotpro");
                 
             }
             bufferedInputStream=new BufferedInputStream(inputStream);
             bufferedOutputStream=new BufferedOutputStream(outputStream);
             int i=0;
             while((i=bufferedInputStream.read())!=-1){
                 bufferedOutputStream.write(i);
                 
             }*/
        } catch (Exception e) {
            System.err.println(e.toString());
        }

    }

    @Override
    public List<BeanProducto> BuscarCatalogoProducto(String bpro) {
        //Creamos una lista de la clase BeanPerfila
        List<BeanProducto> lista = new ArrayList<>();
        String sql = "";
        try {
            //creamos una cadena de conxion
            xcon = objconexion.Conectar();
            //llamamos el procedimiento almacenado
            sql = "select  p.codpro,p.nompro,p.canpro,p.prepro,p.fotpro,pr.codprove,nomprove,c.codcat,nomcat,estpro "
                    + " from t_ProductoTienda p inner join t_proveedor pr on p.codprove=pr.codprove "
                    + " inner join t_Categoria c on p.codcat=c.codcat  where codpro like '%" + bpro + "%' or p.nompro like '%" + bpro + "%'";

            ps = xcon.prepareStatement(sql);

            //ejecutando la consulta
            rs = ps.executeQuery();
            //llenamos la lista
            while (rs.next()) {
                //creamos un objeto de la clase BeanPerfil
                BeanProducto objProducto = new BeanProducto();

                //asiganmos los valores del resulset hacia la clase
                objProducto.setCodigo(rs.getInt("codpro"));
                objProducto.setNombre(rs.getString("nompro"));

                // enviamos los datos a la lista con los valores de clase
                lista.add(objProducto);
            }
            xcon.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
            return null;
        }
        return lista;
    }

    @Override
    public List Buscar(String nombre) {
        List list = new ArrayList();
        String sql = "select * from t_ProductoTienda where nompro like '%" + nombre + "%'";
        try {
            xcon = objconexion.Conectar();
            ps = xcon.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BeanProducto p = new BeanProducto();
                p.setCodigo(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setCantidad(rs.getInt(3));
                p.setPrecio(rs.getDouble(4));
                p.setFoto(rs.getString(5));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public int actualizarstock(int id, int stock) {
        BeanProducto p = new BeanProducto();
        String sql = "update t_ProductoTienda set canpro=? where codpro=?";
        int r = 0;
        try {
            xcon = objconexion.Conectar();
            ps = xcon.prepareStatement(sql);

            ps.setInt(1, stock);
            ps.setInt(2, id);
            ps.executeUpdate();
//                p.setFoto(rs.getBinaryStream(3));

        } catch (Exception e) {
        }
        return r;
    }

}
