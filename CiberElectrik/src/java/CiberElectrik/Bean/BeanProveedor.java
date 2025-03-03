

package CiberElectrik.Bean;


public class BeanProveedor {
    private int codigo;
    private String nombre;
    private String direccion;
    private String telefono;
    private String correo;
    private String ruc;
    private boolean estado;
    private BeanDistrito distrito;

    public BeanProveedor() {
    }

    public BeanProveedor(int codigo, String nombre, String direccion, String telefono, String correo, boolean estado, BeanDistrito distrito) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.correo = correo;
        this.estado = estado;
        this.distrito = distrito;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public BeanDistrito getDistrito() {
        return distrito;
    }

    public void setDistrito(BeanDistrito distrito) {
        this.distrito = distrito;
    }
    
    
    
}
