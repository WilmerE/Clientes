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
        String codigo = "";
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
                //Se genera el código para el servicio, iniciando con "SE0" + el número de turno
                codigo += "SE00" + String.valueOf(numerodeTurno+1);
                
                /* TEST COUNT
                //Mensajes en consola para el Test
                System.out.println("======== RESULTADO DE LA CONSULTA SERVICIO ========");
                System.out.println(numerodeTurno);
                //Retornamos true si no falla nada, para nuestro test
                return true;
                */
            } else if (tipoServicio.equals("producto")){
                String cantidadTurnos = "SELECT COUNT(*) AS total FROM `turno` WHERE tipo_de_servicio= ?";
                pstm = this.conexion.prepareCall(cantidadTurnos);
                this.pstm.setString(1, tipoServicio);
                rs = this.pstm.executeQuery();
                rs.next();
                numerodeTurno = this.rs.getInt("total");
                codigo += "PR00" + String.valueOf(numerodeTurno+1);
                
                /* TEST COUNT
                System.out.println("======== RESULTADO DE LA CONSULTA PRODUCTO ========");
                System.out.println(numerodeTurno);
                return true;
                */
            }
            
            //Consulta insert
            String sql = "INSERT INTO `turno` (tipo_de_servicio, codigo) VALUES (?, ?)"; 
            //Se prepara la consulta
            this.pstm= this.conexion.prepareStatement(sql);
            //Asignamos valores a las variables temporales de la consulta
            this.pstm.setString(1, tipoServicio);
            this.pstm.setString(2, codigo);
            //Ejecutamos consulta
            resultUpdate= this.pstm.executeUpdate();
            //Si nuestra consulta recibe un valor diferente a 0
            if(resultUpdate !=0){
                //Cerramos el escritor
                this.pstm.close();
                //TEST INSERT
                System.out.println("======== INSERT CORRECTO! ========");
                //Envíamos true como respuesta exitosa
                return true;
            }else{
                this.pstm.close();
                //TEST INSERT
                System.out.println("======== INSERT INCORRECTO! ========");
                return false;
            }

        }catch (Exception ex){
            System.out.println("Error en la base de datos.");
            ex.printStackTrace();
            return false;
        }
    }
}
