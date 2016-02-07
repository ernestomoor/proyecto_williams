/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package onbuild;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Wolf
 */
public class ModificarPaciente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Acceso ac=new Acceso();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nombre = request.getParameter("nom");
            String app = request.getParameter("app");
            String apm = request.getParameter("apm");
            String fecn = request.getParameter("fecn");
            String esc = request.getParameter("esc");
            String sex = request.getParameter("sex");
            String ed = request.getParameter("edad");
            String lat = request.getParameter("lat");
            String clave = request.getParameter("cla");
            String nick = request.getParameter("xd");
            String nnick = request.getParameter("nnick");
            boolean sexb = false;
            if (sex.equals("Masculino")) {
                sexb = true;
            } else {
                sexb = false;
            }
            int edad;

            try {
                edad = Integer.parseInt(ed);
            } catch (Exception x) {
                edad = 0;
            }
            int late = 0;
            if (lat.equals("Zurdo")) {
                late = 1;
            } else if (lat.equals("Diestro")) {
                late = 2;
            } else {
                late = 3;
            }
            //modificarDatosPa(String nick,String nnick,  String nombre, String app, String apm, String clave,String fecn, String esc, boolean sex, int ed, int lat)
            ac.modificarDatosPa(nick, nnick, nombre, app, apm, clave, fecn, esc, sexb, edad, late);
            response.sendRedirect("terapeuta.jsp");
          
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
