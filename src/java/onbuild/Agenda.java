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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sergio
 */
@WebServlet(name = "Agenda", urlPatterns = {"/Agenda"})
public class Agenda extends HttpServlet {

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
            
            //Declaramos variables
            String userTerapeuta=request.getParameter("user_terapeuta");
            String curpPaciente=request.getParameter("curp_paciente");
            String fechaSesion=request.getParameter("fecha");
            String HoraSesion=request.getParameter("hora");
            int no_sesion=Integer.parseInt(request.getParameter("no_sesion"));
            String observaciones=request.getParameter("observaciones");
            
            
            try {
                
                String []terapeuta=conex.consultarDatosTerapeuta(userTerapeuta);
               
            System.out.println(terapeuta[0]);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Agenda</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Agenda del terapeuta</h1>");
            out.println("<p>Datos del terapeuta:"+
                    terapeuta[0]+
                    terapeuta[1]+
                    terapeuta[2]+
                    terapeuta[3]+
                    terapeuta[4]+
                    terapeuta[5]+
                    terapeuta[6]+
                    terapeuta[7]+
                    terapeuta[8]+
                    terapeuta[9]+
                    terapeuta[10]+
                    terapeuta[11]+
                    terapeuta[12]+
                    terapeuta[13]+"</p>");
            out.println("<br/>"+userTerapeuta);
            out.println("<br/>"+curpPaciente);
            out.println("<br/>"+fechaSesion);
            out.println("<br/>"+HoraSesion);
            out.println("</body>");
            out.println("</html>");
            
                conex.registrarSesion(terapeuta[3], curpPaciente, fechaSesion,HoraSesion, no_sesion, observaciones);
                System.out.println("Se ha registrado una sesion");
        
                response.sendRedirect("Agenda.jsp");
             }catch(SQLException ex){
                //Logger.getLogger(RegistrarP.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("El error es:" + ex.getMessage());
                out.println("Ocurrio una falla al intentar registrar una sesion");
         }
            
            
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
