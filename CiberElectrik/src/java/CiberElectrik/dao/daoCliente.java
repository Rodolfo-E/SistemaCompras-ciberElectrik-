/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CiberElectrik.dao;

import CiberElectrik.Bean.BeanCliente;
import CiberElectrik.Bean.BeanClienteWS;
import CiberElectrik.Bean.BeanUsuario;
import java.util.List;

/**
 *
 * @author RODOLFO
 */
public interface daoCliente {
         public List<BeanCliente> MostrarCliente();
 public int ValidarUsuario(BeanCliente bu) ;
     
 
    public boolean RegistrarCliente(BeanCliente bcli);
    

    public boolean ActualizarCliente(BeanCliente bcli);

    public boolean EliminarCliente(BeanCliente bcli);
   

    public List<BeanCliente> BuscarCliente(BeanCliente bcli);
    
    public List<BeanCliente> MostrarClienteTodo();
    
     public boolean HabilitarCliente(BeanCliente bcli);
}
