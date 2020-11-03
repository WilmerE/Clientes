/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author WPelico
 */
public class TurnoConsultas extends Conexion {
    
    private String turno="";
    private Connection conexion;
    private PreparedStatement pstm;
    private ResultSet rs;
    
    public boolean InsertTurno(String tipoServicio) {
        
        int numerodeTurno;
        int resultUpdate=0;
        String codigo = null;

        try{
            if (tipoServicio.equals("servicio")){
                String cantidadTurnos = "SELECT COUNT(*) AS total FROM `turno` WHERE tipo_de_servicio= ?";
                pstm = getConexion().prepareCall(cantidadTurnos);
                this.pstm.setString(1, tipoServicio);
                this.rs = this.pstm.executeQuery();
                rs.next();
                numerodeTurno = this.rs.getInt("total");
                System.out.println("======== RESULTADO DE LA CONSULTA SERVICIO ========");
                System.out.println(numerodeTurno);
                return true;
            } else if (tipoServicio.equals("producto")){
                String cantidadTurnos = "SELECT COUNT(*) AS total FROM `turno` WHERE tipo_de_servicio= ?";
                pstm = getConexion().prepareCall(cantidadTurnos);
                this.pstm.setString(1, tipoServicio);
                rs = this.pstm.executeQuery();
                rs.next();
                numerodeTurno = this.rs.getInt("total");
                System.out.println("======== RESULTADO DE LA CONSULTA PRODUCTO ========");
                System.out.println(numerodeTurno);
                return true;
            }
            /*
            this.conexion = getConexion();
            String sql = "INSERT INTO `turno` (tipo_de_servicio, codigo) VALUES (?, ?)"; 
            this.pstm= this.conexion.prepareStatement(sql);
            
            this.pstm.setString(1, tipoServicio);
            this.pstm.setString(2, codigo);
            
            resultUpdate= this.pstm.executeUpdate();
            */
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
}
