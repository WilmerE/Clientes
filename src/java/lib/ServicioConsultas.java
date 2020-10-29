package lib;

import java.util.logging.*;
import java.sql.*;

/**
 *
 * @author WPelico
 */

public class ServicioConsultas extends Conexion {

    private Connection conexion;
    private PreparedStatement pstm;
    private ResultSet rs;
        
    public ResultSet SelectServicio(){
        try{
            this.conexion = getConexion();
            String sql = "SELECT * FROM servicio";
            this.pstm = this.conexion.prepareStatement(sql);
            this.rs = this.pstm.executeQuery();
        } catch(Exception ex){
             Logger.getLogger(ServicioConsultas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public boolean InsertServicio(String nombre, String codigo){

        int resultUpdate=0;
        
        try{
            this.conexion = getConexion();
            String sql = "INSERT INTO servicio (nombre, codigo) VALUES (?, ?)"; 
            this.pstm= this.conexion.prepareStatement(sql);
            
            this.pstm.setString(1, nombre);
            this.pstm.setString(2, codigo);
            
            resultUpdate= this.pstm.executeUpdate();
        
        if(resultUpdate !=0){
            this.pstm.close();
            return true;
        }else{
            this.pstm.close();
            return false;
        }
        
        }catch (Exception ex){
            System.out.println("Error en la base de datos.");
            ex.printStackTrace();
            return false;
        }
    }

    public ResultSet BuscarServicio(String servicio_id) {   
        try {
            String sql = "select * from servicio where id= ?";
            this.pstm = getConexion().prepareStatement(sql);
            this.pstm.setString(1, servicio_id);
            this.rs = this.pstm.executeQuery();
        }catch (SQLException e) {
            System.out.println("ERROR EN CONSULTA " + e);
        }
         return this.rs;
    }

    public boolean UpdateServicio(String nombre, String codigo) {   
        try {
            String sql = "update servicio set nombre = ?, codigo= ? where id = ?";
            this.pstm = getConexion().prepareStatement(sql);
            this.pstm.setString(1, nombre);
            this.pstm.setString(2, codigo);
            this.pstm.executeUpdate();
            return true;
         } catch (SQLException e) {
            System.out.println("ERROR EN CONSULTA " + e);
        }
         return false;
    }
    
    public void close(){
        try {
          if(getConexion() != null) getConexion().close();
          if(this.pstm != null ) this.pstm.close();
          if(rs != null ) rs.close();
        } catch (Exception ex) {
          Logger.getLogger(ServicioConsultas.class.getName()).log(Level.SEVERE, null, ex);
        }     
    }
    
    public static void main(String args[]){
        System.out.println("lib.ServicioConultas.main()");
        ServicioConsultas conn = new ServicioConsultas();
        conn.InsertServicio("Conexion", "Ext1");
    }
}  