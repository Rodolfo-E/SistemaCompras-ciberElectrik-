
package CiberElectrik.util;
//importar la clase para poder trabajar
import java.sql.*;
public class Conexion {
    //cadena de conexion
    private String cadena="jdbc:mysql://localhost/CiberkElectrik?useSSL=false";
    //usuario
    private  String usuario="root";
    //clave--vacia
    private String clave="";
    //crear un objeto de clase conexion
    private Connection xcon;    
    
    public Connection Conectar(){
        //driver
        String driver="com.mysql.jdbc.Driver";
        try{
            Class.forName(driver);
            System.out.println("Se cargo el driver de forma correcta");
            //conexion a la base de datos
            xcon = DriverManager.getConnection(cadena, usuario, clave);
            System.out.println("Se conecto a la base de datos de Constructora Elvlis");
        }catch(ClassNotFoundException |SQLException ex){
            System.err.println(ex.toString());
        }
        return xcon;
    }
}
