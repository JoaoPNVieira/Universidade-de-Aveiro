package Aula3;

import java.util.InputMismatchException;
import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 3.1.:
->  Implemente um programa que leia do teclado, as notas da componente prática (notaP) e
    teórica (notaT) de um aluno (ambas arredondadas às décimas) e imprima no terminal a nota
    final, calculada da seguinte forma:
    • 66 (reprovado por nota mínima), se tiver obtido menos do que 7.0 em pelo menos
    uma das componentes;
    • 0.4 * notaT + 0.6 * notaP (arredondada a unidades), nos restantes casos.
    
    Nota: Verifique se os valores introduzidos pelo utilizador são válidos [0..20].
*/
public class Ex3_1 {
    public static void main(String[] args) {

    //DEFINIR VARIÀVEIS
    double notaTP=-1.0, notaP=-1.0, notaFinal;
    int r=1;
    System.out.println("Calculo de Nota Final: ");

    while(r==1){
        try{
            //OBTER VALORES
            while(notaTP<0 || notaTP>20 || notaP<0 || notaP>20 ) {

                Scanner inTP = new Scanner(System.in);
                System.out.print("Introduza a Nota Teórica: ");
                notaTP = inTP.nextDouble();
                Scanner inP = new Scanner(System.in);
                System.out.print("Introduza a Nota Prática: ");
                notaP = inP.nextDouble();

            if(notaTP<0 || notaTP>20 || notaP<0 || notaP>20 ) {
                System.out.println("Notas TP ou P inválidas. Insira Notas entre [0..20]"); } 

            else if(notaTP<7.0 || notaP<7.0) {
                notaFinal = 66.0; r = 0; inTP.close();inP.close(); } 
                
            else {
                notaFinal = (notaTP * 0.4) + (notaP * 0.6); 
                r = 0;
                inTP.close();inP.close();
                System.out.println("Nota Final: " + notaFinal); } } 
        } 
        catch (InputMismatchException e) {
            System.out.println("Erro 1 : Valor de nota teórica e/ou prática introduzido não é número!"); 
        }
    }
}}
