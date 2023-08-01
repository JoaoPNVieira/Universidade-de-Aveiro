package Aula2;

import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 2.5.:
->  Pretende-se calcular a velocidade média de transporte do ponto A para o ponto B sendo a
    viagem feita em duas etapas, cujo comprimento pode ser diferente. Escreva um programa que
    solicite a inserção da velocidade (v1) e distância (d1) percorrida no primeiro trajeto, bem
    como a velocidade (v2) e a distância (d2) percorrida no segundo trajeto. Com base nestes
    valores calcule e imprime a velocidade média final.
*/


public class Ex2_5 {
    public static void main(String[] args) {
		
		//DEFINIR VARIAVEIS
		double distP, velP, distS, velS, velMedFinal;
		
		//VALORES
		
        Scanner inP = new Scanner(System.in);
		System.out.println("Velocidade na Primeira metade do percurso(km/h):");
		velP = inP.nextDouble();

        Scanner in_distP = new Scanner(System.in);
        System.out.println("Distancia percurrida na Primeira metade do percurso(km):");
        distP = in_distP.nextDouble(); 

        Scanner inS = new Scanner(System.in);
        System.out.println("Velocidade na Segunda metade do percurso(km/h):");
		velS = inS.nextDouble();

        Scanner in_distS = new Scanner(System.in);
        System.out.println("Distancia percurrida na Segunda metade do percurso(km)::");
        distP = in_distS.nextDouble(); 

		//CALCULO 
        //velP = 
		velMedFinal = (velP + velS) / 2; //não é isto! 
		
		//DISPLAY DE RESULTADOS
		System.out.printf("A velocidade média neste percurso foi de %.2f km/h.", velMedFinal);
		inP.close();
		inS.close();
	}
}
