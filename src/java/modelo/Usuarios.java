/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Erick
 */
public class Usuarios {
    private String nombre,pass,apellido,usuario;
    private Conexion cn;
    
    public Usuarios() {}

    public Usuarios(String nombre, String pass, String apellido, String usuario) {
        this.nombre = nombre;
        this.pass = pass;
        this.apellido = apellido;
        this.usuario = usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
                String query="SELECT p.idProducto as id,producto,p.descripcion,m.marca,p.existencia,p.precio_costo,p.precio_venta,m.id_marca FROM productos as p inner join marcas as m on p.id_marca=m.id_marca order by p.idProducto;";
                ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
                String encabezado[] = {"ID","Codigo","Descripcion","Marca","Existencia","Precio Costo","PrecioVenta","ID Marca"};
                tabla.setColumnIdentifiers(encabezado);
                String datos[] = new String[8];
                while (consulta.next()){
                    datos[0] = consulta.getString("id");
                    datos[1] = consulta.getString("producto");
                    datos[2] = consulta.getString("descripcion");
                    datos[3] = consulta.getString("marca");
                    datos[4] = consulta.getString("existencia");
                    datos[5] = consulta.getString("precio_costo");
                    datos[6] = consulta.getString("precio_venta");
                    datos[7] = consulta.getString("id_marca");
                    tabla.addRow(datos);
                }
            cn.cerrar_conexion();
        } catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return tabla;
    }
    
    
}
