package CiberElectrik.dao;

import java.util.List;
import CiberElectrik.Bean.BeanPerfil;

public interface DaoPerfil {
//declarar procedimientos y funciones
    public List<BeanPerfil> MostrarPerfil();

    public boolean RegistrarPerfil(BeanPerfil bp);

    public boolean ActualizarPerfil(BeanPerfil bp);

    public boolean EliminarPerfil(BeanPerfil bp);

    public List<BeanPerfil> BuscarPerfil(BeanPerfil bp);
    
   public List<BeanPerfil> MostrarPerfilTodo();
   
      public boolean HabilitarPerfil(BeanPerfil bp);

}
