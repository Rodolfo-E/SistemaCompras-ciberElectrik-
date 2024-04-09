package CiberElectrik.dao;


import CiberElectrik.Bean.BeanUsuario;
import java.util.List;

public interface DaoUsuario {
//declarar procedimientos y funciones
    public List<BeanUsuario> MostrarUsuario();

    public boolean RegistrarUsuario(BeanUsuario bu);

    public boolean ActualizarUsuario(BeanUsuario bu);

    public boolean EliminarUsuario(BeanUsuario bu);

    public List<BeanUsuario> BuscarUsuario(BeanUsuario bu);
    
      public List<BeanUsuario> MostrarUsuarioTodo();
      
    public boolean HabilitarUsuario(BeanUsuario bu);

}
