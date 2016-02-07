/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package onbuild;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Alumno
 */
public class RegistrarTe extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Acceso conex = new Acceso();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrarTe</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String nombre = request.getParameter("nomte");
            String app = request.getParameter("appte");
            String apm = request.getParameter("apmte");
            String cedula = request.getParameter("cedu");
            String clave = request.getParameter("clate");
            String nick = request.getParameter("nickte");
            
          
            System.out.println(nick);
             try {
                if(!conex.verificaExiste(nick)){
                conex.registrarU(nombre, app, apm, clave, nick, 2);
                conex.registrarTe(cedula, nick);
                out.println("<script>alert('Terapeuta Registrado')</script>");
                
                response.sendRedirect("admin.jsp");
                }else{
                    out.println("El terapeuta ya esta registrado");
                }
         }catch(SQLException ex){
                Logger.getLogger(RegistrarP.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("El error es:" + ex.getMessage());
                out.println("El usuario no se registro");
         }
            out.println("</body>");
            out.println("</html>");
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
