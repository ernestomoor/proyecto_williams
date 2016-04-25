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

            String nombre = request.getParameter("ter_nombre");
            String app = request.getParameter("ter_paterno");
            String apm = request.getParameter("ter_materno");
            String cedula = request.getParameter("ter_cedula");
            String nick = request.getParameter("ter_nick");
            String clave = request.getParameter("ter_clave");
            String hlunes = request.getParameter("hlun");
            String hmartes = request.getParameter("hmar");
            String hmiercoles = request.getParameter("hmie");
            String hjueves = request.getParameter("hjue");
            String hviernes = request.getParameter("hvie");
            String hsabado = request.getParameter("hsab");
            String hdomingo = request.getParameter("hdom");
            String privilegio = request.getParameter("ter_privilegio");

            //Casting de variables para el terapeuta
            int ter_privilegio = Integer.parseInt(privilegio);

            out.println("<title>Servlet RegistrarTe</title>");
            out.println("<link href=\"css/principal.css\" rel=\"stylesheet\" type=\"text/css\"/>");
            out.println("</head>");
            out.println("<body> Estamos en el servlet RegistraTe, parametros recibidos:");
            out.println(nombre + ","
                    + app + ","
                    + apm + ","
                    + cedula + ","
                    + nick + ","
                    + clave + ","
                    + hlunes + ","
                    + hmartes + ","
                    + hmiercoles + ","
                    + hjueves + ","
                    + hviernes + ","
                    + hsabado + ","
                    + hdomingo + ","
                    + ter_privilegio);
            
            out.println("<form action=\"CerrarSesion\" method=\"post\">\n" +
"                                <input type=\"button\" value=\"Registrar Terapeuta\" onclick=\"window.location.href = 'registrarTe.jsp'\" id=\"boton\"/>\n" +
"                                <input type=\"button\" value=\"Consultar Terapeutas\" onclick=\"location.href = 'ConsultarTerapeutas.jsp'\" id=\"boton\"/>                 \n" +
"                                <input type=\"button\" value=\"Inicio\" onclick=\"window.location.href = 'InicioAdministrador.jsp'\" id=\"boton\"/>                               \n" +
"                                <input type=\"submit\" value=\"Cerrar Sesion\" id=\"boton\">\n" +
"                            </form>  ");
            out.println("<h1>REGISTRO EXITOSO</h1>");
            try {
                if (!conex.verificaExiste(nick)) {
                    conex.registrarTerapeuta(nombre, app, apm, cedula, nick, clave, hlunes, hmartes, hmiercoles, hjueves, hviernes, hsabado, hdomingo, ter_privilegio);
                    System.out.println("Se ha registrado un usuario");
                    //conex.registrarTe(cedula, nick);
                    out.println("<script>alert('Se ha registrado el terapeuta')</script>");

                    /**
                     * ************************************************************************
                     * Desplegamos la información de una consulta del terapeura
                     * registrado 
                ***************************************************************************
                     */
                    String datosTerapeuta[] = conex.consultarDatosTerapeuta(nick);
                    out.println("<center>");
                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<td> Clave");
                    out.println("</td>");
                    out.println("<td> Terapeuta");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>"+datosTerapeuta[5]);
                    out.println("</td>");
                    out.println("<td>"+datosTerapeuta[0]+" "+datosTerapeuta[1]+" "+datosTerapeuta[2]);
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("</tabe>");
                    
                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<td>"+datosTerapeuta[6]);
                    out.println("</td>");
                    out.println("<td>"+datosTerapeuta[7]);
                    out.println("</td>");
                    out.println("<td>"+datosTerapeuta[8]);
                    out.println("</td>");
                    out.println("<td>"+datosTerapeuta[9]);
                    out.println("</td>");
                    out.println("<td>"+datosTerapeuta[10]);
                    out.println("</td>");
                    out.println("<td>"+datosTerapeuta[11]);
                    out.println("</td>");
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td> LUNES");
                    out.println("</td>");
                    out.println("<td> MARTES");
                    out.println("</td>");
                    out.println("<td>MIERCOLES");
                    out.println("</td>");
                    out.println("<td>JUEVES");
                    out.println("</td>");
                    out.println("<td>VIERNES");
                    out.println("</td>");
                    out.println("<td>SABADO");
                    out.println("</td>");
                    out.println("</tr>");
                    
                    
                    out.println("</table>");
                    out.println("</center>");
                    
                    
                    

                } else {
                    out.println("<script>alert('Ya existe un usuario registrado con el mismo nombre de usuario')</script>");
                    response.sendRedirect("InicioAdministrador.jsp");
                }
            } catch (SQLException ex) {
                //Logger.getLogger(RegistrarP.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("El error es:" + ex.getMessage());
                out.println("El usuario no se registro");
            }

            /*
            
            
                
                
                response.sendRedirect("admin.jsp");
                }else{
                    out.println("El terapeuta ya esta registrado");
                }
         
             
             */
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
