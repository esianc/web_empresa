/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author Erick
 */
public class Login {
    int retorno=0;
    private Conexion cn;
    
        public int validarResp (Usuarios us){
        try {
            cn = new Conexion();
            String query="SELECT COUNT(idUsuario) AS cantidad FROM usuarios WHERE usuario='"+us.getUsuario()+"' AND pass='"+us.getPass()+"'";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
                retorno = consulta.getInt("cantidad");
            }
            cn.cerrar_conexion();
        } catch (SQLException ex){
          System.out.println(ex.getMessage());
          retorno = 0;  
        }
        return retorno;
    }
}
