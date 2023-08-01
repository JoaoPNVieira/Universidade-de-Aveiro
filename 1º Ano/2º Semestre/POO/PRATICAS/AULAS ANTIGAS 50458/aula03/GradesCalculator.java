// Exercício 3.1 - Aula Prática Nº3 - Programação Orientada a Objectos 
package aula03;

import java.util.Scanner;
public class GradesCalculator {

	public static void main(String[] args) {
		System.out.println("Wellcome to the Grades Calculator!");
			double notaP, notaT, notaF;
			Scanner gp = new Scanner(System.in);
				System.out.print("Please insert the grade for the practical component:");
				notaP = Math.round(gp.nextDouble());
			Scanner gt = new Scanner(System.in);
				System.out.print("Please insert the grade for the Theoretical Component:");
				notaT = Math.round(gt.nextDouble());
		
		if (notaP > 20 || notaP < 0 || notaT > 20 || notaT <0) {
		System.out.print("Error: Grades cannot be lower then 0 or higher then 20."); 
			}
		else if (notaP >= 7.0 || notaT >= 7) {
			notaF = Math.round(((notaP*0.6)+(notaT*0.4))*10)/10D;
					if (notaF < 9.5) {
					System.out.print("Raprovado: " + notaF);
					} else {
					System.out.print("Aprovado: " + notaF);
			}
		} else {
			int notaFr = 66;
			System.out.print("Reprovado: " + notaFr);
		}
gp.close();gt.close();	
	}
}
