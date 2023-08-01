package Aula3;

import java.util.Random;


/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 3.8.:
->  Altere o programa do exercício 1 de modo que seja possível processar todos os alunos de 
    uma turma que tem 16 alunos. Crie um vetor bidimensional para armazenar as notas de 
    componentes teórica e prática de todos os alunos e preenche-o com valores aleatórios (mas 
    válidos, i.e. as notas podem variar de 0.0 a 20.0).
*/

public class Ex3_8 {
    public static void main(String[] args){
        
        //DEFINIR VARIÀVEIS
        double notaTP=-1.0, notaP=-1.0, pauta;
        double tabNotas[][] = new double [16][2];
        int index=0;
        Random rand = new Random();

        //CABEÇALHO DE TABELA DE NOTAS
        System.out.println("Tabela de Notas de Turma: \n ");
        System.out.printf("%-10s %-10s %-10s \n", "NotaT", "NotaP", "Pauta" );

        while(index<16){

            //GERAR VALORES
            notaTP = rand.nextDouble()*20;
            notaP  = rand.nextDouble()*20;
            tabNotas[index][0] = notaTP;
            tabNotas[index][1] = notaP;
                
            //CONDIÇÕES DE SELECÇÃO
            if(notaTP>7.0 && notaP>7.0) {
                pauta = tabNotas[index][0] * 0.4 + tabNotas[index][1] * 0.6;
            }
            else {
                pauta = 66.0;
            }

            //PRINT DE RESULTADOS LINHA A LINHA
            System.out.printf("%-10.4s %-10.4s %-10.4s \n", notaTP, notaP, pauta);
            index++;
        }
    }
}
