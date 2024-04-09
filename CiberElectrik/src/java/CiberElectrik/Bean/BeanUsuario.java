
package CiberElectrik.Bean;


public class BeanUsuario {
      private int codigo;
      private String nombre;
      private String clave;
      private boolean estado;
      private BeanPerfil perfil;

    public BeanUsuario() {
    }

    public BeanUsuario(int codigo, String nombre, String clave, boolean estado, BeanPerfil perfil) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.clave = clave;
        this.estado = estado;
        this.perfil = perfil;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public BeanPerfil getPerfil() {
        return perfil;
    }

    public void setPerfil(BeanPerfil perfil) {
        this.perfil = perfil;
    }


  


    


    
    
}
