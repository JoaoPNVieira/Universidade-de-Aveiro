/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.2.: Classe - Ementa

*/

package Aula8;

import java.util.Set;
import java.util.HashSet;

public class Ementa {
	private String nome, local;
	private Set<Prato> pratos = new HashSet<>();

    //CONSTRUTOR DE EMENTA
    public Ementa(String nome, String local) {
        this.nome = nome;
        this.local = local;
    }

    //EMENTA - GETTERS
    public String getNome()         { return this.nome; }
    public String getLocal()        { return this.local; }
    public Set<Prato> getPratos()   { return this.pratos; }

    //EMENTA - SETTERS
    public void setNome(String nome)            { this.nome = nome; }
    public void setLocal(String local)          { this.local = local; }
    public void setPratos(Set<Prato> pratos)    { this.pratos = pratos; }


    //toString
    @Override
    public String toString() {
        return getNome() + getLocal() + getPratos();
    }
}
