package Aula2;

import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 2.7.:
->  Escreva um programa em Java que represente dois pontos, p1 e p2, pedindo que o utilizador
    introduza as suas coordenadas reais x e y. Calcule e imprima a distância entre os pontos.
    Sugestão: para calcular a raiz quadrada use a função Math.sqrt.
*/

public class Ex2_7 {
    public static void main(String[] args) {
		
		//DEFINIR VARIAVEIS
		double ponto1x, ponto1y, ponto2x, ponto2y, distanciaY, distanciaX, distanciaFinalPow2, distanciaFinal;
		
		//COORDENADAS
		Scanner sc = new Scanner(System.in);
		System.out.print("Insira a coordenada x do ponto 1(cm):");
		ponto1x = sc.nextDouble();
		System.out.print("Insira a coordenada y do ponto 1(cm):");
		ponto1y = sc.nextDouble();
		System.out.print("Insira a coordenada x do ponto 2(cm):");
		ponto2x = sc.nextDouble();
		System.out.print("Insira a coordenada y do ponto 2(cm):");
		ponto2y = sc.nextDouble();
		
		//CALCULAR DISTANCIAS DOS EIXOS
		if (ponto1x >= ponto2x) {
			distanciaX = ponto1x - ponto2x;
		} else {
			distanciaX = ponto2x - ponto1x;
		}
			
		if (ponto1y >= ponto2y) {
			distanciaY = ponto1y - ponto2y;
		} else {
			distanciaY = ponto2y - ponto1y;
		}
		
		//CALCULAR DISTANCIA REAL
		distanciaFinalPow2 = Math.pow(distanciaY, 2) + Math.pow(distanciaX, 2);
		distanciaFinal = Math.sqrt(distanciaFinalPow2);
		
		//RESULTADO
		System.out.println("A distancia entre os pontos é " + distanciaFinal + " cm." );
		sc.close();
		
    }
}
