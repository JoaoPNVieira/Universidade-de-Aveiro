// Exercício 3.6 - Aula Prática Nº3 - Programação Orientada a Objectos
package aula03;

import java.util.Scanner;
public class HowManyDays {

	public static void main(String[] args) {
		int days = 0, month = 13, year;
		Scanner m = new Scanner(System.in);
		while (month<=0 || 12/month < 1) {
			System.out.print("Input month number:");
			month = m.nextInt();
		}
			Scanner y = new Scanner(System.in);
			System.out.print("Input year:");
			year = y.nextInt();
			String name = new String();
			
		switch (month) {
		case 1:
			name = "January"; days = 31; break;
		case 2:
			name = "February"; days= 28; break;
		case 3:
			name = "March"; days = 31; break;
		case 4:
			name = "April"; days = 30; break;
		case 5:
			name = "May"; days = 31; break;
		case 6:
			name = "June"; days = 30; break;
		case 7:
			name = "July"; days = 31; break;
		case 8:
			name = "August"; days = 31;	break;
		case 9:
			name = "September"; days = 30; break;
		case 10:
			name = "October"; days = 31; break;			
		case 11:
			name = "November"; days = 30; break;
		case 12:
			name = "December"; days = 31; break;		
		}

		if((year%400 == 0) || ((year%4 == 0) && (year%100 != 0))) {
				if (month==2) {
					days = 29;	
				}
			System.out.print(name+ " of " +year+ " has " +days+ "days.| " +year+ " is a leap year.");
		} else {
			System.out.print(name+ " of " +year+ " has " +days+ "days.| " +year+ " is not a leap year." );
		}

//Fim
m.close();y.close();
	}
}