package Aula3;

import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 3.6.:
->  Escreva um programa que lê do teclado uma data composta pelo mês e o ano (validando-os), 
    calcule e escreva no monitor o número de dias desse mês. Nota: não se esqueça dos anos bissextos.
*/

public class Ex3_6 {
    public static void main(String[] args){
        
        //DEFINIR VARIÀVEIS 
        int mes, ano; 
                
        //OBTER VALORES
        Scanner sc = new Scanner(System.in);
        System.out.print("Mês: ");
        mes = sc.nextInt();
        System.out.print("Ano: ");
        ano = sc.nextInt();

        //VALIDAR
        while(mes<1 || mes>12) {
            System.out.println("Inserir um mês valido entre 1 e 12. \n");
            mes = sc.nextInt();
        }

        while(ano<0 || ano > 5000) {
            System.out.println("Inserir um ano valido entre 0 e 12. \n");
            ano = sc.nextInt();
        }

        //CALCULO DIAS DE CADA MÊS
        if(mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12) {
            System.out.println("Mês tem 31 dias.");
        }

        else if(mes == 4 || mes == 6 || mes == 9 || mes == 11) {
            System.out.println("Mês tem 30 dias.");
        }

        //ANO BISSEXTO - MÊS: FEVEREIRO
        else {
            
            if(ano%4==0 || (ano%100==0 && ano%400==0)) {
                System.out.println("Mês tem 29 dias.");
            }
            else {
                System.out.println("Mês tem 28 dias.");
            }
        }
        sc.close();
    }
}
