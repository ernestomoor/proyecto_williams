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
    private static final String usuario = "admin";
    private static final String clave = "n0m3l0s3";
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
    
    
        public String[] consultarSesionesPorTerapeuta (String unaCedula) throws SQLException {
        consulta = new String[4];
        try {
            ps = iniCon().prepareStatement("SELECT * FROM sesiones WHERE Cedula=?");
            ps.setString(1, unaCedula);
            rs = ps.executeQuery();
            while (rs.next()) {
                consulta[0] = rs.getString("Usuario");
                consulta[1] = rs.getString("Password");
                consulta[2]=  rs.getString("Id_priv");
            }
            iniCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            System.out.println(ex.getMessage());
        }
        return consulta;
    }
    
    
    
    
    public String[] consultarAdministrador(String unNick, String pass) throws SQLException {
        consulta = new String[4];
        try {
            ps = iniCon().prepareStatement("SELECT * FROM administrador WHERE Usuario=? AND Password=?");
            ps.setString(1, unNick);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                consulta[0] = rs.getString("Usuario");
                consulta[1] = rs.getString("Password");
                consulta[2]=  rs.getString("Id_priv");
            }
            iniCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            System.out.println(ex.getMessage());
        }
        return consulta;
    }
    public String[] consultarTerapeuta(String unNick, String pass) throws SQLException {
        consulta = new String[4];
        try {
            ps = iniCon().prepareStatement("SELECT Cedula, Nick, Clave, Id_priv FROM  terapeuta WHERE Nick=? AND Clave=?");
            ps.setString(1, unNick);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                consulta[0] = rs.getString("Cedula");
                consulta[1] = rs.getString("Nick");
                consulta[2] = rs.getString("Clave");
                consulta[3] =  rs.getString("Id_priv");
            }
            iniCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            System.out.println(ex.getMessage());
        }
        return consulta;
    }
    

 
    public String[] consultarPacientePorCurp(String unCurp) throws SQLException {
        consulta = new String[14];
        try {
            ps = iniCon().prepareStatement("SELECT Nombre, App, Apm, Curp_paciente, Fnac, Escolaridad, Sexo, Edad, Lateralidad, Nick, Clave, Id_priv  FROM  paciente WHERE Curp_Paciente=?");
            ps.setString(1, unCurp);
            rs = ps.executeQuery();
            while (rs.next()) {
                consulta[0] = rs.getString("Nombre");
                consulta[1] = rs.getString("App");
                consulta[2]=  rs.getString("Apm");
                consulta[3] = rs.getString("CurpPaciente");
                consulta[4] = rs.getString("Fnac");
                consulta[5]=  rs.getString("Escolaridad");
                consulta[6] = rs.getString("Sexo");
                consulta[7] = rs.getString("Edad");
                consulta[8]=  rs.getString("Lateralidad");
                consulta[9] = rs.getString("Nick");
                consulta[10] = rs.getString("Clave");
                consulta[11]=  rs.getString("Id_priv");
                
            }
            iniCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            System.out.println(ex.getMessage());
        }
        return consulta;
    }
    
    
    
    public String[] consultarDatosTerapeuta(String unNick) throws SQLException {
        consulta = new String[14];
        try {
            ps = iniCon().prepareStatement("SELECT Nombre, App, Apm, Cedula, Nick, Clave, HLun, HMar, HMie, HJue, HVie, HSab, HDom, Id_priv  FROM  terapeuta WHERE Nick=?");
            ps.setString(1, unNick);
            rs = ps.executeQuery();
            while (rs.next()) {
                consulta[0] = rs.getString("Nombre");
                consulta[1] = rs.getString("App");
                consulta[2]=  rs.getString("Apm");
                consulta[3] = rs.getString("Cedula");
                consulta[4] = rs.getString("Nick");
                consulta[5]=  rs.getString("Clave");
                consulta[6] = rs.getString("HLun");
                consulta[7] = rs.getString("HMar");
                consulta[8]=  rs.getString("HMie");
                consulta[9] = rs.getString("HJue");
                consulta[10] = rs.getString("HVie");
                consulta[11]=  rs.getString("HSab");
                consulta[12] = rs.getString("HDom");
                consulta[13]=  rs.getString("Id_priv");
            }
            iniCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            System.out.println(ex.getMessage());
        }
        return consulta;
    } 
    
    
    
    
    public String[] consultarPaciente(String unNick, String pass) throws SQLException {
        consulta = new String[4];
        try {
            ps = iniCon().prepareStatement("SELECT Nick, Clave, Id_priv FROM  paciente WHERE Nick=? AND Clave=?");
            ps.setString(1, unNick);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                consulta[0] = rs.getString("Nick");
                consulta[1] = rs.getString("Clave");
                consulta[2]=  rs.getString("Id_priv");
            }
            iniCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            System.out.println(ex.getMessage());
        }
        return consulta;
    }
    
 
    public String[] consultarTutor(String unNick, String pass) throws SQLException {
        consulta = new String[4];
        try {
            ps = iniCon().prepareStatement("SELECT Nick, clave, Id_priv FROM  tutor WHERE Nick=? AND Clave=?");
            ps.setString(1, unNick);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                consulta[0] = rs.getString("Nick");
                consulta[1] = rs.getString("Clave");
                consulta[2]=  rs.getString("Id_priv");
            }
            iniCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            System.out.println(ex.getMessage());
        }
        return consulta;
    }
    
    
    
    
    
    public void registrarTerapeuta(String unNombre,
            String unPaterno,
            String unMaterno,
            String unaCedula,
            String unNick,
            String unaClave,
            String hlun,
            String hmar,
            String hmie,
            String hjue,
            String hvie,
            String hsab,
            String hdom,
            int unPrivilegio) throws SQLException {
        System.out.println("Entrando al metodo  registrarTerapeuta");
        try{
            String insertarU = "INSERT INTO terapeuta(Nombre, App, Apm, Cedula, Nick, Clave, Hlun, Hmar, HMie, HJue, HVie, HSab, HDom, Id_priv) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            ps = iniCon().prepareStatement(insertarU);
            ps.setString(1, unNombre);
            ps.setString(2, unPaterno);
            ps.setString(3, unMaterno);
            ps.setString(4, unaCedula);
            ps.setString(5, unNick);
            ps.setString(6, unaClave);
            ps.setString(7, hlun);
            ps.setString(8, hmar);
            ps.setString(9, hmie);
            ps.setString(10, hjue);
            ps.setString(11, hvie);
            ps.setString(12, hsab);
            ps.setString(13, hdom);
            ps.setInt(14, unPrivilegio);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            iniCon().close();
        }
    }
    
    public String[] consultarExpediente(String curpPaciente)throws SQLException {
    consulta = new String[4];
        try {
            ps = iniCon().prepareStatement("SELECT Estudios, Diagnosticos, Observaciones FROM expediente WHERE Curp=?");
            ps.setString(1, curpPaciente);
            rs = ps.executeQuery();
            while (rs.next()) {
                consulta[0] = rs.getString("Estudios");
                consulta[1] = rs.getString("Diagnosticos");
                consulta[2]=  rs.getString("Observaciones");
            }
            iniCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            System.out.println(ex.getMessage());
        }
        return consulta;
    
    }
    
    
    public void registrarTeviejo(String unaCedula, String unNick) throws SQLException {
        System.out.println("entrando a registrar datos del terapeuta");
        try {
            String insertarTe = "INSERT INTO terapeuta(Cedula, Nick) VALUES(?,?);";
            ps = iniCon().prepareStatement(insertarTe);
            ps.setString(1, unaCedula);
            ps.setString(2, unNick);
            ps.executeUpdate();
            System.out.println("teraputa registrado");
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            iniCon().close();
        }
    }
    
    public void registrarRelacionPacienteTutor(String curpTutor, String curpPaciente ) throws SQLException {
        try {
            String insertarRelacionTP = "INSERT INTO tutor_paciente(Curp_tutor, Curp_paciente) VALUES(?,?);";
            ps = iniCon().prepareStatement(insertarRelacionTP);
            ps.setString(1, curpTutor);
            ps.setString(2, curpPaciente);
            ps.executeUpdate();
            System.out.println("La relación tutor_paciente se registro exitosamente ");
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            iniCon().close();
        }
    
    }

    public void registrarSesion(String unaCedula, String unCurpPaciente, String unaFecha, String unaHora, int noSesion, String unaObservacion)throws SQLException {
        try {
            String insertarSes = "INSERT INTO sesiones(Cedula, Curp_paciente,Fecha, Hora, No_sesion, Observaciones) VALUES(?,?,?,?,?,?);";
            ps = iniCon().prepareStatement(insertarSes);
            ps.setString(1, unaCedula);
            ps.setString(2,unCurpPaciente);
            ps.setString(3, unaFecha);
            ps.setString(4, unaHora);
            ps.setInt(5,noSesion);
            ps.setString(6,unaObservacion);
            ps.executeUpdate();
       
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            iniCon().close();
        }
    }
    
    public boolean registrarEnExpediente(String unCurp, String unEstudio, String unDiagnostico, String unaObservacion)throws SQLException {
        try {
            String insertarExp = "INSERT INTO expediente(Curp, Estudios, Diagnosticos, Observaciones) VALUES(?,?,?,?);";
            ps = iniCon().prepareStatement(insertarExp);
            ps.setString(1, unCurp);
            ps.setString(2,unEstudio);
            ps.setString(3, unDiagnostico);
            ps.setString(4, unaObservacion);
            ps.executeUpdate();
          
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            iniCon().close();
        }
    }
    
    
    public void registrarPaciente(String unNombre,
            String unMaterno,
            String unPaterno,
            String unCurp,
            String unaFecha,
            String unaEscolaridad,
            int unSexo,
            int unaEdad,
            int unaLateralidad,
            String unNick,
            String unaClave,
            int unPriv) throws SQLException {
        try {
            String insertarP = "INSERT INTO paciente(Nombre, App, Apm, Curp_paciente, FNac, Escolaridad, Sexo, Edad,  Lateralidad, Nick, Clave, Id_priv) VALUES(?,?,?,?,?,?,?,?,?,?,?,?);";
            ps = iniCon().prepareStatement(insertarP);
            ps.setString(1, unNombre);
            ps.setString(2,unPaterno);
            ps.setString(3, unMaterno);
            ps.setString(4, unCurp);
            ps.setString(5, unaFecha);
            ps.setString(6, unaEscolaridad);
            ps.setInt(7, unSexo);
            ps.setInt(8, unaEdad);
            ps.setInt(9, unaLateralidad);
            ps.setString(10, unNick);
            ps.setString(11, unaClave);
            ps.setInt(12, unPriv);
            ps.executeUpdate();
       
        } catch (SQLException ex) {
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            iniCon().close();
        }
    }
    public void registrarTutor(String unNombre,
            String unPaterno,
            String unMaterno,
            String unCurp,
            String unaCalle,
            String unNumExterior,
            String unNumInterior,
            String unaColonia,
            String unaDelegacion,
            String unCodigoPostal,
            String unaCiudad,
            String unTelefono,
            String unNick,
            String unaClave,
            int unIdPrivilegio)throws SQLException {
  
        try {
            String insertarP = "INSERT INTO tutor(Nombre, App, Apm, Curp_tutor, Calle, NumeroEx, NumeroIn, Colonia, Delegacion, CodigoP, Ciudad, Telefono, Nick, clave, Id_priv) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            ps = iniCon().prepareStatement(insertarP);
            ps.setString(1, unNombre);
            ps.setString(2, unPaterno);
            ps.setString(3, unMaterno);
            ps.setString(4, unCurp);
            ps.setString(5, unaCalle);
            ps.setString(6, unNumExterior);
            ps.setString(7, unNumInterior);
            ps.setString(8, unaColonia);
            ps.setString(9, unaDelegacion);
            ps.setString(10, unCodigoPostal);
            ps.setString(11, unaCiudad);
            ps.setString(12, unTelefono);
            ps.setString(13, unNick);
            ps.setString(14, unaClave);
            ps.setInt(15, unIdPrivilegio);
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
        String consulta=null;
        try {
            ps = iniCon().prepareStatement("SELECT * FROM terapeuta WHERE Nick=?");
            ps.setString(1, nick);
            rs = ps.executeQuery();
            while (rs.next()) {
                consulta = rs.getString("Nick");
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