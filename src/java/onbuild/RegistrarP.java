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
public class RegistrarP extends HttpServlet {

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
            out.println("<title>Servlet RegistrarP</title>");
            out.println("</head>");
            out.println("<body>");
            String nombre = request.getParameter("nom");
            String app = request.getParameter("app");
            String apm = request.getParameter("apm");
            String fecn = request.getParameter("fecn");
            String esc = request.getParameter("esc");
            String sex = request.getParameter("sex");
            String ed = request.getParameter("edad");
            String lat = request.getParameter("lat");
            String clave = request.getParameter("cla");
            String nick = request.getParameter("nick");

            //datos tutor
            String nomt = request.getParameter("nomt");
            String appt = request.getParameter("appt");
            String apmt = request.getParameter("apmt");
            String calle = request.getParameter("calle");
            String ne = request.getParameter("ne");
            String ni = request.getParameter("ni");
            String col = request.getParameter("col");
            String cp = request.getParameter("cp");
            String del = request.getParameter("del");
            String cd = request.getParameter("cd");
            String tel = request.getParameter("tel"); 
            String nickt = request.getParameter("nickt");
            String clat = request.getParameter("clat");

            //info terapeuta
            HttpSession sesion = request.getSession();
            String nicktera=sesion.getAttribute("nick")+"";
            
            int net, nit, cpt, telt;
            
            boolean sexb = false;
            if (sex.equals("Masculino")) {
                sexb = true;
            } else {
                sexb = false;
            }
            int edad;

            try {
                edad = Integer.parseInt(ed);
                net = Integer.parseInt(ne);
            nit = Integer.parseInt(ni);
            cpt = Integer.parseInt(cp);
            telt = Integer.parseInt(tel);
            } catch (Exception x) {
                edad = 0;
                net=0;
                nit=0;
                cpt=0;
                telt=0;
            }
            int late = 0;
            if (lat.equals("Zurdo")) {
                late = 1;
            } else if (lat.equals("Diestro")) {
                late = 2;
            } else {
                late = 3;
            }

            try {
                System.out.println(nick);
                System.out.println(nickt);
                //Verificamos si el usuario existe antes de registrarloxD
                if(conex.verificaExiste(nick) || conex.verificaExiste(nickt)){
                    //si devuelve falso es porque existe
                    out.println("<script>alert('El usuario no se puede registrar, el usuario ya existe')</script>");
                }else{
                conex.registrarU(nombre, app, apm, clave, nick, 3);
                conex.registrarP(fecn, esc, sexb, edad, late, nick,nicktera);
                conex.registrarU(nomt, appt, apmt, clat, nickt, 4);
                conex.registrarT(calle, nickt, net, nit, cpt, del, cd, telt, nick);
                conex.actualizartera(nick, nicktera);
                out.println("<script>alert('Paciente y Tutor registrados')</script>");
                response.sendRedirect("registrarPT.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(RegistrarP.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("El error es:" + ex.getMessage());
                out.println("El usuario no se registro");
            }
            out.println("El pt se registro xDD");
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