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
            
            
            //info terapeuta
            HttpSession sesion = request.getSession();
            String nicktera = sesion.getAttribute("nick") + "";

           //Variabes del paciente 
            String nombrePaciente = request.getParameter("nom");
            String paternoPaciente = request.getParameter("app");
            String maternoPaciente = request.getParameter("apm");
            String curpPaciente = request.getParameter("curp_paciente");
            String fechNacPaciente = request.getParameter("fecn");
            String escolaridadPaciente = request.getParameter("esc");
            String sexoPaciente = request.getParameter("sex");
            String edadPaciente = request.getParameter("edad");
            String lateralidadPaciente = request.getParameter("lat");
            String nickPaciente = request.getParameter("nick");
            String clavePaciente = request.getParameter("cla");
            String privPaciente = request.getParameter("priv_paciente");
            //Impresion de las variabes para el paciente
            System.out.println(nombrePaciente
                    +"\n"+ paternoPaciente
                    +"\n"+maternoPaciente
                    +"\n"+curpPaciente
                    +"\n"+fechNacPaciente
                    +"\n"+escolaridadPaciente
                    +"\n"+sexoPaciente
                    +"\n"+edadPaciente
                    +"\n"+lateralidadPaciente
                    +"\n"+nickPaciente
                    +"\n"+clavePaciente
                    +"\n"+privPaciente);
            
            //variables del tutor
            String nombreTutor = request.getParameter("nomt");
            String paternoTutor = request.getParameter("appt");
            String maternoTutor = request.getParameter("apmt");
            String curpTutor = request.getParameter("curp_tutor");
            String calleTutor = request.getParameter("calle");
            String numeroExteriorTutor = request.getParameter("ne");
            String numeroInteriorTutor = request.getParameter("ni");
            String coloniaTutor = request.getParameter("col");
            String delegacionTutor = request.getParameter("del");
            String codigoPostalTutor = request.getParameter("cp");
            String ciudadTutor = request.getParameter("cd");
            String telefonoTutor = request.getParameter("tel");
            String nickTutor = request.getParameter("nickt");
            String claveTutor = request.getParameter("clat");
            String privTutor = request.getParameter("priv_tutor");
           
            //Impresion de variables del tutor
            System.out.println( nombreTutor
                    +"\n"+paternoTutor
                    +"\n"+maternoTutor
                    +"\n"+curpTutor
                    +"\n"+calleTutor
                    +"\n"+numeroExteriorTutor
                    +"\n"+numeroInteriorTutor
                    +"\n"+coloniaTutor
                    +"\n"+delegacionTutor
                    +"\n"+codigoPostalTutor
                    +"\n"+ciudadTutor
                    +"\n"+telefonoTutor
                    +"\n"+nickTutor
                    +"\n"+claveTutor
                    +"\n"+privTutor);
            
            /*Casting de varibles del paciente*/
            int idSexoPaciente=3; //El valor 3 significa que no esta definido. 
            int idLateralidad=4; //El valor 4 significa que no esta definido.
            int edad = Integer.parseInt(edadPaciente);
            int idPrivPaciente = Integer.parseInt(privPaciente);
            //Define un Id para el sexo
            if (sexoPaciente.equals("Masculino")) {
                idSexoPaciente=1;
            } else {
                idSexoPaciente=2;
            }
            //Define un Id para la lateralidad del paciente
          
            if (lateralidadPaciente.equals("Zurdo")) {
                idLateralidad = 1;
            } else if (lateralidadPaciente.equals("Diestro")) {
                idLateralidad = 2;
            } else {
                idLateralidad = 3;
            }

            
            /*Casting para las variables del tutor*/
            
            int idPrivTutor = Integer.parseInt(privTutor);
            
            
            try {
                System.out.println(nickPaciente);
                System.out.println(nickTutor);
                //Verificamos si el usuario existe antes de registrarloxD
                if (conex.verificaExiste(nickPaciente) || conex.verificaExiste(nickTutor)) {
                    //si devuelve falso es porque existe
                    out.println("<script>alert('El usuario no se puede registrar, el usuario ya existe')</script>");
                } else {
                    //Conexión y metodo para registrar a un paciente
                    conex.registrarPaciente(nombrePaciente,
                            paternoPaciente,
                            maternoPaciente,
                            curpPaciente,
                            fechNacPaciente,
                            escolaridadPaciente,
                            idSexoPaciente,
                            edad,
                            idLateralidad,
                            nickPaciente,
                            clavePaciente,
                            idPrivPaciente);
                    //conexión y metodo para registrar a un tutor,
                    
                    conex.registrarTutor(nombreTutor,
                    paternoTutor,
                    maternoTutor,
                    curpTutor,
                    calleTutor,
                    numeroExteriorTutor,
                    numeroInteriorTutor,
                    coloniaTutor,
                    delegacionTutor,
                    codigoPostalTutor,
                    ciudadTutor,
                    telefonoTutor,
                    nickTutor,
                    claveTutor,
                    idPrivTutor);
                
               //conexion y metodo para registrar la relación paciente Tutor;
               conex.registrarRelacionPacienteTutor(curpTutor, curpPaciente);
              
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
