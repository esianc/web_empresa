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
public class Ventas {
    private String serie,fechafactura,nit,nombres;
    private int nofactura,idEmpleado,idCliente, id;
    private Conexion cn;

    public Ventas() {}
    public Ventas(String serie, String fechafactura, String nit, String nombres, int nofactura, int idEmpleado, int idCliente, int id) {
        this.serie = serie;
        this.fechafactura = fechafactura;
        this.nit = nit;
        this.nombres = nombres;
        this.nofactura = nofactura;
        this.idEmpleado = idEmpleado;
        this.idCliente = idCliente;
        this.id = id;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getFechafactura() {
        return fechafactura;
    }

    public void setFechafactura(String fechafactura) {
        this.fechafactura = fechafactura;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public int getNofactura() {
        return nofactura;
    }

    public void setNofactura(int nofactura) {
        this.nofactura = nofactura;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
      
     public DefaultTableModel leer_cliente(){
        DefaultTableModel tbl_ventas1 = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
                String query="SELECT idCliente as id, nit, CONCAT(nombres,' ' ,apellidos) as ncompleto,telefono, correo_electronico from clientes;";
                ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
                String encabezado[] = {"Id","Nit","Nombres Completos","Telefono","Correo"};
                tbl_ventas1.setColumnIdentifiers(encabezado);
                String datos[] = new String[5];
                while (consulta.next()){
                    datos[0] = consulta.getString("id");
                    datos[1] = consulta.getString("nit");
                    datos[2] = consulta.getString("ncompleto");
                    datos[3] = consulta.getString("telefono");
                    datos[4] = consulta.getString("correo_electronico");
                    tbl_ventas1.addRow(datos);
                }
            cn.cerrar_conexion();
        } catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return tbl_ventas1;
    }
     
     public DefaultTableModel lee_prod(){
        DefaultTableModel tbl_ventas1 = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
                String query="SELECT idProducto as id, producto,descripcion,precio_venta,existencia from productos;";
                ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
                String encabezado[] = {"Id","Codigo","Descripcion","Precio","Existencia"};
                tbl_ventas1.setColumnIdentifiers(encabezado);
                String datos[] = new String[5];
                while (consulta.next()){
                    datos[0] = consulta.getString("id");
                    datos[1] = consulta.getString("producto");
                    datos[2] = consulta.getString("descripcion");
                    datos[3] = consulta.getString("precio_venta");
                    datos[4] = consulta.getString("existencia");
                    tbl_ventas1.addRow(datos);
                }
            cn.cerrar_conexion();
        } catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return tbl_ventas1;
    }
     
     public DefaultTableModel lee_empl(){
        DefaultTableModel tbl_ventas3 = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
                String query="SELECT idEmpleado as id, CONCAT(nombres,' ',apellidos) as ncompleto,direccion,telefono,fechaingreso FROM empleados;";
                ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
                String encabezado[] = {"Id","Codigo","Descripcion","Precio","Existencia"};
                tbl_ventas3.setColumnIdentifiers(encabezado);
                String datos[] = new String[5];
                while (consulta.next()){
                    datos[0] = consulta.getString("id");
                    datos[1] = consulta.getString("ncompleto");
                    datos[2] = consulta.getString("direccion");
                    datos[3] = consulta.getString("telefono");
                    datos[4] = consulta.getString("fechaingreso");
                    tbl_ventas3.addRow(datos);
                }
            cn.cerrar_conexion();
        } catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return tbl_ventas3;
    }
     
    public int ultimo(){
        int retorno = 0;
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            PreparedStatement parametro;
            String query="SELECT (idVenta + 1) as id FROM ventas ORDER BY idVenta DESC LIMIT 1;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, this.getId());
            cn.cerrar_conexion();
        } catch (SQLException ex){
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
}
