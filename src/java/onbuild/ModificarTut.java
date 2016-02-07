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
public class ModificarTut extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet modificarTP</title>");            
            out.println("</head>");
            out.println("<body>");
            String nick=request.getParameter("xd");
            String nnick=request.getParameter("nickt");
            String nombre=request.getParameter("nomt");
            String app=request.getParameter("appt");
            String apm=request.getParameter("apmt");
            String calle=request.getParameter("calle");
            String nume=request.getParameter("ne");
            String numi=request.getParameter("ni");
            int ne=Integer.parseInt(nume);
            int ni=Integer.parseInt(numi);
            String col=request.getParameter("col");
            String cp=request.getParameter("cp");
            String del=request.getParameter("del");
            String cd=request.getParameter("cd");
            String tel=request.getParameter("tel");
            String clave=request.getParameter("clat");
            String rela=request.getParameter("rela");
            int cpi=Integer.parseInt(cp);
            int teli=Integer.parseInt(tel);
            Acceso ac=new Acceso();
            //modificarDatosTut(String calle, String nick,String nnick, int nume, int numi, int cp, String del, String ciu, int tel, String rela, String nombre, String app, String apm, String clave)
            ac.modificarDatosTut(calle, nick, nnick, ne, ni, cpi, del, cd, teli, rela, nombre, app, apm, clave);
            out.println("<h1>Servlet modificarTP at " + request.getContextPath() + "</h1>");
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
