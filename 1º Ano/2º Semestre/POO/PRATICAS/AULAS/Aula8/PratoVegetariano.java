/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.2.: Classe - Prato Vegetariano

*/

package Aula8;

public class PratoVegetariano extends Prato implements Vegetariano{

    //CONSTRUTOR DE PRATO VEGETARIANO
    public PratoVegetariano(String nome) {
        super(nome);
    }

    //IMPLEMENTAÇÃO METODOS DE INTERFACE VEGETARIANO
    @Override
    public String vegan() { return "VEGETARIANO"; }

    //METODO ADD INGREDIENTE
    public boolean addIngrediente(Alimento a) {
		if(a instanceof Vegetariano) {
			return super.addIngrediente(a);
        } else {
			return false;
        }
	}

    //toString
	@Override
	public String toString() {
		return "{ " + vegan() + getNome() + ", " + super.toString();

	}
}