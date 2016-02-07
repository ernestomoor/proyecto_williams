/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package onbuild;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Acceso {

    Connection cn = null;
    Statement s;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static Connection con;

    private static final String url = "jdbc:mysql://localhost:3306/williams";
    private static final String usuario = "root";
    private static final String clave = "n0m3l0";
    private static final String DRIVER = "com.mysql.jdbc.Driver";

    public static Connection iniCon() throws SQLException {
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(url, usuario, clave);
            System.out.println("Conectado con exito...");

        } catch (ClassNotFoundException e) {
            System.err.println("Error ClassNotFoundException conectar, detalles: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error SQLException conectar, detalles: " + e.getMessage());

        }
        return con;

    }
    String consulta[];

    public void eliminarTera(String nomt) {
        try {
            ps = iniCon().prepareStatement("delete from terapeuta where Nick=?");
            ps.setString(1, nomt);
            ps.execute();
            ps = iniCon().prepareStatement("delete from usuario where Nick=?");
            ps.setString(1, nomt);
            ps.execute();
            iniCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarPT(String nomp, String nomt) {
        try {
            ps = iniCon().prepareStatement("delete from paciente where Nick=?");
            ps.setString(1, nomt);
            ps.execute();
            ps = iniCon().prepareStatement("delete from usuario where Nick=?");
            ps.setString(1, nomt);
            ps.execute();
            ps = iniCon().prepareStatement("delete from tutor where Nick=?");
            ps.setString(1, nomp);
            ps.execute();
            ps = iniCon().prepareStatement("delete from usuario where Nick=?");
            ps.setString(1, nomp);
            ps.execute();
            iniCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String[] consultar(String curp, String pass) throws SQLException {
        consulta = new String[4];
        try {
            ps = iniCon().prepareStatement("SELECT * FROM usuario WHERE Nick=? AND Clave=?");
            ps.setString(1, curp);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                consulta[0] = rs.getString("Nombre");
                consulta[1] = rs.getInt("TipoUsu") + "";
                consulta[2]= curp;
            }
            iniCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            System.out.println(ex.getMessage());
        }
        return consulta;
    }

    public void registrarU(String nombre, String app, String apm, String clave, String nick, int tu) throws SQLException {
        try {
            String insertarU = "INSERT INTO Usuario(Clave, Nombre, App, Apm, TipoUsu, Nick) VALUES(?,?,?,?,?,?);";
            ps = iniCon().prepareStatement(insertarU);
            ps.setString(1, clave);
            ps.setString(2, nombre);
            ps.setString(3, app);
            ps.setString(4, apm);
            ps.setInt(5, tu);
            ps.setString(6, nick);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            iniCon().close();
        }
    }

    public void registrarP(String fecn, String esc, boolean sex, int ed, int lat, String nick,String nickt) throws SQLException {
        try {
            String insertarP = "INSERT INTO Paciente(Edad, Sexo, FNac, Escolaridad, Lateralidad, Nick) VALUES(?,?,?,?,?,?);";
            ps = iniCon().prepareStatement(insertarP);
            ps.setInt(1, ed);
            ps.setBoolean(2, sex);
            ps.setString(3, fecn);
            ps.setString(4, esc);
            ps.setInt(5, lat);
            ps.setString(6, nick);
            ps.executeUpdate();
            ps = iniCon().prepareStatement("update terapeuta set RP=? where Nick=?");
            ps.setString(1, nick);
            ps.setString(2, nickt);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            iniCon().close();
        }
    }

    public void registrarT(String calle, String nick, int nume, int numi, int cp, String del, String ciu, int tel, String rela) throws SQLException {
        try {
            String insertarP = "INSERT INTO Tutor(Calle, NumeroEx, NumeroIn, CodigoP, Delegacion, Ciudad, Telef, Nick, Relacion) VALUES(?,?,?,?,?,?,?,?,?);";
            ps = iniCon().prepareStatement(insertarP);
            ps.setString(1, calle);
            ps.setInt(2, nume);
            ps.setInt(3, numi);
            ps.setInt(4, cp);
            ps.setString(5, del);
            ps.setString(6, ciu);
            ps.setInt(7, tel);
            ps.setString(8, nick);
            ps.setString(9, rela);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            iniCon().close();
        }

    }
    public void actualizartera(String nickp, String nickt) throws SQLException {
        try {
            String insertarP = "UPDATE Terapeuta SET RP=? WHERE Nick=?;";
            ps = iniCon().prepareStatement(insertarP);
            ps.setString(1, nickp);
            ps.setString(2, nickt);
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            iniCon().close();
        }

    }

    public void registrarTe(String cedu, String nick) throws SQLException {
        try {
            String insertarTe = "INSERT INTO Terapeuta(Cedula, Nick) VALUES(?,?);";
            ps = iniCon().prepareStatement(insertarTe);
            ps.setString(1, cedu);

            ps.setString(2, nick);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            iniCon().close();
        }
    }

    public void modificarDatosTut(String calle, String nick,String nnick, int nume, int numi, int cp, String del, String ciu, int tel, String rela, String nombre, String app, String apm, String clave) {
        String actualizarU = "UPDATE Usuario SET Clave=?, Nombre=?, App=?, Apm=?, Nick=? WHERE Nick=?";
        try {
            String actualizarT = "UPDATE Tutor SET Calle=?, NumeroEx=?, NumeroIn=?, CodigoP=?, Delegacion=?, Ciudad=?, Telef=?, Nick=?, Relacion=? WHERE Nick=?";
            ps = iniCon().prepareStatement(actualizarU);
            ps.setString(1, clave);
            ps.setString(2, nombre);
            ps.setString(3, app);
            ps.setString(4, apm);
            ps.setString(5, nnick);
            ps.setString(6, nick);
            ps.executeUpdate();
            ps = iniCon().prepareStatement(actualizarT);
            ps.setString(1, calle);
            ps.setInt(2, nume);
            ps.setInt(3, numi);
            ps.setInt(4, cp);
            ps.setString(5, del);
            ps.setString(6, ciu);
            ps.setInt(7, tel);
            ps.setString(8, nnick);
            ps.setString(9, rela);
            ps.setString(10, nick);
            ps.executeUpdate();
            iniCon().close();
        } catch (SQLException ex) {
            System.out.println("no se puede modificar");
            System.out.println(ex);
            System.out.println(ex.getMessage());

        }

    }

    public boolean verificaExiste(String nick) {
        boolean existe = false;
        // si existe es tru, si no existe falsexd
        String consulta = null;
        try {
            ps = iniCon().prepareStatement("SELECT * FROM usuario WHERE Nick=?");
            ps.setString(1, nick);
            rs = ps.executeQuery();
            while (rs.next()) {
                consulta = rs.getString("nombre");
            }
            iniCon().close();
            System.out.println(consulta);
            if (consulta == null) {

                existe = false;
            } else {
                existe = true;
            }
            return existe;
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            return existe;
        }

    }

    public void modificarDatosPa(String nick,String nnick,  String nombre, String app, String apm, String clave,String fecn, String esc, boolean sex, int ed, int lat) {
        String actualizarU = "UPDATE Usuario SET Clave=?, Nombre=?, App=?, Apm=?, Nick=? WHERE Nick=?";
        try {
            String actualizarP = "UPDATE Paciente SET Edad=?, Sexo=?, FNac=?, Escolaridad=?, Lateralidad=?, Nick=? WHERE Nick=?";
            ps = iniCon().prepareStatement(actualizarU);
            ps.setString(1, clave);
            ps.setString(2, nombre);
            ps.setString(3, app);
            ps.setString(4, apm);
            ps.setString(5, nnick);
            ps.setString(6, nick);
            ps.executeUpdate();
            ps = iniCon().prepareStatement(actualizarP);
            ps.setInt(1, ed);
            ps.setBoolean(2, sex);
            ps.setString(3, fecn);
            ps.setString(4, esc);
            ps.setInt(5, lat);
            ps.setString(6, nnick);
            ps.setString(7, nick);
            ps.executeUpdate();
            iniCon().close();
        } catch (SQLException ex) {
            System.out.println("no se puede modificar");

        }

    }
    public void modificarDatosTera(String nick,String nnick,  String nombre, String app, String apm, String clave,String cedula) {
        String actualizarU = "UPDATE Usuario SET Clave=?, Nombre=?, App=?, Apm=?, Nick=? WHERE Nick=?";
        try {
            String actualizarTera = "UPDATE Terapeuta SET Cedula=?, Nick=? WHERE Nick=?";
            ps = iniCon().prepareStatement(actualizarU);
            ps.setString(1, clave);
            ps.setString(2, nombre);
            ps.setString(3, app);
            ps.setString(4, apm);
            ps.setString(5, nnick);
            ps.setString(6, nick);
            ps.executeUpdate();
            ps = iniCon().prepareStatement(actualizarTera);
            ps.setString(1, cedula);
            ps.setString(2, nnick);
            ps.setString(3, nick);
            ps.executeUpdate();
            iniCon().close();
        } catch (SQLException ex) {
            System.out.println("no se puede modificar");

        }

    }
    public void crearCita(String fecha,String hora, String Cedula, String nickp){
        String ccita="insert into sesiones(Fecha, Hora, Cedula, NP, Stat) values(?,?,?,?,?)";
        try {
            ps=iniCon().prepareStatement(ccita);
            ps.setString(1, fecha);
            ps.setString(2, hora);
            ps.setString(3, Cedula);
            ps.setString(4, nickp);
            ps.setInt(5, 0);
            //0 pendiente, 1 si, 2 no, 3 rechazada
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            System.out.println(ex);
            System.out.println(" ");
            System.out.println(ex.getMessage());
        }
        
    }
    
    
    public void ConfirmarCita(int idSesion){
        try {
            ps=iniCon().prepareStatement("UPDATE sesiones SET Stat=? where idSesion=?");
            ps.setInt(1, 1);
            ps.setInt(2, idSesion);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void NegarCita(int idSesion){
     try {
            ps=iniCon().prepareStatement("UPDATE sesiones SET Stat=? where idSesion=?");
            ps.setInt(1, 2);
            ps.setInt(2, idSesion);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }
    public void CambiarCita(String fecha, String hora,int idSesion){
        try {
            ps=iniCon().prepareStatement("UPDATE sesiones SET Stat=?, Fecha=?, Hora=? where idSesion=?");
            ps.setInt(1, 1);
            ps.setString(2, fecha);
            ps.setString(3, hora);
            ps.setInt(4, idSesion);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void Receta(String Estudios,String Diagnosticos, String Observaciones,String NP){
        try {
            ps=iniCon().prepareStatement("INSERT INTO sesiont(Estudios, Diagnosticos, Observaciones, NP) values(?,?,?,?);");
            ps.setString(1, Estudios);
            ps.setString(2, Diagnosticos);
            ps.setString(3, Observaciones);
            ps.setString(4, NP);
            ps.executeUpdate();
            System.out.println("Se registro etsitosamente");
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        Acceso ac=new Acceso();
        ac.modificarDatosPa("paciente1", "paciente2", "pancho", "perex", "villax", "dsa", "fas", "sa", true, 10, 3);
        ac.modificarDatosTut("sdfghj", "tutorp1","tutorp2", 43, 12, 12, "ss", "neza", 551335166, "paciente2", "juan", "perex", "yoda", "xd");
        ac.modificarDatosTera("godas", "tepeutaM0xAAaa", "Mellisa", "clarke", "suicide", "EzaMel","XXX");
    }
    

}