package Aula2;

import java.util.InputMismatchException;
import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 2.3.:
->  Escreva um programa que calcule a energia necessária para aquecer a água desde uma
    temperatura inicial até uma temperatura final. O programa deve ler a quantidade de água M
    (em quilogramas), e as temperaturas inicial e final da água (em graus Celsius). A fórmula para
    calcular a energia Q (em Joules) é dada por: 
    
    Q = M * (finalTemperature - initialTemperature) * 4184.
*/

public class Ex2_3 {
    public static void main(String[] args) {
		System.out.println("Calculadora de energia (Joules) necessária para aquecer X quilogramas de água."
							+ "\n Unidades de Medida: \n Temperaturas: Celcius (ºC) \n Quantidade de Água: Quilogramas (Kg).");

       	//DEFINIÇÃO DE VARIAVEIS:
		double tempI, tempF, qAgua, energia;
		int r=1; String t;

		while(r==1){
			try{

				//INPUT DE VALORES:
				Scanner in_tempI = new Scanner(System.in);
				System.out.print("Insira a temperatura inicial(Cº): ");
				tempI = in_tempI.nextDouble();
				
				Scanner in_tempF = new Scanner(System.in);
				System.out.print("Insira temperatura final(Cº): ");
				tempF = in_tempF.nextDouble();
				
				Scanner in_qAgua = new Scanner(System.in);	
				System.out.print("Insira a quantidade de agua (kg): ");
				qAgua = in_qAgua.nextDouble();					
				
				//CALCULO DE ENERGIA:
				energia = qAgua * (tempF - tempI) * 4184; r = 0;
				//DISPLAY DE RESULTADOS:
				System.out.printf(	"\n Temperatura Inicial: "+ tempI + "ºC" +
									"\n Temperatura Final: "  + tempF + "ºC" +
									"\n Quantidade de água: " + qAgua + "Kg" + 
									"\n A energia necessária é %.2f Joules.", energia);
				
				//NOVA TENTATIVA:
				System.out.print("Deseja calcular novamente a energia? (Y/N): ");
				Scanner tenta = new Scanner(System.in);
				t = tenta.nextLine().toLowerCase();
				switch(t){
				case "Y" : r = 1; break;
				case "N" : r = 0; in_qAgua.close(); in_tempI.close(); in_tempF.close(); System.out.println("Adeus, volte sempre!"); break;
				default  : r = 0; in_qAgua.close(); in_tempI.close(); in_tempF.close(); System.out.println("Input Inválido. Sistema vai fechar."); break;
				}
			} catch (InputMismatchException e) { r=1; System.out.println("ERRO 1: Um dos valores inseridos não é válido!"); }
		}
	}
}
