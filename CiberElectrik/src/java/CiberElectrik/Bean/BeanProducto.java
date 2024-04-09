

package CiberElectrik.Bean;

import java.io.InputStream;


public class BeanProducto {
    private int codigo;
    private String nombre;
    private int cantidad;
    private double precio;
    private String foto;
    private boolean estado;
    private BeanProveedor proveedor;
    private BeanCategoria categoria;

    public BeanProducto() {
    }

    public BeanProducto(int codigo, String nombre, int cantidad, double precio, String foto, boolean estado, BeanProveedor proveedor, BeanCategoria categoria) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.precio = precio;
        this.foto = foto;
        this.estado = estado;
        this.proveedor = proveedor;
        this.categoria = categoria;
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

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public BeanProveedor getProveedor() {
        return proveedor;
    }

    public void setProveedor(BeanProveedor proveedor) {
        this.proveedor = proveedor;
    }

    public BeanCategoria getCategoria() {
        return categoria;
    }

    public void setCategoria(BeanCategoria categoria) {
        this.categoria = categoria;
    }
    
    
    
}

   