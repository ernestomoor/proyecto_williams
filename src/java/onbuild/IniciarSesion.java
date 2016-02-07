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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alumno
 */
public class IniciarSesion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Acceso bd = new Acceso();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession sesion=request.getSession(true);
            String curp = request.getParameter("curp");
            String pass = request.getParameter("pass");
            System.out.println(curp + pass);
            
            
            try{
           
               String nomusu[] = bd.consultar(curp, pass);
               
                   sesion.setAttribute("usuario", nomusu[0]);
                   sesion.setAttribute("privilegio", nomusu[1]);
                   sesion.setAttribute("nick", nomusu[2]);
                   System.out.println(sesion.getAttribute("nick"));
                   System.out.println(nomusu[0]+ nomusu[1]);
                   if(nomusu[1].equals("3")){
                       response.sendRedirect("paciente.jsp");
                   
                   }else if(nomusu[1].equals("4")){
                       response.sendRedirect("tutor.jsp");
                   
                   }else if(nomusu[1].equals("2")){
                       response.sendRedirect("terapeuta.jsp");
                   
                   }else if(nomusu[1].equals("1")){
                       response.sendRedirect("admin.jsp");
                   
                   }else{
                       System.out.println("No hay pagina para este usuario"+ nomusu[1]);
                   }
                  
                       
               
            } catch (SQLException ex) {
                Logger.getLogger(IniciarSesion.class.getName()).log(Level.SEVERE, null, ex);
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
