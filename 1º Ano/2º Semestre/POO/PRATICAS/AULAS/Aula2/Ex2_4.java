package Aula2;

import java.util.InputMismatchException;
import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 2.4.:
->  Um fundo de investimento fornece uma taxa de juros mensal fixa, que acumula com o saldo
    anterior do investimento (juros rendem juros). Escreva um programa em Java que peça ao
    utilizador o montante investido e a taxa de juro mensal. Indique o valor total ao final de 3
    meses. (Por exemplo, para um investimento de 5000 euros e uma taxa de 1% o montante ao fim de 3
    meses será de 5151.505 euros).
*/

public class Ex2_4 {
    public static void main(String[] args) {
		System.out.println("Calculadora de valor monetário obtido mediante o seu Investimento e Taxa de Juro em vigor: "
							+ "\n Unidades de Medida: \n Investimento: Euros (€) \n Número de Meses: de 1 a 12 meses \n Taxa de Juro em Vigor: Percentagem (%).");

       	//DEFINIÇÃO DE VARIAVEIS:
		double investimento = -1.0, taxa = 1.0, total = 0;
		int meses = 0, r=1;

		while(r==1){
			
			
			while(investimento<0){
			
				try{
				Scanner in_invest = new Scanner(System.in);
				System.out.println("Valor do investimento inicial(€):");
				investimento = in_invest.nextDouble(); } 
				catch (InputMismatchException e) { System.out.println("Erro 1 : Valor do investimento tem que ser um número!"); }
			}

			while(meses<=0 || meses >12){
				try{
				Scanner in_meses = new Scanner(System.in);
				System.out.println("Numero de meses:");
				meses = in_meses.nextInt(); }
				catch (InputMismatchException e){ System.out.println("Erro 3 : Número de Meses tem que ser um número inteiro de 0 a 12 !"); }
			}
			
			while(taxa<=0 || taxa>100){
				try{
				Scanner in_taxa = new Scanner(System.in);
				System.out.println("Qual é a taxa de juros(%)?");
				taxa = in_taxa.nextDouble(); }
				catch(InputMismatchException e){ System.out.println("Erro 4: Taxa de juro tem que ser um número de 0 a 100 !"); }
			}
			
			//CALCULO TOTAL
			for(int m=1; m <= meses; m++) { total = investimento + investimento*(taxa/100); }
				
			//DISPLAY DE RESULTADOS
			System.out.printf(	"Com o investimento de : " + investimento + "€, e uma taxa de juro em vigor de" + taxa 
								+ "% ,o montante total na conta será de: ", total + "€");
		} 
	}
}
