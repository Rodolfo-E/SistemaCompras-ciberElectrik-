

package CiberElectrik.dao;

import CiberElectrik.Bean.BeanProveedor;
import java.util.List;


public interface DaoProveedor {
    //declarar procedimientos y funciones
    public List<BeanProveedor> MostrarProveedor();

    public boolean RegistrarProveedor(BeanProveedor bpr);

    public boolean ActualizarProveedor(BeanProveedor bpr);

    public boolean EliminarProveedor(BeanProveedor bpr);

    public List<BeanProveedor> BuscarProveedor(BeanProveedor bpr);
    
    public List<BeanProveedor> MostrarProveedorTodo();

      public boolean HabilitarProveedor(BeanProveedor bpr);
}
