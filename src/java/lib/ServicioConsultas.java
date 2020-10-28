package lib;

import java.util.logging.*;
import java.sql.*;

/**
 *
 * @author WPelico
 */

public class ServicioConsultas extends Conexion {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
        
    public ResultSet SelectServicio(){
        try{
            String consulta = "SELECT * FROM servicio";
            pstm = getConexion().prepareStatement(consulta);
            rs = pstm.executeQuery(consulta);
        } catch(Exception ex){
             Logger.getLogger(ServicioConsultas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public boolean InsertServicio(String nombre, String estado){
        int resultUpdate=0;
        
        try{
            con = getConexion();
            String sql = "INSERT INTO `turnero`.`modulo` (`nombre`,`estado`, `descripcion`, `tipo_modulo_id`, `accion`) VALUES (?, ?, ?, ?, ?)"; 
            pstm= con.prepareStatement(sql);
            
            pstm.setString(1, nombre);
            pstm.setString(2, estado);
            pstm.setString(3, descripcion);
            pstm.setString(4, tipo_modulo);
            pstm.setString(5, "Disponible");
            
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

    public ResultSet BuscarServicio(String cod_modulo) {   
        try {

             String sql = "select * from modulo where id= ?";

             pstm = getConexion().prepareStatement(sql);
            pstm.setString(1, cod_modulo);
            consulta = pstm.executeQuery();

        }catch (SQLException e) {
            System.out.println("ERROR EN CONSULTA " + e);
        }
         return consulta;
    }

    public boolean UpdateServicio(int cod_modulo,String nombre,String estado,String descripcion) {   
        try {

             String sql = "update modulo set nombre = ?, estado= ?, descripcion = ? where id = ?";

             pstm = getConexion().prepareStatement(sql);
            pstm.setString(1, nombre);
            pstm.setString(2, estado);
            pstm.setString(3, descripcion);
            
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
        System.out.println("lib.ConsultasModulo.main()");
        ConsultasModulo co=new ConsultasModulo();
        co.registrar("TEst1", "DEscrip", "ee", "1");
    }
}  