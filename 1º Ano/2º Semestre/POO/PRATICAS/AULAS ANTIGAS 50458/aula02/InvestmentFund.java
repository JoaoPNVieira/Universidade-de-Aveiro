// Exercício 2.4 - Aula Prática Nº2 - Programação Orientada a Objectos 
package aula02;

import java.util.Scanner;

public class InvestmentFund {
	public static void main(String[] args) {
		System.out.println("Wellcome to the Investment Fund Calculator");
		double inv, rate;
			Scanner i = new Scanner (System.in);
				System.out.print("How much money will you be investing?: ");
				inv = i.nextDouble();
			Scanner r = new Scanner (System.in);
				System.out.print("Input the percentage of your interest rate: ");
				rate = r.nextDouble();
				rate = rate / 100;
				
		int month, t;
			Scanner m = new Scanner (System.in);
				System.out.print("How long will your investment last? (in months): ");
				month = m.nextInt();
		t = 0;
		while (t < month) {
			inv = inv + (inv * rate);
			t++;
		}
		System.out.print("Total balance obtained:" + inv + " in " + month + " months");
	i.close(); r.close(); m.close();
	}
}
