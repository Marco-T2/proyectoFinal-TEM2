package com.emergentes.utiles;
//se tiene que extender de ConexionDB

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Validate extends ConexionBD {

    Connection con = this.conectar();
    PreparedStatement pr;

    public boolean checkUser(String login, String password) {

        boolean resultado = false;
        try {

            String sql = "select * from usuario where login=? and clave = md5(?)";
            
            pr = con.prepareStatement(sql);
            pr.setString(1, login);
            pr.setString(2, password);
            ResultSet rs = pr.executeQuery();
            resultado = rs.next();

        } catch (SQLException ex) {
            System.out.println("Error al autentificar "+ex.getMessage());
        }
        return resultado;
    }
}
