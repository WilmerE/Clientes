/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import static junit.framework.Assert.assertEquals;
import org.junit.Test;
import org.junit.*;
/*import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;*/

/**
 *
 * @author WPelico
 */
public class TurnoConsultasTest {
    
    public TurnoConsultasTest() {
    }

    /**
     * Test of InsertTurno method, of class TurnoConsultas.
     */
    @Test
    public void testInsertTurno() {
        System.out.println("InsertTurno");
        String tipoServicio = "servicio";
        TurnoConsultas instance = new TurnoConsultas();
        boolean expResult = true;
        boolean result = instance.InsertTurno(tipoServicio);
        assertEquals(expResult, result);
    }
    
}
