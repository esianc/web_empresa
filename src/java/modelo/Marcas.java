/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Erick
 */
public class Marcas {
    private String marca;
    private int id;
    private Conexion cn;
    public Marcas() {}

    public Marcas(String marca, int id) {
        this.marca = marca;
        this.id = id;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
                String query="SELECT idMarca as id, marca from marcas;";
                ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
                String encabezado[] = {"ID","Marcas"};
                tabla.setColumnIdentifiers(encabezado);
                String datos[] = new String[2];
                while (consulta.next()){
                    datos[0] = consulta.getString("id");
                    datos[1] = consulta.getString("marca");
                    tabla.addRow(datos);
                }
            cn.cerrar_conexion();
        } catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return tabla;
    }
    
    public int agregar(){
        int retorno = 0;
        try {
            cn = new Conexion();
            PreparedStatement parametro;
            String query="INSERT INTO marcas (marca) VALUES (?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getMarca());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex){
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
    
     public int modificar(){
        int retorno = 0;
        try {
            cn = new Conexion();
            PreparedStatement parametro;
            String query="UPDATE marcas SET marca=? WHERE idMarca = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,this.getMarca());
            parametro.setInt(2, this.getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex){
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
    
    public int eliminar(){
        int retorno = 0;
        try {
            cn = new Conexion();
            PreparedStatement parametro;
            String query="delete from marcas where idMarca=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, this.getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex){
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
}
