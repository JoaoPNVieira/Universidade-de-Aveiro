/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.2.: Classe - Cereal

*/
package Aula8;

public class Cereal extends Alimento implements Vegetariano{
    private String nome;
	
    //CONSTRUTOR DE CEREAL
	public Cereal(String nome, double proteinas, double calorias, double peso) {
		super(proteinas, calorias, peso);
		this.nome = nome;
	}

	//GETTERS E SETTERS
	public String getNome() { return nome; }
	public void setNome(String nome) { this.nome = nome; }

	//IMPLEMENTAÇÃO DE METODOS DE INTERFACE
    @Override
    public String vegan() { return "VEGETARIANO"; }

    //toString
	@Override
	public String toString() {
		return "{ " + vegan() + getNome() + ": " + super.toString();
	}
}