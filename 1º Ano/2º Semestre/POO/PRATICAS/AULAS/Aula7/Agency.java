package Aula7;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.2
*/

public class Agency {
	private static String name = "Happy Travel"; 
	private String address = "Happy Airplane Streat, 3rd Floor, 1250 Lisbon";
	
	//SETTER & GETTER
	public static String getAgencyName() { return name; }
	public String getAgencyAddress() { return address; }
	
	@Override
	public String toString() {
		return name + " - " + address; }
	

}
