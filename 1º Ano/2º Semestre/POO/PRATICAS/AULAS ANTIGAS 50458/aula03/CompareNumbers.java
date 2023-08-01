// Exercício 3.4 - Aula Prática Nº3 - Programação Orientada a Objectos 
package aula03;

import java.util.Scanner;
public class CompareNumbers {

	public static void main(String[] args) {
		Scanner n = new Scanner(System.in);
		System.out.print("Please insert how many number you wish to compare:");
		int q = n.nextInt();
		double[] v = new double[q]; 
		int vq = q-1; 
				
	while (vq != -1) {
		Scanner a = new Scanner(System.in);
		System.out.print("Insert Number:");
		double number = a.nextDouble(); 
		v[vq] = number;
		--vq;
		if (vq < 0) {
			v[0] = v[q-1];
			a.close();
		}
	}
/* Não estou a conseguir implementar um código para escolha de máximo e minimo 
 * pois classes Math do java, como Math.max() ou Math.min(), não funcionam para 
 * um numero quase ilimitado de valores do tipo int[], float[] ou double[] que 
 * se encontram dentro de vectores. 
 */
		System.out.print("Highest Number:" + Math.max(v[0],v[1],v[3],v[4]));
		System.out.print("Lowest Number:" + Math.min(v[0],v[1],v[3],v[4]));
		System.out.print("Numbers chosen in total:" + q);
n.close();
	}
}