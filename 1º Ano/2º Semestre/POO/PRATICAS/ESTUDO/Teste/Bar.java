package Teste;

import java.util.ArrayList;
import java.util.List;

public class Bar extends Tenda{

	public List<Bebida> stock = new ArrayList<>();
	
	public Bar(int idNum, String nome, List<Bebida> x) {
		super(idNum, nome);
		this.stock  = x;
	}
	
	public int totalProdutos() {
		return stock.size();
	}
	
	public List<Bebida> getLista(){
		return stock;
	}
	
	public Bar(int idNum, String nome) {
		super(idNum, nome);
	}
	
	public void add(Bebida b1) {
		stock.add(b1);
	}
	public void remove(Bebida b1) {
		stock.remove(b1);
	}

	@Override
	public ArrayList<String> items() {
		ArrayList<String> copyList = new ArrayList<String>();
		for(Bebida a : stock) {
			copyList.add(a.toString());
		}
		return copyList;
	}

	@Override
	public String toString() {
		return "Bar [stock=" + stock + ", idNum=" + idNum + ", nome=" + nome + ", exp=" + exp + "]";
	}
	
	public int size() {
		return stock.size();
	}
	
}
