/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package onbuild;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Wolf
 */
public class Sesiones {

    PreparedStatement ps;
    ResultSet rs;
    Acceso conexion = new Acceso();

    public void SolicitarSesion(String f, String h, String c, String np) {
        try {
            conexion.iniCon();
            String sol = "insert into sesiones(Fecha, Hora, Cedula, NP, Stat) values(?,?,?,?,?)";
            ps.setString(1, f);
            ps.setString(2, h);
            ps.setString(3, c);
            ps.setString(4, np);
            ps.setInt(5, 3);
            ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Sesiones.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void ResponderSesion(String c, String np, int stat) {
        try {
            conexion.iniCon();
            String sol = "update sesiones set Stat=? where Cedula=? and NP=? ";
            ps.setString(2, c);
            ps.setString(3, np);
            ps.setInt(1, stat);
            ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Sesiones.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
