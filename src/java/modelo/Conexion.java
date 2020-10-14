/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 *
 * @author Erick
 */
public class Conexion {
    public Connection conexionBD;
    public final String bd = "dbempresa";
    public final String urlConexion  = String.format("jdbc:mysql://localhost:3306/%s?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",bd);
    public final String usuario = "usr_empresa";
    public final String contra = "Empres@123";
    public final String jdbc = "com.mysql.cj.jdbc.Driver";
    
    public void abrir_conexion(){
        try {
            Class.forName(jdbc);
            conexionBD = DriverManager.getConnection(urlConexion,usuario,contra);
        }
        catch (HeadlessException | ClassNotFoundException | SQLException ex){
            System.out.println("Error..." + ex.getMessage());
            }
    
    }
    
    public void cerrar_conexion(){
        try {
            conexionBD.close();
            } 
        catch (SQLException ex) {
            System.out.println("Error..." + ex.getMessage());
        }
        
    }
}