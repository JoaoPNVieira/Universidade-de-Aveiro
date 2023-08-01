package Aula6;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº6 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 6.2.:
*/

public class Conjunto {
	private int[] lista = new int[10];
	private int num=0;

	//METODO CHECKSIZE
	public int[] checkSize() {
		if (num == 10) {
			final int z = lista.length;
			final int[] listab = new int[10 + z];
			for (int x=0; x<lista.length; x++) {
				listab[x]=lista[x];
			}
			lista = listab; 
			return lista;
		}
		else {
			return lista;
		}
	}
	
	//METODO CONTAINS
	public boolean contains(int n) {
		for (int x = 0; x<num; x++) {
			if (lista[x]==n) {
				return true;
			}
		}
		return false;
	}
    
    //METODO INSERT 
	public void insert(int n) {
		if (contains(n)==false) {
			lista[num] = n;
			num++;
			checkSize();
		}
	}
	
	//METODO REMOVE
	public void remove(int n) {
		if (this.contains(n)==true) {
			int var=0;
			for (int x=0; x<this.num; x++) {
				if (lista[x] == n) {
					var = x;
					break;
				}
			}
			for (int x = var; x<=this.num; x++) {
				lista[x] = lista[x+1];
			}
			this.num--;
		}
	}
	
	//METODO EMPTY
	public void empty() {
		if (this.num>0) {
			for (int x=0; x<this.num; x++) {
				lista[x] = 0;
			}
		}
		this.num=0;
	}
	
	//METODO toString()
	public String toString() {
		String s ="";
		for (int x=0; x<this.num; x++) {
			s+=Integer.toString(lista[x])+" ";
		}
		return s;
	}
	
	//METODO SIZE
	public int size() { return this.num; }
	
	//METODO UNIR
	public Conjunto unir(Conjunto add){
		Conjunto adicionado = new Conjunto();
		for (int x : add.lista) {
			adicionado.insert(x);
		}
		adicionado.remove(0);
		for (int x = 0; x<this.num; x++) {
			if (!add.contains(lista[x])) {
				adicionado.insert(lista[x]);
			}
		}
		
		return adicionado;
	}
	
	//METODO SUBTRACT 
	public Conjunto subtact(Conjunto dif) {
		Conjunto sub = new Conjunto();
		for (int x : this.lista) {
			sub.insert(x);
		}
		sub.remove(0);
		
		for (int x = 0; x<this.num; x++) {
			if (dif.contains(lista[x])){
				sub.remove(lista[x]);
			}
		}
		return sub;
	}
	
	//METODO INTERSET: permite obter os elementos que 2 conjuntos tem em comum
	public Conjunto interset(Conjunto inter) {
		Conjunto interset = new Conjunto();
		for (int x : this.lista) {
			interset.insert(x);
		}
		interset.remove(0);
		
		for (int x = 0; x<this.num; x++) {
			if (!inter.contains(lista[x])) {
				interset.remove(lista[x]);
			}
		}
		return interset;
	}
		
}