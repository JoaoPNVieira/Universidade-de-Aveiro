/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.2.: Classe - Alimento

*/

package Aula8;

public class Alimento {

	private double proteinas, calorias;	// Unidades: por cada 100 gramas (100g)
	private double peso; //Unidades: gramas (g)
	
    //CONSTRUTOR DE ALIMENTO
	public Alimento(double proteinas, double calorias, double peso) {
		this.proteinas = proteinas;	
		this.calorias = calorias;
		this.peso = peso;
	}
	
    //GETTERS E SETTERS
	public double getCalorias()     { return calorias * peso/100; }
	public double getProteinas()    { return calorias * peso/100; }
	public double getPeso()         { return peso; }
	
    //toString
	public String toString(){
        return "Calorías: " + calorias + ", Proteinas: " + proteinas + ", Peso: " + peso + " }";
	}
}
