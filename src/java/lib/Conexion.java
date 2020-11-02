package lib;

import java.sql.*;
import java.util.logging.*;

/**
 *
 * @author WPelico
 */

 public class Conexion {
    
    /* POSTGRESQL
    private Connection con;
    private String user = "postgres";
    private String pass = "root";
    private String HOST = "localhost";
    private String PORT = "5432";
    private String DB = "Clientes";
    private String CLASSNAME = "org.postgresql.Driver";
    private String URL = "jdbc:postgresql://"+HOST+":"+PORT+"/"+DB;
    */
    //MYSQL
    private Connection con;
    private String user = "root";
    private String pass = "";
    private String HOST = "localhost";
    private String PORT = "3306";
    private String DB = "sct";
    private String CONF = "useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
    private String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    private String URL = "jdbc:mysql://"+HOST+"/"+DB+"?"+CONF;

    public Conexion(){
        try{
            //Driver Postgres
            Class.forName(CLASSNAME).newInstance();
            //Realizamos la conexión con las credenciales
            con = DriverManager.getConnection(URL, this.user, this.pass);
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