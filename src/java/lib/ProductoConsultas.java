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
public class ProductoConsultas extends Conexion {
    
    private Connection conexion;
    private PreparedStatement pstm;
    private ResultSet rs;
        
    public ResultSet SelectProduto(){
        try{
            this.conexion = getConexion();
            String sql = "SELECT * FROM `producto`";
            this.pstm = this.conexion.prepareStatement(sql);
            this.rs = this.pstm.executeQuery();
        } catch(Exception ex){
             Logger.getLogger(ServicioConsultas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this.rs;
    }

    public boolean InsertProducto(String nombre, String codigo){

        int resultUpdate=0;
        
        try{
            this.conexion = getConexion();
            String sql = "INSERT INTO `producto` (nombre, codigo) VALUES (?, ?)"; 
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

    public boolean UpdateProducto(String nombre, String codigo, int id) {   
        try {
            this.conexion = getConexion();
            String sql = "UPDATE `producto` SET nombre = ?, codigo= ? where id = ?";
            this.pstm = this.conexion.prepareStatement(sql);
            this.pstm.setString(1, nombre);
            this.pstm.setString(2, codigo);
            this.pstm.setInt(3, id);
            this.pstm.executeUpdate();
            return true;
         } catch (SQLException e) {
            System.out.println("ERROR EN LA CONSULTA UPDATE" + e);
        }
         return false;
    }
    
     public ResultSet BuscarProducto(int id) {   
        try {
            this.conexion = getConexion();
            String sql = "SELECT * FROM `producto` where id = ?";
            this.pstm = this.conexion.prepareStatement(sql);
            this.pstm.setInt(1, id);
            this.rs = this.pstm.executeQuery();
        }catch (SQLException e) {
            System.out.println("ERROR EN CONSULTA " + e);
        }
         return this.rs;
    }
     
      public ResultSet DeleteServicio(int id) {   
        try {
            this.conexion = getConexion();
            String sql = "DELETE FROM `producto` where id = ?";
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
