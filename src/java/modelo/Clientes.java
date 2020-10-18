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
public class Clientes {
    private String nombres,apellidos,nit,genero,telefono,correo_electronico;
    private int id;
    private Conexion cn;
    public Clientes() {}

    public Clientes(String nombres, String apellidos, String nit, String genero, String telefono, String correo_electronico, int id) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.nit = nit;
        this.genero = genero;
        this.telefono = telefono;
        this.correo_electronico = correo_electronico;
        this.id = id;
    }
     
    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo_electronico() {
        return correo_electronico;
    }

    public void setCorreo_electronico(String correo_electronico) {
        this.correo_electronico = correo_electronico;
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
                String query="SELECT idCliente as id,nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso FROM clientes;";
                ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
                String encabezado[] = {"ID","Nombres","Apellidos","NIT","Genero","Telefono","Correo","Fecha Ingreso"};
                tabla.setColumnIdentifiers(encabezado);
                String datos[] = new String[8];
                while (consulta.next()){
                    datos[0] = consulta.getString("id");
                    datos[1] = consulta.getString("nombres");
                    datos[2] = consulta.getString("apellidos");
                    datos[3] = consulta.getString("nit");
                    datos[4] = consulta.getString("genero");
                    datos[5] = consulta.getString("telefono");
                    datos[6] = consulta.getString("correo_electronico");
                    datos[7] = consulta.getString("fechaingreso");
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
            String query="INSERT INTO clientes (nombres,apellidos,nit,genero,telefono,correo_electronico) VALUES (?,?,?,b"+"'"+"?"+"'"+",?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getNombres());
            parametro.setString(2, this.getApellidos());
            parametro.setString(3, this.getNit());
            parametro.setString(4, this.getGenero());
            parametro.setString(5, this.getTelefono());
            parametro.setString(6, this.getCorreo_electronico());
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
            String query="UPDATE clientes SET nombres=?,apellidos=?,nit=?,genero=?,telefono=?,correo_electronico=? WHERE idCliente=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getNombres());
            parametro.setString(2, this.getApellidos());
            parametro.setString(3, this.getNit());
            parametro.setString(4, this.getGenero());
            parametro.setString(5, this.getTelefono());
            parametro.setString(6, this.getCorreo_electronico());
            parametro.setInt(7, this.getId());
            
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
            String query="delete from clientes where idCliente=?;";
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
