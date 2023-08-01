package Teste;

import java.util.ArrayList;

public class Tenda implements Expositor{
	
	//variáveis da classe
	public int idNum;
	public String nome;
	public ArrayList<String> exp = new ArrayList<>();
	
	//construtor
	public Tenda(int x, String y) {
		this.idNum = x;
		this.nome = y;
	}
	
	//metodo para devolver a lista de items
	public ArrayList<String> items() {
		return exp;
	}
	
	//metodo para adicionar item
	public void addExp(String s1) {
		exp.add(s1);
	}
	
	//metodo para remover item
	public void removeExp(String s1) {
		exp.remove(s1);
	}

	
	public int getIdNum() {
		return idNum;
	}

	public void setIdNum(int idNum) {
		this.idNum = idNum;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public String toString() {
		return "Tenda [idNum=" + idNum + ", nome=" + nome + ", exp=" + exp + "]";
	}
	
	public int size() {
		return exp.size();
	}
	
}
