
package CiberElectrik.Bean;


public class BeanCarrito {
    
   private int item;
     private int codigoproducto;
         private String descripcion;
           private String foto;
           private double preciocompra;
             private int cantidad;
               private double subtotal;

    public BeanCarrito() {
    }

    public BeanCarrito(int item, int codigoproducto, String descripcion, String foto, double preciocompra, int cantidad, double subtotal) {
        this.item = item;
        this.codigoproducto = codigoproducto;
        this.descripcion = descripcion;
        this.foto = foto;
        this.preciocompra = preciocompra;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getCodigoproducto() {
        return codigoproducto;
    }

    public void setCodigoproducto(int codigoproducto) {
        this.codigoproducto = codigoproducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public double getPreciocompra() {
        return preciocompra;
    }

    public void setPreciocompra(double preciocompra) {
        this.preciocompra = preciocompra;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
    
    
}
