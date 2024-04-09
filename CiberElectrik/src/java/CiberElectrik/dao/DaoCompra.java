

package CiberElectrik.dao;

import CiberElectrik.Bean.BeanCompra;
import CiberElectrik.Bean.BeanDetalleCompra;
import CiberElectrik.Bean.BeanProducto;
import java.util.List;

public interface DaoCompra {
    
    public  int GenerarCompra(BeanCompra compra);
    
   public int IdCompra() ;
   
      public int guardarDetalleCompra(BeanDetalleCompra dc) ;
      
       public List misCompras(int id) ;
       
        public List Detalle(int id) ;
        
           public int Pagar(double monto);
           
             public int IdPago();
           
        
}
