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
import javax.mail.Transport;
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
    Acceso conexion = new Acceso();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession sesion = request.getSession(true);
            String usuario = request.getParameter("nick");
            String pass = request.getParameter("pass");

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<body> Estamos en el servlet iniciar sesion, parametros recibidos:");
            out.println(usuario + pass);

            try {

                String[] administrador = conexion.consultarAdministrador(usuario, pass);
                String[] terapeuta = conexion.consultarTerapeuta(usuario, pass); 
                String[] paciente = conexion.consultarPaciente(usuario,pass);
                String[] tutor = conexion.consultarTutor(usuario,pass);

                out.println("<br>Resultado de la consulta administradores: " + administrador[0] + administrador[1] + administrador[2]);
                out.println("<br>Resultado de la consulta terapeutas: " + terapeuta[0] + terapeuta[1] + terapeuta[2]+terapeuta[3]);
                out.println("Fin de la consulta");
                System.out.println("Dato de la sesion"+sesion.getAttribute("usuario"));
                System.out.println("Resultado de la consulta para administrador, en iniciarSesion.java: " + administrador[0] + administrador[1] + administrador[2]);
                System.out.println("Resultado de la consulta para Terapeuta, en iniciarSesion.java: " + terapeuta[0] + terapeuta[1] + terapeuta[2]+terapeuta[3]);
                System.out.println("Resultado de la consulta para paciente, en iniciarSesion.java: " + paciente[0] + paciente[1] + paciente[2]);
                System.out.println("Resultado de la consulta para Tutor, en iniciarSesion.java: " + tutor[0] + tutor[1] + tutor[2]);
                
                /*Si en terapeuta hay algo diferente a null, sesion para el terapeuta*/
                if (terapeuta[0] != null) {
                    sesion.setAttribute("usuario", terapeuta[1]);
                    sesion.setAttribute("pass", terapeuta[2]);
                    sesion.setAttribute("privilegio", terapeuta[3]);
                    response.sendRedirect("terapeuta.jsp?cedula="+terapeuta[0]);
                }
                
                /*Si en paciente hay algo diferente a null, sesion para paciente */
                if (paciente[0] != null) {
                    sesion.setAttribute("usuario", paciente[0]);
                    sesion.setAttribute("pass", paciente[1]);
                    sesion.setAttribute("privilegio", paciente[2]);
                    response.sendRedirect("paciente.jsp");
                }
                
                if (tutor[0] != null) {
                    sesion.setAttribute("usuario", tutor[0]);
                    sesion.setAttribute("pass", tutor[1]);
                    sesion.setAttribute("privilegio", tutor[2]);
                    response.sendRedirect("tutor.jsp");
                }
                
                if (administrador[0]!=null) {
                    sesion.setAttribute("usuario", administrador[0]);
                    sesion.setAttribute("pass", administrador[1]);
                    sesion.setAttribute("privilegio", administrador[2]);
                    response.sendRedirect("InicioAdministrador.jsp");

                } 
                
              

            } catch (SQLException ex) {
                Logger.getLogger(IniciarSesion.class.getName()).log(Level.SEVERE, null, ex);
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
