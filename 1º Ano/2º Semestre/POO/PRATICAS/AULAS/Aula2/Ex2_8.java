package Aula2;

import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 2.8.:
->  Dado um triângulo retângulo de catetos A e B e hipotenusa C, escreva um programa que leia
    o valor dos catetos e determine o valor da hipotenusa, bem como o valor do ângulo (em
    graus) entre o lado A e a hipotenusa.
*/

public class Ex2_8 {
    public static void main(String[] args) {
		
		//DEFINIR VARIAVEIS
		double ladoA, ladoB, anguloRadianos, anguloGraus, hipotenusa;
		
		//VALORES
		Scanner scLadoA = new Scanner(System.in);
		Scanner scLadoB = new Scanner(System.in);
		System.out.println("Insira o comprimento do lado A");
		ladoA = scLadoA.nextDouble();
		System.out.println("Insira o comprimento do lado B");
		ladoB = scLadoB.nextDouble();
		
		//CALCULAR
		anguloRadianos = Math.atan2(ladoA, ladoB);
		anguloGraus = Math.toDegrees(anguloRadianos);
        hipotenusa = Math.sqrt((ladoA*ladoA) + (ladoB*ladoB));
	
		//MOSTRAR VALORES
		System.out.printf("Angulo = %.2f graus", anguloGraus);
		System.out.printf("Hipotenusa: ", hipotenusa);
        scLadoA.close();
		scLadoB.close();
		
}
}
