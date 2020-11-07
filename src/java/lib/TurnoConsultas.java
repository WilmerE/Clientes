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

/**
 *
 * @author WPelico
 */
public class TurnoConsultas extends Conexion {
    
    private Connection conexion;
    private PreparedStatement pstm;
    private ResultSet rs;
    
    public boolean InsertTurno(String tipoServicio, int seleccion) {
        
        int numerodeTurno;
        int resultUpdate=0;
        String codigo = "";
        this.conexion = getConexion();

        try{
            //Si el cliente eligió un servicio
            if (tipoServicio.equals("servicio")){
                //Se cuenta la cantidad de servicios solicitdos
                String cantidadTurnos = "SELECT COUNT(*) AS total FROM `turno` WHERE tipo_de_atencion= ?";
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
                
                //==================== Consulta insert ==================== 
                String sql = "INSERT INTO `turno` (tipo_de_atencion, servicio_id, codigo) VALUES (?, ?, ?)"; 
                //Se prepara la consulta
                this.pstm= this.conexion.prepareStatement(sql);
                //Asignamos valores a las variables temporales de la consulta
                this.pstm.setString(1, tipoServicio);
                this.pstm.setInt(2, seleccion);
                this.pstm.setString(3, codigo);
                //Ejecutamos consulta
                resultUpdate= this.pstm.executeUpdate();
                
                /* TEST COUNT
                //Mensajes en consola para el Test
                System.out.println("======== RESULTADO DE LA CONSULTA SERVICIO ========");
                System.out.println(numerodeTurno);
                //Retornamos true si no falla nada, para nuestro test
                return true;
                */
            } else if (tipoServicio.equals("producto")){
                String cantidadTurnos = "SELECT COUNT(*) AS total FROM `turno` WHERE tipo_de_atencion= ?";
                pstm = this.conexion.prepareCall(cantidadTurnos);
                this.pstm.setString(1, tipoServicio);
                rs = this.pstm.executeQuery();
                rs.next();
                numerodeTurno = this.rs.getInt("total");
                codigo += "PR00" + String.valueOf(numerodeTurno+1);
                
                //==================== Consulta insert ==================== 
                String sql = "INSERT INTO `turno` (tipo_de_atencion, producto_id, codigo) VALUES (?, ?, ?)"; 
                //Se prepara la consulta
                this.pstm= this.conexion.prepareStatement(sql);
                //Asignamos valores a las variables temporales de la consulta
                this.pstm.setString(1, tipoServicio);
                this.pstm.setInt(2, seleccion);
                this.pstm.setString(3, codigo);
                //Ejecutamos consulta
                resultUpdate= this.pstm.executeUpdate();
                
                /* TEST COUNT
                System.out.println("======== RESULTADO DE LA CONSULTA PRODUCTO ========");
                System.out.println(numerodeTurno);
                return true;
                */
            }
            
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
    public ResultSet TurnosenCola(){
        try {
            String sql = "SELECT turno.id AS 'id', UCASE(turno.tipo_de_atencion) AS 'Atención', producto.nombre AS 'Solicitud', turno.codigo AS 'Turno' "
                    + "FROM turno INNER JOIN producto ON turno.producto_id = producto.id "
                    + "WHERE turno.estado = 'cola' "
                    + "UNION ALL SELECT turno.id AS 'id', UCASE(turno.tipo_de_atencion) AS 'Tipo de Atención', servicio.nombre AS 'Solicitud', turno.codigo AS 'Turno' "
                    + "FROM turno INNER JOIN servicio ON turno.servicio_id = servicio.id "
                    + "WHERE turno.estado='cola'";

            this.pstm = getConexion().prepareStatement(sql);
            this.rs = this.pstm.executeQuery();
            
            return this.rs;
        } catch (SQLException e) {
            System.out.println("ERROR EN CONSULTA " + e);
        }
        return null;
    }
    public ResultSet TurnosProducto(){
        try {
            String sql = "SELECT t.id AS 'id', t.tipo_de_atencion AS 'Tipo de Atención', p.nombre AS 'Producto', t.codigo AS 'Turno', t.estado "
                    + "FROM turno t "
                    + "INNER JOIN producto p ON t.producto_id = p.id "
                    + "WHERE t.estado='cola'";

            this.pstm = getConexion().prepareStatement(sql);
            this.rs = this.pstm.executeQuery();
            
            return this.rs;
        } catch (SQLException e) {
            System.out.println("ERROR EN CONSULTA " + e);
        }
        return null;
    }
    public ResultSet TurnosServicio(){
        try {
            String sql = "SELECT t.id AS 'id', t.tipo_de_atencion AS 'Tipo de Atención', s.nombre AS 'Producto', t.codigo AS 'Turno', t.estado "
                    + "FROM turno t "
                    + "INNER JOIN servicio s ON t.servicio_id = s.id "
                    + "WHERE t.estado='cola'";

            this.pstm = getConexion().prepareStatement(sql);
            this.rs = this.pstm.executeQuery();
            
            return this.rs;
        } catch (SQLException e) {
            System.out.println("ERROR EN CONSULTA " + e);
        }
        return null;
    }
    public boolean TurnoAtendido(int id){
        try {
            this.conexion = getConexion();
            String sql = "UPDATE `turno` SET `estado` = 'atendido' "
                    + "WHERE `turno`.`id` = ? ";
            this.pstm = this.conexion.prepareStatement(sql);
            this.pstm.setInt(1, id);
            
            this.pstm.executeUpdate();
            return true;
         } catch (SQLException e) {
            System.out.println("ERROR EN LA CONSULTA UPDATE" + e);
        }
         return false;
    }
    public void desconectar() {

        try {
            if (this.rs != null) {
                this.rs.close();
            }
            this.pstm.close();
            getConexion().close();
            System.out.println("Se desconecto Exitosamente");
        } catch (SQLException error) {
            System.out.println("ERROR EN DESCONEXION: " + error);
        }

    }
}
