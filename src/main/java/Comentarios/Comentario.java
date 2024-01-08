package Comentarios;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author pepe_
 */

import java.util.ArrayList;
import java.util.List;

public class Comentario {
    int idComentario;
    String fechaComentario;
    String comentario;
    int padreID;
    String nombre;
    String apePaterno;
    String apeMaterno;
    boolean esInterno;
            
    List<Comentario> hijos;

    public Comentario(int idComentario, String fechaComentario, String comentario, int padreID, String nombre, String apePaterno, String apeMaterno, boolean esInterno) {
        this.idComentario = idComentario;
        this.fechaComentario = fechaComentario;
        this.comentario = comentario;
        this.padreID = padreID;
        this.nombre = nombre;
        this.apePaterno = apePaterno;
        this.apeMaterno = apeMaterno;
        this.esInterno = esInterno;
        this.hijos = new ArrayList<>();
    }

    public int getIdComentario() {
        return idComentario;
    }

    public String getFechaComentario() {
        return fechaComentario;
    }

    public String getComentario() {
        return comentario;
    }

    public int getPadreID() {
        return padreID;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApePaterno() {
        return apePaterno;
    }

    public String getApeMaterno() {
        return apeMaterno;
    }

    public String esInterno() {
        return esInterno?"Trabajador Interno":"Trabajador Externo";
    }

    public List<Comentario> getHijos() {
        return hijos;
    }
    
    public void addHijo(Comentario hijo) {
        this.hijos.add(hijo);
    }
    

    
}
