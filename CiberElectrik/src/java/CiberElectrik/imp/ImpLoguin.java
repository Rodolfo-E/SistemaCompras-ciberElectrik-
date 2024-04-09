
package CiberElectrik.imp;

import CiberElectrik.Bean.BeanPerfil;
import CiberElectrik.Bean.BeanUsuario;
import CiberElectrik.dao.DaoLoguin;
import CiberElectrik.util.Conexion;


import java.sql.*;



public class ImpLoguin implements DaoLoguin{

    
    //varibles
    Connection xcon;
    //CallableStatement es porque voy a trabajar con procedimientos almacendos
    
  //  CallableStatement cst;
    PreparedStatement pst;
    // Guarda los resultados de una consulta
    ResultSet rs;
    //objeto de la conexion
    Conexion objconexion=new Conexion();
  
    @Override
    public int ValidarUsuario(BeanUsuario bu) {
          int r=0;
   //    List<BeanUsuario> lista=new ArrayList<>();
   
            String sql="select u.codusu, u.nomusu, u.clausu, p.nomper  from t_usuario u inner join t_perfil p on u.codper=p.codper  where  u.nomusu = ? and u.clausu = ?";
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            pst=xcon.prepareStatement(sql);
            pst.setString(1, bu.getNombre());
             pst.setString(2, bu.getClave());
              rs=pst.executeQuery();
           //ejecutando el procedimiento almacenado
       //     res = pst.executeUpdate();
           
           while(rs.next()){
               
               r=r+1;
               BeanPerfil objperfil=new BeanPerfil();
                //asiganmos los valores del resulset hacia la clase
                 bu.setCodigo(rs.getInt("codusu"));
                 bu.setNombre(rs.getString("nomusu"));
                 bu.setClave(rs.getString("clausu"));
                 objperfil.setNombre(rs.getString("nomper"));
                 bu.setPerfil(objperfil);
           }
           if(r==1){
               return 1;
           }else{
               return 0;
           }
       
        }catch(Exception ex){
            System.err.println("Error"+ex.getMessage());
            return 0;
          
        }
      
      
    }

    @Override
    
    public int ValidarUsu(BeanUsuario bu) {
       int r=0;
   //    List<BeanUsuario> lista=new ArrayList<>();
   
            String sql="select codusu,nomusu from t_usuario  where nomusu = ? ";
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            pst=xcon.prepareStatement(sql);
            pst.setString(1, bu.getNombre());
              rs=pst.executeQuery();
           //ejecutando el procedimiento almacenado
       //     res = pst.executeUpdate();
           
           while(rs.next()){
               
               r=r+1;
         
                //asiganmos los valores del resulset hacia la clase
                 bu.setCodigo(rs.getInt("codusu"));
                 bu.setNombre(rs.getString("nomusu"));
           
           }
           if(r==1){
               return 1;
           }else{
               return 0;
           }
       
        }catch(Exception ex){
            System.err.println("Error"+ex.getMessage());
            return 0;
          
        }
    }

    @Override
    public int ValidarClave(BeanUsuario bu) {
       int r=0;
   //    List<BeanUsuario> lista=new ArrayList<>();
   
            String sql=" select codusu,clausu from t_usuario where clausu = ? ";
        try{
            //creamos una cadena de conxion
            xcon=objconexion.Conectar();
            //llamamos el procedimiento almacenado
            pst=xcon.prepareStatement(sql);
            pst.setString(1, bu.getClave());
              rs=pst.executeQuery();
           //ejecutando el procedimiento almacenado
       //     res = pst.executeUpdate();
           
           while(rs.next()){
               
               r=r+1;
         
                //asiganmos los valores del resulset hacia la clase
                 bu.setCodigo(rs.getInt("codusu"));
                 bu.setClave(rs.getString("clausu"));
           
           }
           if(r==1){
               return 1;
           }else{
               return 0;
           }
       
        }catch(Exception ex){
            System.err.println("Error"+ex.getMessage());
            return 0;
          
        }
    }

    
}
