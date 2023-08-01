/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.2.: Classe - Prato Dieta

*/

package Aula8;

public class PratoDieta extends Prato {
	private double maxCal;
	
    //CONSTRUTOR PRATO DIETA
    public PratoDieta(String nome) {
        super(nome);
    }
	
    //METODO ADD INGREDIENTE
	public boolean addIngrediente(Alimento a) {
		if (a.getCalorias() + totalCalorias() <= maxCal)
			return true;
		else
			return false;
	}

}
