// Exercício 3.5 - Aula Prática Nº3 - Programação Orientada a Objectos 
package aula03;

import java.util.Scanner;

public class InvestmentFundAula3 {

	public static void main(String[] args) {
		System.out.println("Welcome to the Investment Fund!");
		System.out.println("Your Invested ammount must be made in 1000 bills.");
		
		double inv=2;
		Scanner a = new Scanner (System.in);
		while (inv%1000 != 0) {
			System.out.print("Invested Ammout:");
			inv = a.nextDouble();
		}
		double rate=6; 
		int i=0, m=12;
		Scanner r = new Scanner (System.in);
		while (rate < 0 || rate > 5) {
			System.out.print("Insert a interest rate between 0% and 5%:");
			rate = r.nextInt();
			}
		rate = (rate/100);
		double[] invMonth = new double[m];
		while (i<m) {
			inv = Math.round((inv+(inv*rate))*100)/100D;
			invMonth[i] = inv;
			i++;
			System.out.println("Month:" + i + " | Current Investment Value" + invMonth[i-1]);
		}
a.close(); r.close(); 
	}
}