// Exercício 2.6 - Aula Prática Nº2 - Programação Orientada a Objectos 
package aula02;

import java.util.Scanner;

public class HoursMinSec {

	public static void main(String[] args) {
		int sec, s, m ,h;
			Scanner sc = new Scanner(System.in);
				System.out.print("How many seconds have passed?: ");
				s = sc.nextInt();
		sec = s;
		h = sec/3600;
		m = (sec%3600) / 60; 
		s = sec%60;
			System.out.print("Time:" + h + "hr" + m + "min" + s + "sec");
		sc.close();
	}

}
