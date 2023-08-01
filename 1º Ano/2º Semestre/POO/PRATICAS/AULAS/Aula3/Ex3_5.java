package Aula3;

import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 3.5.:
->  Um fundo de investimento fornece uma taxa de juros mensal fixa, que acumula com o saldo 
    anterior do investimento (juros rendem juros). Escreva um programa em Java que peça ao 
    utilizador o montante investido (positivo e múltiplo de 1000) e a taxa de juro mensal (entre 
    0% e 5%). Verifique se os valores são válidos e apresente o valor mensal do fundo nos 
    próximos 12 meses, imprimindo o valor em cada mês.
*/

public class Ex3_5 {
    public static void main(String[] args){
        //DEFINIR VARIÀVEIS
		int investimento, meses;
		double taxa, valorAtual,  mesA;
		meses = 12;
		
		//OBTER VALORES
		Scanner sc = new Scanner(System.in);
		System.out.print("Investimento inicial: ");
		investimento = sc.nextInt();
		System.out.print("Taxa de juros?");
		taxa = sc.nextDouble();
		valorAtual = investimento;
		
		//VALIDAÇÃO
		while(investimento%1000 != 0) {
			System.out.println("Montante de investimento invalido! Deve ser multiplo de 1000. \n");
			investimento = sc.nextInt();
		}
		
		while(!(0<=taxa && taxa<=5)) {
			System.out.println("Valor de taxa invalido! Deve inserir um valor entre 0 e 5. \n");
			taxa = sc.nextDouble();
		}
		
		//CALCULO FINAL
		do {
			valorAtual = valorAtual + valorAtual * taxa / 100;
			meses--;
			mesA = 12 - meses;
			System.out.printf(" -> %.0f Mês: %.2f EUROS. \n", mesA, valorAtual);
		}while(meses>0);
		sc.close();

    }
}
