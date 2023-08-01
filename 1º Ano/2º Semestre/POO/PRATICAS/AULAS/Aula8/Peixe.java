/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.2.: Classe - Peixe

*/
package Aula8;

public class Peixe extends Alimento {	
	private TipoDePeixe tipo;

    //CONSTRUTOR DE PEIXE
	public Peixe(TipoDePeixe tipo, double proteinas, double calorias, double peso) {
		super(proteinas, calorias, peso);
		this.tipo = tipo;
	}

    //toString
	public String toString(){
		return "{ " + tipo + ": " +super.toString();
	}
}
