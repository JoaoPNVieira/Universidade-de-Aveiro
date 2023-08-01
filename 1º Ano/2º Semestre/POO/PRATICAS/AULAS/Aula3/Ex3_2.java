package Aula3;

import java.util.InputMismatchException;
import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 3.2.:
->  Escreva um programa que imprima uma contagem decrescente (até 0) a partir de um valor 
    positivo N, introduzido pelo utilizador através do teclado
*/

public class Ex3_2 {

    public static void main(String[] args){
        System.out.println("Contagem Decrescente!");
       
        //DEFINIR VARIAVEL
        int numb=-1, r=1;
        
        while(r==1){
            try{
                while(numb<0) {
                    System.out.print("Qual é o teu número? (n>0): ");
                    Scanner inNumb = new Scanner(System.in);
                    numb = inNumb.nextInt();  
                    
                    if(numb<0) { 
                        System.out.println("Número escolhido é inferior a 0! Insira novamente: "); 
                    }
                    inNumb.close();
                }

                while(numb>0) { 

                    System.out.println(numb); numb--;
                    if(numb==0){ 
                        System.out.println(numb); r = 0; 
                    } 
                }
            } catch(InputMismatchException e) {
                System.out.println("Erro1: Número inserido inválido!"); 
            }
        }
    }
}

