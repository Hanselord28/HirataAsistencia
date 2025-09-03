/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bd;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Usuario;
import java.sql.ResultSet;
import model.Asistencia;


/**
 *
 * @author lvved
 */
public class DAO_Asistencia {
    private Conexion oConexion;

    public DAO_Asistencia() throws SQLException {
        oConexion = new Conexion(
                "localhost",
                "controlasistencia",
                "root",
                "" // pass
        );
    }

    // Buscar asistencia de hoy para un usuario
    public Asistencia obtenerAsistenciaHoy(int idUsuario) throws SQLException {
        String sql = "SELECT * FROM asistencias WHERE IdUsuario = " + idUsuario + " AND Fecha = CURDATE()";
        ResultSet rs = oConexion.ejecutarSelect(sql);

        Asistencia a = null;
        if (rs.next()) {
            a = new Asistencia();
            a.setIdAsistencia(rs.getInt("IdAsistencia"));
            a.setIdUsuario(rs.getInt("IdUsuario"));
            a.setFecha(rs.getDate("Fecha"));
            a.setHoraEntrada(rs.getTime("HoraEntrada"));
            a.setHoraSalida(rs.getTime("HoraSalida"));
        }
        rs.close();
        return a;
    }

    // Insertar entrada
    public void marcarEntrada(int idUsuario) throws SQLException {
        String sql = "INSERT INTO asistencias (IdUsuario, Fecha, HoraEntrada) VALUES ("
                + idUsuario + ", CURDATE(), CURTIME())";
        oConexion.ejecutar(sql);
    }

    // Actualizar salida
    public void marcarSalida(int idAsistencia) throws SQLException {
        String sql = "UPDATE asistencias SET HoraSalida = CURTIME() WHERE IdAsistencia = " + idAsistencia;
        oConexion.ejecutar(sql);
    }
}
