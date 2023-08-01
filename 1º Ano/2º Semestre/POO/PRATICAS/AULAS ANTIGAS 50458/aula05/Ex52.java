package aula05;

import java.util.ArrayList;
import java.util.Scanner;
public class Ex52 {
	
	public static void main(String[] args) {
		//CONJUNTO DE LIVROS 
		Book catalog [] = new Book[10]; 
		catalog[0] = new Book("Java 8", "CONDICIONAL");
		catalog[1] = new Book("POO in Java 8");
		catalog[2] = new Book("Java for dummies", "NORMAL");
		System.out.println("ID = " + catalog[1].getId() + ", " + catalog[1].getTitle());
		catalog[2].setLoanType("CONDICIONAL");
	
		for (int i = 0; i < catalog.length; i++) {
			if (catalog[i] != null) {
				System.out.println(catalog[i]);
			}
		}
	
	
		//CONJUNTO DE ALUNOS
		ArrayList<User> students = new ArrayList<>();
		students.add(new User("Catarina Marques", 80232, "MIEGI"));
		students.add(new User("Joao Silva", 90123, "LEI"));
		students.get(1).setnMec(80123);
	
		for (User u : students) {
			System.out.println(u);
		}
	}
}