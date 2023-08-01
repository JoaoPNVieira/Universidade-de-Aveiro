package Aula2;
import java.util.Scanner;

/* 
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 2.2.:
->	Escreva um programa que lê um valor real que especifica temperatura em graus Célsius,
	converte-o para graus Fahrenheit e imprime o resultado. A fórmula de conversão de graus
	Célsius (C) para graus Fahrenheit (F) é a seguinte: F = 1.8 ∗ C + 32. 
*/
public class Ex2_2{
	public static void main(String[] args) {
		//DEFINIÇÃO DE VARIAVEIS:
		String s; Double tempC, tempF; int retry = 1;

		while(retry==1){
			System.out.print("Conversor de temperatura: Celcius (ºC) para Fahrenheit (ºF). \n Insira temperatura em Cº: "); 

			Scanner in = new Scanner(System.in);
			s = in.nextLine();

			try{
				tempC = Double.valueOf(s);
				tempF = 1.8 * tempC + 32; retry = 0; 
				System.out.println(tempC + "ºC, em Fahrenheit é " + tempF); } 
			catch (NumberFormatException e) { 
				System.out.println("ERRO: Valor de entrada não é um número"); }
			
			retry = 2;
			while(retry==2) {
				System.out.print("Deseja converter novamente? (Y/N): ");
				Scanner rt = new Scanner(System.in);
				s = rt.nextLine().toUpperCase(); 
				switch(s) {
					case "N" :  retry = 0; System.out.println("Até à próxima!"); rt.close(); in.close(); break; 
					case "Y" :  retry = 1; System.out.println("Iniciando outra tentativa: "); break; 
					default  :  retry = 2; System.out.println("ERRO: Opção inválida!"); break; 
				}
			}			
		}
	}
}