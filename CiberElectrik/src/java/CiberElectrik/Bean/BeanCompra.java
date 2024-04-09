
package CiberElectrik.Bean;

import java.util.List;

public class BeanCompra {
    
    private int id;
    private int idUsuario;
      private String fecha;
         private Double monto;
    private int idpago;
    private String estado;
    
    private List<BeanCarrito>detallecompras;

    public BeanCompra() {
    }

    public BeanCompra(int id, int idUsuario, String fecha, Double monto, int idpago, String estado, List<BeanCarrito> detallecompras) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.fecha = fecha;
        this.monto = monto;
        this.idpago = idpago;
        this.estado = estado;
        this.detallecompras = detallecompras;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public int getIdpago() {
        return idpago;
    }

    public void setIdpago(int idpago) {
        this.idpago = idpago;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public List<BeanCarrito> getDetallecompras() {
        return detallecompras;
    }

    public void setDetallecompras(List<BeanCarrito> detallecompras) {
        this.detallecompras = detallecompras;
    }


    
    
}
