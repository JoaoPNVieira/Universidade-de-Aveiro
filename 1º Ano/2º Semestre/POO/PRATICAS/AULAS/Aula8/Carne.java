/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.2.: Classe - Carne

*/


package Aula8;

public class Carne extends Alimento {
	private VariedadeDeCarne variedade;

    //CONSTRUTOR DE CARNE
	public Carne(VariedadeDeCarne variedade, double proteinas, double calorias, double peso) {
		super(proteinas, calorias, peso);
		this.variedade = variedade;
	}

	//GETTERS E SETTERS
	public VariedadeDeCarne getVariedade() { return this.variedade; }
	public void setVariedade(VariedadeDeCarne variedade) { this.variedade = variedade; }

    //toString
	@Override
	public String toString() {
		return "{ " + getVariedade() + ": " +super.toString();
	}
	
}