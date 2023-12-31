package Teste;

import java.util.HashSet;
import java.util.ArrayList;

public class Mercado {

	public int i = 0;
	private String nome;
	private String enderešo;
	private HashSet<Tenda> tendas = new HashSet<>();
	
	public Mercado(String x, String y) {
		this.nome = x;
		this.enderešo = y;
	}
	
	public void add(Tenda t1) {
		tendas.add(t1);
	}
	
	public void remove(Tenda t1) {
		tendas.remove(t1);
	}
	
	public HashSet<Tenda> tendas(){
		return tendas;
	}
	
	public int totalItems() {
		for(Tenda a : tendas) {
			i += a.size();
		}
		return i;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEnderešo() {
		return enderešo;
	}

	public void setEnderešo(String enderešo) {
		this.enderešo = enderešo;
	}

	@Override
	public String toString() {
		return "Mercado [nome=" + nome + ", enderešo=" + enderešo + ", tendas=" + tendas + "]";
	}
	
	public ArrayList<String> getAllItems(){
		ArrayList<String> iii = new ArrayList<>();
		for(Tenda t1 : tendas) {
			for(String z: t1.items()) {
				iii.add(z);
			}
		}
		return iii;
	}
	
}
