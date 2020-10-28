package lib;

import java.util.logging.*;
import java.sql.*;

/**
 *
 * @author WPelico
 */

public class ServicioConsultas extends Conexion {

    private Connection conexion;
    PreparedStatement pstm;
    ResultSet rs;
        
    public ResultSet SelectServicio(){
        try{
            this.conexion = getConexion();
            String sql = "SELECT * FROM servicio";
            pstm = this.conexion.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
        } catch(Exception ex){
             Logger.getLogger(ServicioConsultas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public boolean InsertServicio(String nombre, String codigo){

        int resultUpdate=0;
        
        try{
            this.conexion = getConexion();
            String sql = "INSERT INTO 'servicio' ('nombre', 'codigo') VALUES (?, ?)"; 
            pstm= this.conexion.prepareStatement(sql);
            
            pstm.setString(1, nombre);
            pstm.setString(2, codigo);
            
            resultUpdate= pstm.executeUpdate();
        
        if(resultUpdate !=0){
            pstm.close();
            return true;
        }else{
            pstm.close();
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
            pstm = getConexion().prepareStatement(sql);
            pstm.setString(1, servicio_id);
            consulta = pstm.executeQuery();
        }catch (SQLException e) {
            System.out.println("ERROR EN CONSULTA " + e);
        }
         return consulta;
    }

    public boolean UpdateServicio(String nombre, String codigo) {   
        try {
            String sql = "update servicio set nombre = ?, codigo= ? where id = ?";
            pstm = getConexion().prepareStatement(sql);
            pstm.setString(1, nombre);
            pstm.setString(2, codigo);
            pstm.executeUpdate();
            return true;
         } catch (SQLException e) {
            System.out.println("ERROR EN CONSULTA " + e);
        }
         return false;
    }
    
    public void close(){
        try {
          if(getConexion() != null) getConexion().close();
          if(pstm != null ) pstm.close();
          if(rs != null ) rs.close();
        } catch (Exception ex) {
          Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
        }     
    }
    
    public static void main(String args[]){
        System.out.println("lib.ServicioConultas.main()");
        ServicioConultas conn = new ServicioConultas();
        conn.registrar("Conexion", "Ext1");
    }
}  