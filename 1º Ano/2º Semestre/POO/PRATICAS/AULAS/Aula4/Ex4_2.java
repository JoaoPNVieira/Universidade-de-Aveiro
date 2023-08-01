package Aula4;

import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 4.2.:
->  Construa um programa que leia uma frase. Adicionalmente, construa métodos estáticos e useos na função main, para realizar cada uma das operações seguintes:
        • conte o número de carateres numéricos (0..9) da String;
            Ex: public static int countDigits(String s){…}
        • conte quantos espaços contém;
        • indique se só contém minúsculas;
        • devolva uma String, onde todas as ocorrências de vários espaços seguidos são
        substituídas por um único espaço;
        • indique se a String é um palíndromo.
*/

public class Ex4_2 {
    public static void main(String[] args){
        
        //DECLARAR VARIÀVEIS
		String input;

        //OBTER: STRING PARA PROGRAMA - USER INPUT
		Scanner in = new Scanner(System.in);
		System.out.println("Insira uma frase: ");
		input = in.nextLine();
		
		//OBTER: Nº DE DIGITOS - USAR A FUNÇÃO : countDigits(String s){...}
		System.out.printf("A string tem %d digitos! \n", countDigits(input));
		
		//OBTER: Nº DE ESPAÇOS
		System.out.printf("A string tem %d espaços! \n", countSpaces(input));
		
		//OBTER: VERIFICAR SE TEM APENAS MINUSCULAS - Função allLower
		if(allLower(input)) {
			System.out.printf("A string é composta apenas por minusculas \n");
		}
		else {
			System.out.printf("A string não é apenas composta por minusculas \n");
		}
		
		//OBTER: STRING SEM ESPAÇOS DUPLICADOS
		System.out.printf("A string sem espaços extra é: %s \n", doubleSpace(input));
		
		//OBTER: VERIFICAÇÃO SE É PALINDROMO - FUNÇÃO Pali
		
        if(Pal(input)) {
			System.out.println("A string é um palindromo ");
		}
		else {
			System.out.println("A string não é um palindromo ");
		}

        
		in.close();
	}
	

    //DECLARAÇÃO DE FUNÇÕES

	//Função que percorre todos os elementos da string e verifica se estes são digitos, contando o numero de digitos presentes.
	public static int countDigits(String s) {
		int count = 0;
		for (int i = 0; i < s.length(); i++ ) {
			if(String.valueOf(s.charAt(i)).matches("\\d")){
				count++;
			}
		}
		return count;
	}
		
	//Função que percorre todos os elementos da string e verifica se estes são espaços, contando o numero de digitos presentes.
	public static int countSpaces(String s1) {
		int count1 = 0;
		for (int k=0; k < s1.length(); k++ ) {
			if(String.valueOf(s1.charAt(k)).matches("\\s")){
				count1++;
			}
		}
		return count1;
	}
	
    //Funcão verifica se a string é apenas composta por minusculas
	public static boolean allLower(String s2) {
		return s2.toLowerCase().equals(s2);
	}

	//Função muda todos os multiplos espaços para apenas um espaço
	public static String doubleSpace(String s3) {
		s3 = s3.replaceAll("\\s+", " ");
		return s3;
	}
	
	//Função que verifica se a string é um palindromo comparando characteres em posição oposta na length 
	public static boolean Pal(String s4) {
		int count2 = 0; 
		for(int z=0; z < (s4.length()/2) ; z++) {
			if(String.valueOf(s4.charAt(z)).equals(String.valueOf(s4.charAt(s4.length()-z-1)))) {
				count2++;
			}
		}
		return (count2==(s4.length()/2) || count2==(s4.length()-0.5));
    }
}