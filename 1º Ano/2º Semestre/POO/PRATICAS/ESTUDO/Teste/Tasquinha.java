package Teste;

import java.util.ArrayList;
import java.util.HashSet;

public class Tasquinha extends Tenda {

private HashSet<String> menu = new HashSet<>();
	
	public Tasquinha(int idNum, String nome, String[] x) {
		super(idNum, nome);
		for(String a:x) {
			menu.add(a);
		}
	}
	
	public Tasquinha(int idNum, String nome) {
		super(idNum, nome);
	}
	
	public void addPrato(String s1) {
		menu.add(s1);
	}

	
	
	public ArrayList<String> items() {
		ArrayList<String> copyList = new ArrayList<String>();
		copyList.addAll(menu);
		return copyList;
	}

	@Override
	public String toString() {
		return "Tasquinha [menu=" + menu + ", idNum=" + idNum + ", nome=" + nome + ", exp=" + exp + "]";
	}
	
	public int size() {
		return menu.size();
	}
}
