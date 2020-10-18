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
public class Empleado {
    private String nombres,apellidos,direccion,telefono,dpi,genero,fnacimiento,finicio_labores;
    private int id_puesto, id;
    private Conexion cn;
    public Empleado() {}

    public Empleado(String nombres, String apellidos, String direccion, String telefono, String dpi, String genero, String fnacimiento, String finicio_labores, int id_puesto, int id) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.telefono = telefono;
        this.dpi = dpi;
        this.genero = genero;
        this.fnacimiento = fnacimiento;
        this.finicio_labores = finicio_labores;
        this.id_puesto = id_puesto;
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

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFnacimiento() {
        return fnacimiento;
    }

    public void setFnacimiento(String fnacimiento) {
        this.fnacimiento = fnacimiento;
    }

    public String getFinicio_labores() {
        return finicio_labores;
    }

    public void setFinicio_labores(String finicio_labores) {
        this.finicio_labores = finicio_labores;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
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
                String query="SELECT e.idEmpleado AS id,e.nombres,e.apellidos,e.direccion,e.telefono,e.dpi,e.genero,e.fecha_nacimiento,p.puesto,e.fecha_inicio_labores,e.fechaingreso,p.idPuesto FROM empleados AS e INNER JOIN puestos AS p on e.idPuesto=p.idPuesto;";
                ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
                String encabezado[] = {"ID","Nombres","Apellidos","Direccion","Telefono","dpi","Genero","Fnacimiento","Puesto","Finicio_labores","Fingreso","idPuesto"};
                tabla.setColumnIdentifiers(encabezado);
                String datos[] = new String[12];
                while (consulta.next()){
                    datos[0] = consulta.getString("id");
                    datos[1] = consulta.getString("nombres");
                    datos[2] = consulta.getString("apellidos");
                    datos[3] = consulta.getString("direccion");
                    datos[4] = consulta.getString("telefono");
                    datos[5] = consulta.getString("dpi");
                    datos[6] = consulta.getString("genero");
                    datos[7] = consulta.getString("fecha_nacimiento");
                    datos[8] = consulta.getString("puesto");
                    datos[9] = consulta.getString("fecha_inicio_labores");
                    datos[10] = consulta.getString("fechaingreso");
                    datos[11] = consulta.getString("idPuesto");
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
            String query="INSERT INTO empleados (nombres,apellidos,direccion,telefono,dpi,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores) VALUES (?,?,?,?,?,b"+"'"+"?"+"'"+",?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,this.getNombres());
            parametro.setString(2, this.getApellidos());
            parametro.setString(3, this.getDireccion());
            parametro.setString(4, this.getTelefono());
            parametro.setString(5, this.getDpi());
            parametro.setString(6, this.getGenero());
            parametro.setString(7, this.getFnacimiento());
            parametro.setInt(8, this.getId_puesto());
            parametro.setString(9, this.getFinicio_labores());
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
            String query="UPDATE empleados SET nombres=?,apellidos=?,direccion=?,telefono=?,dpi=?,genero=b"+"'"+"?"+"'"+",fecha_nacimiento=?,idPuesto=?,fecha_inicio_labores=? WHERE idEmpleado=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getNombres());
            parametro.setString(2, this.getApellidos());
            parametro.setString(3, this.getDireccion());
            parametro.setString(4, this.getTelefono());
            parametro.setString(5, this.getDpi());
            parametro.setString(6, this.getGenero());
            parametro.setString(7, this.getFnacimiento());
            parametro.setInt(8, this.getId_puesto());
            parametro.setString(9, this.getFinicio_labores());
            parametro.setInt(10, this.getId());
            
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
            String query="delete from empleados where idEmpleado=?;";
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