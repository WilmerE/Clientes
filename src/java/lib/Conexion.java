package lib;

import java.sql.*;
import java.util.logging.*;

/**
 *
 * @author WPelico
 */

 public class Conexion {

    private Connection con;
    private String user = "postgres";
    private String pass = "root";
    private String HOST = "localhost";
    private String PORT = "5432";
    private String DB = "Clientes";
    private String CLASSNAME = "org.postgresql.Driver";
    private String URL = "jdbc:postgresql://"+HOST+":"+PORT+"/"+DB;

    public Conexion(){
        try{
        	//Driver Postgres
            Class.forName(CLASSNAME);
            //Realizamos la conexión con las credenciales
            con = DriverManager.getConnection(URL, username, password);
        } catch(ClassNotFoundException ex){
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }catch(Exception ex){
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  
    public void cerrarConexion() {
      try {
          con.close();
      } catch (SQLException sqle) {
          Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, sqle);
      }
    }
  
    public Connection getConexion(){
        return con;
    }
}