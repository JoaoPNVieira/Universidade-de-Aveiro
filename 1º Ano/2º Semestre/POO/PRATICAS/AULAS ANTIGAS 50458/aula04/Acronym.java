//Exercício 4.3 - Aula Prática Nº4 - Programação Orientada a Objectos
package aula04;

import java.util.Scanner;

public class Acronym {

	public static void main(String[] args) {

		Scanner w = new Scanner (System.in);
		System.out.println("Enter your text:");
		String word = w.nextLine(); String acr ="";
		
		for(char c:word.toCharArray())
			if(Character.isUpperCase(c) && word.length()>3)
				acr +=c;
	
		System.out.println("Acronym:" + acr);
		
w.close();	
	}
}