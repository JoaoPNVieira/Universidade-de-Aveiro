// Exercício 3.8 - Aula Prática Nº3 - Programação Orientada a Objectos 
package aula03;

import java.util.Scanner;
public class ClassGrades {

	public static void main(String[] args) {
		System.out.println("Class Grades.");
		double np=66, nt=66, fgrade=66, p = np, t = nt;
		double[][] v = new double[16][3];
		int s=0;
		
		while (s < 16) {
		
			Scanner gp = new Scanner(System.in);
			while (np > 20 || np < 0) {	
			System.out.print("Please insert the grade for the practical component:");
			np = Math.round(gp.nextDouble());
			}
		
			Scanner gt = new Scanner(System.in);
			while (nt > 20 || nt < 0) {	
			System.out.print("Please insert the grade for the Theoretical Component:");
			nt = Math.round(gt.nextDouble());
			}
		//fiquei preso num infinit loop do qual não consigo perceber onde exactamente está o erro.
			if (np >= 7.0 || nt >= 7) {
			fgrade = Math.round(((p*0.6)+(t*0.4))*10)/10D;
			} else {
			fgrade = 66;	
			
			v[s][0] = nt;
			v[s][1] = np;
			v[s][2] = fgrade;
			s++;
			
			if (s==16) {
			gp.close();gt.close();	
			}
		
			}
		} //fim do loop "for" 
		s=0;
		System.out.println("NotaT     "+"NotaT     "+"Pauta     ");
		while (s<16) {
		System.out.println(v[s][0] + v[s][1] + v[s][2]);
		s++;	
		}
	}
}
