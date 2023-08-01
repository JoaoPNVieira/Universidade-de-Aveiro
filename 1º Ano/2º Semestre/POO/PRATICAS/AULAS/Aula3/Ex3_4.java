package Aula3;

import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 3.4.:
->  Escreva um programa que leia um conjunto de números reais do teclado, terminado por um 
    valor igual ao primeiro que foi introduzido. No fim, indique o valor máximo, o valor mínimo, 
    a média e o total de número lidos.
*/

public class Ex3_4 {
    public static void main(String[] args){
        
        //DEFINIR VARIAVEIS
		int primeiro;
		double media, soma, numero, valorMax, valorMin, n;;
		
		//VALOR DO PRIMEIRO
		Scanner sc = new Scanner(System.in);
		System.out.print("Primeiro número: ");
		primeiro = sc.nextInt();
		valorMax = valorMin = primeiro; 
		soma = (double)primeiro;
		n = 1;
		
		//VERIFICAÇÃO DE NÚMEROS
		do {
			System.out.println("Próximo número: ");
			numero = sc.nextDouble();
			
			valorMin = ((int)numero<valorMin) ? (int)numero:valorMin;
			valorMax = ((int)numero>valorMax) ? (int)numero:valorMax;
			
			soma = soma + numero;
			n++;
			media = soma / n;
			} while(numero != primeiro);
		
		//mostrar resultados
		System.out.printf("A média dos valores é %.2f, sendo o valor maximo %.0f e o minimo %.0f, no total foram lidos %.0f numeros.", media,valorMax,valorMin,n);
		sc.close();
    
    
    
    
    }
}
