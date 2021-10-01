package Modelo;
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



/**
 *
 * @author gerar
 */
public class Conexion {
    public Connection conexion_db;
    public final String db = "db_tarea_empresa";
    public final String port = "3306";
    public final String host = "127.0.0.1";
    public final String urlConexion = String.format("jdbc:mysql://%s:%s/%s",host,port,db);
    public final String user = "usr_tarea_empresa";
    public final String pass = "Empresa123";
    public final String jdbc = "com.mysql.cj.jdbc.Driver";
    
    public void abrir_conexion(){
        try{
            Class.forName(jdbc);
            conexion_db = DriverManager.getConnection(urlConexion,user,pass);
            
        }catch (HeadlessException | ClassNotFoundException | SQLException ex){
             System.out.println("Error..." + ex.getMessage());
        }
    }
    public void cerrar_conexion(){
        try{
            conexion_db.close();
        }catch(SQLException ex){
            System.out.println("Error..." + ex.getMessage());
        }
    }
    
    
    
    // public final String urlConexion = "jdbc:mysql://localhost:3306/connect_tarea_empresa);
    
}
