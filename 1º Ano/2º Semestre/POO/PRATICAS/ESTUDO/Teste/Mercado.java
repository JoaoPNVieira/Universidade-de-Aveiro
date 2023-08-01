package Teste;

import java.util.HashSet;
import java.util.ArrayList;

public class Mercado {

	public int i = 0;
	private String nome;
	private String endereço;
	private HashSet<Tenda> tendas = new HashSet<>();
	
	public Mercado(String x, String y) {
		this.nome = x;
		this.endereço = y;
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

	public String getEndereço() {
		return endereço;
	}

	public void setEndereço(String endereço) {
		this.endereço = endereço;
	}

	@Override
	public String toString() {
		return "Mercado [nome=" + nome + ", endereço=" + endereço + ", tendas=" + tendas + "]";
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
