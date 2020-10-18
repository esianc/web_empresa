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
public class Proveedores {
    private String proveedor,nit,direccion,telefono;
    private int id;
    private Conexion cn;
    public Proveedores() {}

    public Proveedores(String proveedor, String nit, String direccion, String telefono, int id) {
        this.proveedor = proveedor;
        this.nit = nit;
        this.direccion = direccion;
        this.telefono = telefono;
        this.id = id;
    }
    

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
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
                String query="SELECT idProveedor as id,nit,proveedor,direccion,telefono FROM proveedores;";
                ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
                String encabezado[] = {"id","nit","proveedor","direccion","telefono"};
                tabla.setColumnIdentifiers(encabezado);
                String datos[] = new String[4];
                while (consulta.next()){
                    datos[0] = consulta.getString("id");
                    datos[1] = consulta.getString("nit");
                    datos[2] = consulta.getString("proveedor");
                    datos[3] = consulta.getString("direccion");
                    datos[4] = consulta.getString("telefono");
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
            String query="INSERT INTO puestos (puesto) VALUES (?);";
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
    
     public int modificar(){
        int retorno = 0;
        try {
            cn = new Conexion();
            PreparedStatement parametro;
            String query="UPDATE puestos SET puesto=? WHERE idPuesto=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,this.getProveedor());
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
            String query="delete from puestos where idPuesto=?;";
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
