/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.2.: Classe - Legume

*/
package Aula8;

public class Legume extends Alimento implements Vegetariano {
    private String nome;

    //CONSTRUTOR DE LEGUME
    public Legume(String nome, double proteinas, double calorias, double peso) {
        super(proteinas, calorias, peso);
        this.nome = nome;
    }

    //GETTERS E SETTERS
    public String getNome() { return this.nome; }
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
