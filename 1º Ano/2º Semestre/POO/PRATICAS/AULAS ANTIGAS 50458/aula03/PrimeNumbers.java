// Exercício 3.3 - Aula Prática Nº3 - Programação Orientada a Objectos 
package aula03;

import java.util.Scanner;
public class PrimeNumbers {

	public static void main(String[] args) {
		Scanner numb = new Scanner(System.in);
		System.out.print("Please Input your Number:");
		int p = numb.nextInt();
	
	if (p == 2 || p == 3 || p ==5) {
		System.out.print("Your number is: Prime");
	}
	else if (p%2 == 0 || p%3 == 0 || p%5 == 0) {
		System.out.print("Your number is: Not Prime");
	}
	else
		System.out.print("Your number is: Prime");
	
numb.close();		
	}
}

