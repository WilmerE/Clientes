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
        this.conexion = getConexion();

        try{
            //Si el cliente eligió un servicio
            if (tipoServicio.equals("servicio")){
                //Se cuenta la cantidad de servicios solicitdos
                String cantidadTurnos = "SELECT COUNT(*) AS total FROM `turno` WHERE tipo_de_servicio= ?";
                //Se prepara la consulta
                pstm = this.conexion.prepareCall(cantidadTurnos);
                //Se le da el valor a la variable temporal de la consulta, con el valor recibido del formulario
                this.pstm.setString(1, tipoServicio);
                //Ejecutamos la consulta
                this.rs = this.pstm.executeQuery();
                //Recorremos en este caso su única columna 
                rs.next();
                //Le asignamos el valor a nuestra variable contador
                numerodeTurno = this.rs.getInt("total");
                //Mensajes en consola para el Test
                System.out.println("======== RESULTADO DE LA CONSULTA SERVICIO ========");
                System.out.println(numerodeTurno);
                //Retornamos true si no falla nada, para nuestro test
                return true;
            } else if (tipoServicio.equals("producto")){
                String cantidadTurnos = "SELECT COUNT(*) AS total FROM `turno` WHERE tipo_de_servicio= ?";
                pstm = this.conexion.prepareCall(cantidadTurnos);
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
