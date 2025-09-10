/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bd;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Usuario;
import java.sql.ResultSet;

/**
 *
 * @author A
 *
 * @author Zemekis
 */
public class DAO_Usuarios {

    private Conexion oConexion;


    /*
     constructor de DAO_Usuarios
     Genera la conexion entregando los datos
     */
    public DAO_Usuarios() throws SQLException {
        oConexion = new Conexion(
                "localhost",
                "controlasistencia",
                "root",
                ""//pass
        );
    }

    public Usuario isUsuario(String correo, String contrasena) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE Correo = '" + correo + "' AND Contrasena = '" + contrasena + "'";
        oConexion.rs = oConexion.ejecutarSelect(sql);
        Usuario oUsuario;

        if (oConexion.rs.next()) {
            oUsuario = new Usuario();
            oUsuario.setIdUsuario(oConexion.rs.getInt("IdUsuario"));
            oUsuario.setNombreCompleto(oConexion.rs.getString("NombreCompleto"));
            oUsuario.setCorreo(oConexion.rs.getString("Correo"));
            oUsuario.setContrasena(oConexion.rs.getString("Contrasena"));
            oUsuario.setRol(oConexion.rs.getString("Rol"));
            oUsuario.setFechaCreacion(oConexion.rs.getDate("FechaCreacion")); // usa java.util.Date
            return oUsuario;
        } else {
            return null;
        }
    }

    public void agregarUsuario(Usuario usuario) throws SQLException {
        String sql = "INSERT INTO usuarios (NombreCompleto, Correo, Contrasena, Rol, FechaCreacion) VALUES ('"
                + usuario.getNombreCompleto() + "', '"
                + usuario.getCorreo() + "', '"
                + usuario.getContrasena() + "', '"
                + usuario.getRol() + "', '"
                + new java.sql.Date(usuario.getFechaCreacion().getTime()) + "')";
        oConexion.ejecutar(sql);
    }

    public void modificarUsuario(Usuario usuario) throws SQLException {
        String sql = "UPDATE usuarios SET "
                + "NombreCompleto = '" + usuario.getNombreCompleto() + "', "
                + "Correo = '" + usuario.getCorreo() + "', "
                + "Contrasena = '" + usuario.getContrasena() + "', "
                + "Rol = '" + usuario.getRol() + "', "
                + "FechaCreacion = '" + new java.sql.Date(usuario.getFechaCreacion().getTime()) + "' "
                + "WHERE IdUsuario = " + usuario.getIdUsuario();
        oConexion.ejecutar(sql);
    }

    public List<Integer> obtenerIdsUsuarios() throws SQLException {
        List<Integer> ids = new ArrayList<>();
        String sql = "SELECT IdUsuario FROM usuarios";
        ResultSet rs = oConexion.ejecutarSelect(sql);
        while (rs.next()) {
            ids.add(rs.getInt("IdUsuario"));
        }
        rs.close();
        return ids;
    }

    public Usuario obtenerUsuarioPorId(int idUsuario) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE IdUsuario = " + idUsuario;
        ResultSet rs = oConexion.ejecutarSelect(sql);
        Usuario usuario = null;

        if (rs.next()) {
            usuario = new Usuario();
            usuario.setIdUsuario(rs.getInt("IdUsuario"));
            usuario.setNombreCompleto(rs.getString("NombreCompleto"));
            usuario.setCorreo(rs.getString("Correo"));
            usuario.setContrasena(rs.getString("Contrasena"));
            usuario.setRol(rs.getString("Rol"));
            usuario.setFechaCreacion(rs.getDate("FechaCreacion"));
        }
        rs.close();
        return usuario;
    }

    public void eliminarUsuario(int idUsuario) throws SQLException {
        String sql = "DELETE FROM usuarios WHERE IdUsuario = " + idUsuario;
        oConexion.ejecutar(sql);
    }

}
