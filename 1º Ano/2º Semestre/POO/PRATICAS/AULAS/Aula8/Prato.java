/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.2.: Classe - Prato

*/

package Aula8;

import java.util.HashSet;
import java.util.Set;

public class Prato {
    private double cal; //Calorias do prato
    private String nome;
    private Set<Alimento> comp = new HashSet<>(); //Composição do prato
	
    //CONSTRUTOR DE PRATO
	public Prato(String nome) {	
        this.nome = nome; 
    }

    //PRATO - GETTERS
    public double getCalorias() { return this.cal; }
    public String getNome() { return this.nome; }
    public Set<Alimento> getComp() { return this.comp; }
    
    //PRATO - SETTERS
    public void setCalorias(double calorias) { this.cal = calorias; }
    public void setNome(String nome) { this.nome = nome; }
    public void setComp(Set<Alimento> comp) { this.comp = comp; }
	
    //toString
    @Override
    public String toString() {return getNome() + ", composto por " + getComp();}

    //METODO ADD INGREDIENTE
	public boolean addIngrediente(Alimento a) {
		boolean i; 
        i = comp.add(a);
		if(i){ cal+= a.getCalorias(); }
		return i;
	}
	
	public double totalCalorias() {	return cal; }

}

