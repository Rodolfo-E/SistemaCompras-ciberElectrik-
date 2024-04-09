

package CiberElectrik.dao;

import CiberElectrik.Bean.BeanProducto;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

public interface DaoProducto {
    //declarar procedimientos y funciones
    public List<BeanProducto> MostrarProducto();

    public boolean RegistrarProducto(BeanProducto bpro);

    public boolean ActualizarProducto(BeanProducto bpro);

    public boolean EliminarProducto(BeanProducto bpro);
    
      public void listarImg(int cod,HttpServletResponse response);

    public List<BeanProducto> BuscarProducto(BeanProducto bpro);
    
     public List<BeanProducto> BuscarCatalogoProducto(String bpro);
    
    public List<BeanProducto> MostrarProductoTodo();
    
     public boolean HabilitarProducto(BeanProducto bpro);
     
       public BeanProducto listarId(int id);
       
         public List Buscar(String nombre) ;
              public int actualizarstock(int id,int stock) ;
              
    
}
