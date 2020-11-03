/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author WPelico
 */
public class TurnoConsultas extends Conexion {
    
    private String turno="";
    
    public String InsertTurno(String TipodeAtencion) {
        
        int NumerodeTurno= 0;

        PreparedStatement pstm = null;
        ResultSet rs = null;
        int puntaje = 0;
        
        return "";
    }
}
