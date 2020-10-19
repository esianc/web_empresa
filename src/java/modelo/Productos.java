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
public class Productos {
    private String producto,descripcion,imagen,fecha_ingreso;
    private double pcosto,pventa;
    private int idMarca, existencia, idProducto;
    private Conexion cn;

    public Productos() {}

    public Productos(String producto, String descripcion, String imagen, String fecha_ingreso, double pcosto, double pventa, int idMarca, int existencia, int idProducto) {
        this.producto = producto;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.fecha_ingreso = fecha_ingreso;
        this.pcosto = pcosto;
        this.pventa = pventa;
        this.idMarca = idMarca;
        this.existencia = existencia;
        this.idProducto = idProducto;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public double getPcosto() {
        return pcosto;
    }

    public void setPcosto(double pcosto) {
        this.pcosto = pcosto;
    }

    public double getPventa() {
        return pventa;
    }

    public void setPventa(double pventa) {
        this.pventa = pventa;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
                String query="SELECT p.idProducto as id, p.producto, m.marca,p.descripcion,p.imagen,p.precio_costo,p.precio_venta,p.existencia,p.fecha_ingreso,m.idMarca FROM productos as p INNER JOIN marcas as m ON p.idMarca=m.idMarca ORDER BY id;";
                ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
                String encabezado[] = {"ID","Codigo","Marca","Descripcion","Imagen","Precio Costo","Precio Venta","Existencia","Fecha Ingreso","Id Marca"};
                tabla.setColumnIdentifiers(encabezado);
                String datos[] = new String[10];
                while (consulta.next()){
                    datos[0] = consulta.getString("id");
                    datos[1] = consulta.getString("producto");
                    datos[2] = consulta.getString("marca");
                    datos[3] = consulta.getString("descripcion");
                    datos[4] = consulta.getString("imagen");
                    datos[5] = consulta.getString("precio_costo");
                    datos[6] = consulta.getString("precio_venta");
                    datos[7] = consulta.getString("existencia");
                    datos[8] = consulta.getString("fecha_ingreso");
                    datos[9] = consulta.getString("idMarca");
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
            String query="INSERT INTO productos (producto,idMarca,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso) VALUES (?,?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,this.getProducto());
            parametro.setInt(2, this.getIdMarca());
            parametro.setString(3, this.getDescripcion());
            parametro.setString(4, this.getImagen());
            parametro.setDouble(5, this.getPcosto());
            parametro.setDouble(6, this.getPventa());
            parametro.setInt(7, this.getExistencia());
            parametro.setString(8, this.getFecha_ingreso());
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
            String query="UPDATE productos SET producto=?,idMarca=?,descripcion=?,imagen=?,precio_costo=?,precio_venta=?,existencia=?,fecha_ingreso=? WHERE idProducto=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getProducto());
            parametro.setInt(2, this.getIdMarca());
            parametro.setString(3, this.getDescripcion());
            parametro.setString(4, this.getImagen());
            parametro.setDouble(5, this.getPcosto());
            parametro.setDouble(6, this.getPventa());
            parametro.setInt(7, this.getExistencia());
            parametro.setString(8, this.getFecha_ingreso());
            parametro.setInt(9, this.getIdProducto());
            
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
            String query="delete from productos where idProducto=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, this.getIdProducto());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex){
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }    
    
    
}
