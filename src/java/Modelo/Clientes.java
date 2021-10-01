/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.ResultSet;
import java.util.HashMap;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;


/**
 *
 * @author gerar
 */
public class Clientes {
    private int id;
    private String nit,nombres,apellidos,direccion,telefono,fecha_nacimiento;
    private Conexion cn;
    public Clientes(){}
    
    public Clientes(int id, String nit, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        this.id = id;
        this.nit = nit;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.telefono = telefono;
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }        
    
    
    
    public int agregar(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            
            String query = "INSERT INTO clientes (nit,nombres,apellidos,direccion,telefono,fechaNacimiento) values (?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexion_db.prepareStatement(query);
            parametro.setString(1, this.getNit());
            parametro.setString(2, this.getNombres());
            parametro.setString(3, this.getApellidos());
            parametro.setString(4, this.getDireccion());
            parametro.setString(5, this.getTelefono());
            parametro.setString(6, this.getFecha_nacimiento());
            
            retorno = parametro.executeUpdate();
            
            cn.cerrar_conexion();
            
        }
        catch(SQLException ex){
            System.out.println(ex.getMessage());
            
        }
        
        return retorno;    
    }
            public int modificar(){
                int retorno = 0;
                try{
                    PreparedStatement parametro;
                    cn = new Conexion();

                    String query = "UPDATE clientes SET nit=?,nombres=?,apellidos=?,direccion=?,telefono=?,fechaNacimiento=? WHERE id_clientes=?;";
                    cn.abrir_conexion();
                    parametro = (PreparedStatement)cn.conexion_db.prepareStatement(query);
                    parametro.setString(1, this.getNit());
                    parametro.setString(2, this.getNombres());
                    parametro.setString(3, this.getApellidos());
                    parametro.setString(4, this.getDireccion());
                    parametro.setString(5, this.getTelefono());
                    parametro.setString(6, this.getFecha_nacimiento());
                    parametro.setInt(7, this.getId());
                    
                    retorno = parametro.executeUpdate();

                    cn.cerrar_conexion();

                }
                catch(SQLException ex){
                    System.out.println(ex.getMessage());
                    
                }

                return retorno;
            
            }
            
            public int eliminar(){
            int retorno = 0;
                try{
                    PreparedStatement parametro;
                    cn = new Conexion();

                    String query = "DELETE FROM clientes WHERE id_clientes=?;";
                    cn.abrir_conexion();
                    parametro = (PreparedStatement)cn.conexion_db.prepareStatement(query);
                    parametro.setInt(1, this.getId());
                    
                    retorno = parametro.executeUpdate();

                    cn.cerrar_conexion();

                }
                catch(SQLException ex){
                    System.out.println(ex.getMessage());
                    
                }

                return retorno;
            
            
            }
            
            public DefaultTableModel mostrar(){
                DefaultTableModel tabla = new DefaultTableModel();
                try{
                    cn = new Conexion();
                    cn.abrir_conexion();
                    String query = "SELECT * FROM clientes;";
                    ResultSet consulta = cn.conexion_db.createStatement().executeQuery(query);
                    String encabezado[] = {"ID","NIT","Nombres","Apellidos","Direccion","Telefono","Fecha de Nacimiento"};
                    tabla.setColumnIdentifiers(encabezado);
                    String datos[] = new String[7];
                    while(consulta.next()){
                        datos[0] = consulta.getString("id_clientes");
                        datos[1] = consulta.getString("nit");
                        datos[2] = consulta.getString("nombres");
                        datos[3] = consulta.getString("apellidos");
                        datos[4] = consulta.getString("direccion");
                        datos[5] = consulta.getString("telefono");
                        datos[6] = consulta.getString("fechaNacimiento");
                        tabla.addRow(datos);
                        
                    }
                    
                    cn.cerrar_conexion();
                }
                catch(SQLException ex){
                    System.out.println(ex.getMessage());
                }
                
                return tabla;
            }//termina DefaultTableModel
            
            
}
