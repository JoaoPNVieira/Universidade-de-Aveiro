// Exerc�cio 3.2 - Aula Pr�tica N�3 - Programa��o Orientada a Objectos 
package aula03;

import java.util.Scanner;
public class FinalCountDown {
	
	public static void main(String[] args) {	
		Scanner num = new Scanner(System.in);
			System.out.print("Please insert a number:");
			int n = num.nextInt();	
		while (n != 0) {
			--n;
			System.out.println(n+1);
		}
num.close();
	}
}
