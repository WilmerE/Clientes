/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author WPelico
 */
public class ClienteConsultas extends Conexion {
    
    private Connection conexion;
    private PreparedStatement pstm;
    private ResultSet rs;
    
    public ResultSet SelectCliente(){
        try{
            this.conexion = getConexion();
            String sql = "SELECT * FROM `cliente`";
            this.pstm = this.conexion.prepareStatement(sql);
            this.rs = this.pstm.executeQuery();
        } catch(Exception ex){
             Logger.getLogger(ServicioConsultas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this.rs;
    }
    
    public boolean InsertCliente(String nombres, String apellidos, String dpi, String telefono, String direccion){

        int resultUpdate=0;
        
        try{
            this.conexion = getConexion();
            String sql = "INSERT INTO `cliente` (nombres, apellidos, dpi, telefono, direccion )"
                    + "VALUES (?, ?, ?, ?, ?)"; 
            this.pstm= this.conexion.prepareStatement(sql);
            
            this.pstm.setString(1, nombres);
            this.pstm.setString(2, apellidos);
            this.pstm.setString(3, dpi);
            this.pstm.setString(4, telefono);
            this.pstm.setString(5, direccion);
            
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

    public boolean UpdateCliente(String nombres, String apellidos, String dpi, String telefono, String direccion, int id){   
        try {
            this.conexion = getConexion();
            String sql = "UPDATE `cliente` SET nombres = ?, apellidos = ?, dpi = ?, telefono = ?, direccion = ? "
                    + "where id = ?";
            this.pstm = this.conexion.prepareStatement(sql);
            this.pstm.setString(1, nombres);
            this.pstm.setString(2, apellidos);
            this.pstm.setString(3, dpi);
            this.pstm.setString(4, telefono);
            this.pstm.setString(5, direccion);
            this.pstm.setInt(6, id);
            
            this.pstm.executeUpdate();
            return true;
         } catch (SQLException e) {
            System.out.println("ERROR EN LA CONSULTA UPDATE" + e);
        }
         return false;
    }
    
     public ResultSet BuscarCliente(int id) {   
        try {
            this.conexion = getConexion();
            String sql = "SELECT * FROM `cliente` where id = ?";
            this.pstm = this.conexion.prepareStatement(sql);
            this.pstm.setInt(1, id);
            this.rs = this.pstm.executeQuery();
        }catch (SQLException e) {
            System.out.println("ERROR EN CONSULTA " + e);
        }
         return this.rs;
    }
     
      public ResultSet DeleteCliente(int id) {   
        try {
            this.conexion = getConexion();
            String sql = "DELETE FROM `cliente` where id = ?";
            this.pstm = this.conexion.prepareStatement(sql);
            this.pstm.setInt(1, id);
            this.pstm.executeUpdate();
        }catch (SQLException e) {
            System.out.println("ERROR EN CONSULTA " + e);
        }
         return this.rs;
    }
    
    public void close(){
        try {
          if(getConexion() != null) getConexion().close();
          if(this.pstm != null ) this.pstm.close();
          if(this.rs != null ) this.rs.close();
        } catch (Exception ex) {
          Logger.getLogger(ServicioConsultas.class.getName()).log(Level.SEVERE, null, ex);
        }     
    }
}
