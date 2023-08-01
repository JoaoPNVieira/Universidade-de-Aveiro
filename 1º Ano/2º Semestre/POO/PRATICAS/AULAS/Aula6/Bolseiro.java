package Aula6;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº6 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 6.1.:
*/

public class Bolseiro extends Aluno {	
	int Bolsa;	
    //CONSTRUTORES
	public Bolseiro(String nome, int cc, Data dataNasc, Data iDataInsc, int Bolsa) {
		super(nome, cc, dataNasc, iDataInsc);
		this.Bolsa = Bolsa; 
    }
	public Bolseiro(String nome, int cc, Data dataNasc) {
		super(nome, cc, dataNasc); 
    }

	//GETTER & SETTER
	public int getBolsa() { return Bolsa; }

	public void setBolsa(int Bolsa) { this.Bolsa = Bolsa; }

	//METODO toString()
	public String toString() {
		return "valorBolsa=" + Bolsa + ", Data de Inscrição=" + getiDataInsc() + ", nMec =" + getnMec()
				+ ", Nome =" + getNome() + ", Cc =" + getCc() + ", Data de Nascimento=" + getDataNasc();
	}
    
    //HASHCODE & EQUALS
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Bolsa;
		return result;
	}

	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Bolseiro other = (Bolseiro) obj;
		if (Bolsa != other.Bolsa)
			return false;
		return true;
	}
}
