



package CiberElectrik.dao;

import java.util.List;
import CiberElectrik.Bean.BeanCategoria;



public interface DaoCategoria {
    public List<BeanCategoria>MostrarCategoria();
    
     public boolean RegistrarCategoria(BeanCategoria bc);

    public boolean ActualizarCategoria(BeanCategoria bc);

    public boolean EliminarCategoria(BeanCategoria bc);

    public List<BeanCategoria> BuscarCategoria(BeanCategoria bc);
    
    public List<BeanCategoria> MostrarCategoriaTodo();
    
    public boolean HabilitarCategoria(BeanCategoria bc);
    
}
