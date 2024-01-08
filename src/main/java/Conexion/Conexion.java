/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author pepe_
 */
public class Conexion {
    
    private static Connection conn;
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String USER = "prueba";
    private static final String PASS = "prueba";
    private static final String DB = "Jose_Eduardo_Vado_Robles";
    private static final String URL = "jdbc:mysql://192.168.0.126:3306/"+DB+"";
    
    public Conexion(){
        conn = null;
        try{
            Class.forName(DRIVER);
            
            conn = DriverManager.getConnection(URL, USER, PASS);
            
            // Conexion?
            if(conn != null)
                System.out.println("Conexión establecida exitosamente");
        }catch (ClassNotFoundException | SQLException ex){
            System.out.println("Conexión Fallida:\n\n"+ex);
        }
    }
    
    public Connection getConnection(){
        return conn;
    }
}
