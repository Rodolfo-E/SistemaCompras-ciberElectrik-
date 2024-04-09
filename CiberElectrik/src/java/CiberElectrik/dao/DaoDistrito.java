
package CiberElectrik.dao;
import java.util.List;
import CiberElectrik.Bean.BeanDistrito;


public interface DaoDistrito {
    public List<BeanDistrito>MostrarDistrito();
    
    public boolean RegistrarDistrito(BeanDistrito bd);

    public boolean ActualizarDistrito(BeanDistrito bd);

    public boolean EliminarDistrito(BeanDistrito bd);

    public List<BeanDistrito> BuscarDistrito(BeanDistrito bd);
    
      public List<BeanDistrito> MostrarDistritoTodo();
      
       public boolean HabilitarDistrito(BeanDistrito bd);
}
