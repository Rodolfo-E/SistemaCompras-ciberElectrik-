
package CiberElectrik.Bean;

public class BeanCliente {
    
    private int codigo;
    private String nombre;
    private String apellido;
    private String usuario;
    private String clave;
    private String direccion;
    private String fecha;
    private String correo;
    private String telefono;
    private String celular;
    private BeanDistrito distrito;
    private boolean estado;

    public BeanCliente() {
    }

    public BeanCliente(int codigo, String nombre, String apellido, String usuario, String clave, String direccion, String fecha, String correo, String telefono, String celular, BeanDistrito distrito, boolean estado) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.usuario = usuario;
        this.clave = clave;
        this.direccion = direccion;
        this.fecha = fecha;
        this.correo = correo;
        this.telefono = telefono;
        this.celular = celular;
        this.distrito = distrito;
        this.estado = estado;
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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public BeanDistrito getDistrito() {
        return distrito;
    }

    public void setDistrito(BeanDistrito distrito) {
        this.distrito = distrito;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    
    

}