//Exerc�cio 4.3 - Aula Pr�tica N�4 - Programa��o Orientada a Objectos
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