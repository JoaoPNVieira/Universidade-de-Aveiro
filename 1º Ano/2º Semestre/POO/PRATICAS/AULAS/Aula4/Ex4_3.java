package Aula4;

import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 4.2.:
->  Escreva um programa que leia do teclado uma frase e que apresente o seu acrónimo.
    Considere que as iniciais de palavras com dimensão inferior a 3 caracteres não farão parte do
    acrónimo. Exemplo de utilização:
*/

public class Ex4_3 {
    public static void main(String[] args){
        //DECLARAR VARIÀVEIS
		String teste;

        //OBTER FRASE
		Scanner sc = new Scanner(System.in);
		System.out.println("Insira uma frase: ");
		teste = sc.nextLine();
		
		//OBTER: SERARAR A FRASE EM PALAVRAS
		String[] arr = teste.split("\\s");
		int len = arr.length;
		
		//OBTER: Frase composta apenas por caracteres maiusculos da primeira letra de cada palavra (3 ou mais caracteres - evitar de, da, do etc...)
		String fraseFinal = "";
		for(int i = 0; i < len; i++) {
			if(arr[i].length() > 2) {
				fraseFinal = fraseFinal.concat((String.valueOf(arr[i].charAt(0))).toUpperCase());
			}
		}
		
		//DISPLAY DE RESULTADOS
		System.out.println(fraseFinal);

        sc.close();
    }
}