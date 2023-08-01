package Aula3;

import java.util.InputMismatchException;
import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 3.3.:
->  Escreva um programa que leia do teclado um número inteiro positivo e determine se o
    número introduzido é um número primo. Um número natural é um número primo quando
    tem exatamente dois divisores naturais distintos: o número 1 e ele mesmo. Repare que deve 
    validar o valor de entrada repetindo a leitura se o valor não for válido (positivo).
*/

public class Ex3_3 {
    public static void main(String[] args){
		System.out.println("TESTE: Este número é Primo? ");
	
        //DEFINIR VARIÀVEIS
		int numb, r = 1;
		double divNumb;
		

	while(r==1){
		try {
			//VALOR DE ENTRADA			
			Scanner sc = new Scanner(System.in);
			System.out.print("Número que quer testar: ");
			numb = sc.nextInt();
			divNumb = numb / 2 ;
			
			if(numb <= 0) {
				System.out.println("O número a testar deve ser maior do que zero! Tente novamente. \n");
			} 
			else if(numb == 1 || numb == 2) {
				System.out.println(numb + ": é um número primo"); 
				r=0; sc.close();
			}
			else if(numb % (int)divNumb == 0) {
					System.out.println(numb + ": não é um número primo.");
					r=0; sc.close();
			}
			else {
				System.out.println(numb + ": é um número primo");
				r=0; sc.close();
			}
		} 
		catch(InputMismatchException e) {
			System.out.println("Valor introduzido não é número válido! Tente novamente \n");
		}
	}
}}
