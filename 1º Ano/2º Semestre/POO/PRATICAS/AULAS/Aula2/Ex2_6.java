package Aula2;

import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 2.6.:
->  Escreva um programa que dado um tempo em segundos lido do teclado, mostre na consola o
    tempo com o formato hh:mm:ss. 
    Sugestão: para calcular o resto da divisão inteira existe o operador %.
*/


public class Ex2_6 {
    public static void main(String[] args) {
		
		//DEFINIR VARIAVEIS
		int segundosT, minutosT, horasF, minutosF, segundosF;
		
		//VALORES
		Scanner sc = new Scanner(System.in);
		System.out.print("Inserir o tempo em segundos:");
		segundosT = sc.nextInt();
		
		//CALCULO
		minutosT = segundosT / 60; 
		horasF = minutosT / 60;
		minutosF = minutosT % 60;
		segundosF = segundosT % 60;
		
		//DISPLAY VALORES
		System.out.printf(horasF + ":" + minutosF + ":" + segundosF);
		sc.close();	

	}
}
