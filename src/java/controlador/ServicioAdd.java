package controlador;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*; //Clases para el manejo de peticiones
import lib.ServicioConsultas;

/**
 *
 * @author WPelico
 */

@WebServlet(name = "ServicioAdd", urlPatterns = {"/ServicioAdd"})
public class ServicioAdd extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Indicamos el formato de escrtitura
        response.setContentType("text/html; charset=UTF-8");
        //Escribios la salida
        PrintWriter out = response.getWriter();
             
        try {
            //Capturamos los campos por medio de request
             String nombre=request.getParameter("NomServ");
             String codigo=request.getParameter("CodServ");
             
            ServicioConsultas consulta = new ServicioConsultas();
            
            if(consulta.registrar(nombre, codigo)){
                response.sendRedirect("vistas/modulo/list.jsp?succes=true");
                
            }else{
                response.sendRedirect("vistas/modulo/crear.jsp?error=true");
            }
        } finally{
            out.close();
        }
    
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}