package Aula4;

import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 4.1.:
->  Construa um programa que leia uma String (uma palavra, frase ou parágrafo) e que apresente,
    usando exclusivamente métodos da classe String:
        • uma nova frase, convertida para minúsculas;
        • o último carater da frase;
        • os 3 primeiros carateres.
        • Utilize ainda outros métodos da classe String (no mínimo, mais três) e verifique o seu
        resultado no programa
*/

public class Ex4_1 {
    public static void main(String[] args){
        
        //DECLARAÇÃO DE VARIÀVEIS
        String input;  

        //OBTER: STRING PARA PROGRAMA - USER INPUT
        Scanner in = new Scanner(System.in); 
        System.out.print("Insira uma palavra, frase ou paragrafo: ");
        input = in.nextLine();

        //OBTER: INPUT EM MAIUSCULAS
        System.out.printf("\n CONVERSÃO: Letras Maiúsculas: " , input.toUpperCase());

        //OBTER: ULTIMO CHARACTER DO INPUT
        System.out.printf("\n DISPLAY: O ultimo caracter: %s \n", input.substring(input.length() - 1));

        //OBTER: 3 PRIMEIROS CHARACTERS
        System.out.printf("\n DISPLAY: Os 3 primeiros characteres são: ", input.substring(0,3));

        //OBTER: CADA CHARACTER SEPARADO (VIRGULA)
		System.out.print("\n CONVERSÃO: Cada caracter separado por virgulas: ");
		for (int i=0; i < input.length(); i++ ) {
			System.out.printf("%s, ", input.charAt(i));
		}
		
		//OBTER: VERIFICAÇÃO SE TEM DIGITOS
		int digit = 0;
		for(int i = 0; i < input.length(); i++) {
			if(String.valueOf(input.charAt(i)).matches("\\d")){
				digit++;
			}
		}
		if(digit!= 0) {
			System.out.printf("\n CONTAGEM: %d  digitos", digit);
		}
		else {
			System.out.println("\n CONTAGEM: A string não tem digitos!");
		}
		
		//OBTER: CONVERTER INPUT COM MAIUSCULAS E MINUSCULAS (ALTERNADO)
		String caracter, finalIn;
		finalIn = "";
		for (int i = 0; i < input.length(); i++ ) {
			if(i%2==0) {
				caracter = String.valueOf(input.charAt(i));
				caracter = caracter.toUpperCase();
				finalIn = finalIn.concat(caracter);
			}
			else {
				caracter = String.valueOf(input.charAt(i));
				caracter = caracter.toLowerCase();
				finalIn = finalIn.concat(caracter);
			}
		}
		System.out.printf("\n CONVERSÃO: Caracteres alternados (Maiusculas/minusculas): %s", finalIn);
		
        in.close();
	}
}
