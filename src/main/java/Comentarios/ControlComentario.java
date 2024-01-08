package Comentarios;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author pepe_
 */

public class ControlComentario {

    Comentario apoyo;
    
    public ControlComentario() {
        this.apoyo = new Comentario(0, "", "", 0, "", "", "", false);
    }
    
    public void agregar(Comentario comentario){
        agregarRec(comentario, this.apoyo);
    }
    
    public Comentario agregarRec(Comentario comentario, Comentario buscador){
        if(comentario.getPadreID() == buscador.getIdComentario()){
            buscador.addHijo(comentario);
            return comentario;
        }
        
        for(Comentario c : buscador.getHijos()){
            agregarRec(comentario,c);
        }
        
        return buscador;
    }

    public Comentario getApoyo() {
        return apoyo;
    }
    

    
    
    
    
    
}
